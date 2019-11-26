using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;

namespace Petshop.Controllers
{
    public class SearchController : Controller
    {
        public DataProvider db = new DataProvider();
        // GET: Search
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TimKiem(string keyword)
        {
            var model = db.ThuCungs.Where(x => x.TenThuCung.Contains(keyword)).ToList();
            return PartialView(model);
        }
    }
}