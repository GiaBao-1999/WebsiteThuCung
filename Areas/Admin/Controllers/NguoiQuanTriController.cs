using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;
using Petshop.Areas.Admin.Models;

namespace Petshop.Areas.Admin.Controllers
{
    public class NguoiQuanTriController : Controller
    {
        // GET: Admin/NguoiQuanTri
        public DataProvider db = new DataProvider();
        public ActionResult Index()
        {
            NguoiQuanTri manager = (NguoiQuanTri)Session["Admin"];
            if (manager == null)
                return RedirectToAction("Login");
            ViewBag.slkhachhang = db.KhachHangs.Count();
            ViewBag.slsanpham = db.ThuCungs.Count();
            ViewBag.sldonhang = db.DonDatHangs.Count();
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View("LoginAdmin");
        }
        [HttpPost]
        public ActionResult Login(LoginView model)
        {
            if(ModelState.IsValid)
            {
                string pass = MaHoa.MD5(model.Password);
                NguoiQuanTri manager = db.NguoiQuanTris.SingleOrDefault(x => x.Username.Equals(model.Username) && x.Password.Equals(pass));
                if (manager == null)
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                    return View("LoginAdmin");
                }
                Session["Admin"] = manager;
                return RedirectToAction("Index");
            }
            return View("LoginAdmin");
        }
    }
}