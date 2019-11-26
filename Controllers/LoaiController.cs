using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;
using PagedList;

namespace Petshop.Controllers
{
    public class LoaiController : Controller
    {
        // GET: Loai
        public DataProvider db = new DataProvider();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ChungLoaiTheoLoai(int? page, int maloai, int machungloai)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 3;
            List<ThuCung> dsThuCung = db.ThuCungs.Where(x => x.MaLoai == maloai && x.MaChungLoai == machungloai).OrderBy(b => b.MaThuCung).ToList();
            ViewBag.idloai = maloai;
            ViewBag.chungloai = machungloai;
            return View(dsThuCung.ToPagedList(pageNumber,pageSize));
        }
    }
}