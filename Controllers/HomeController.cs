using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;
using PagedList;

namespace Petshop.Controllers
{
    public class HomeController : Controller
    {
        public DataProvider db = new DataProvider();
        public ActionResult Index()
        {
            var kq = db.ChiTietDonHangs.GroupBy(x => x.MaThuCung).Select(x=>new { id=x.Key, sl=x.Count()});
            var rs = kq.OrderByDescending(s => s.sl).Take(6);
            List<ThuCung> p = new List<ThuCung>();
            foreach(var item in rs)
            {
                ThuCung pet = db.ThuCungs.SingleOrDefault(x => x.MaThuCung == item.id);
                p.Add(pet);
            }
            return View(p.Take(6));
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult ChungLoai(int? page, int ID)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 6;
            List<ThuCung> dsThuCung = db.ThuCungs.Where(x => x.MaLoai == ID).OrderBy(b=>b.MaThuCung).ToList();
            ViewBag.idloai = ID;
            return View(dsThuCung.ToPagedList(pageNumber,pageSize));
        }
    }
}