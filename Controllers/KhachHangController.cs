using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;

namespace Petshop.Controllers
{
    public class KhachHangController : Controller
    {
        // GET: KhachHang
        public DataProvider db = new DataProvider();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(KhachHangViewLoginModel model)
        {
            string pass = MaHoa.MD5(model.Password);
            KhachHang k = db.KhachHangs.SingleOrDefault(x => x.Email.Equals(model.Email) && x.MatKhau.Equals(pass));
            if(k == null)
            {
                ModelState.AddModelError("", "Đăng nhập thất bại! Email hoặc mật khẩu không chính xác");
                return View();
            }
            Session["KhachHang"] = k;
            string pagerequest = (string)Session["PageRequest"];
            if (pagerequest == "Chekout")
                return RedirectToAction("Index", "Chekout");
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(KhachHangViewRegisterModel model)
        {
            KhachHang x = db.KhachHangs.SingleOrDefault(m => m.Email.Equals(model.Email));
            if(x!=null)
            {
                ModelState.AddModelError("", "Email đã tồn tại");
                return View();
            }
            KhachHang k = new KhachHang();
            k.HoTen = model.HoTen;
            k.Email = model.Email;
            k.SoDienThoai = model.SoDienThoai;
            k.MatKhau = MaHoa.MD5(model.MatKhau);
            db.KhachHangs.Add(k);
            db.SaveChanges();
            Session["KhachHang"] = k;
            return RedirectToAction("Index", "Home");
        }
        public ActionResult LogOff()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult ViewBill(int? MaDonHang)
        {
            KhachHang customer = (KhachHang)Session["KhachHang"];
            List<DonDatHang> listdonhang = db.DonDatHangs.Where(x => x.MaKhachHang == customer.MaKhachHang).ToList();
            if (MaDonHang != null)
                ViewBag.madon = MaDonHang;
            return View(listdonhang);
        }
    }
}