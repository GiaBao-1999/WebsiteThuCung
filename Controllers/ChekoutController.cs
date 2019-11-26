using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;

namespace Petshop.Controllers
{
    public class ChekoutController : Controller
    {
        // GET: Chekout
        public DataProvider db = new DataProvider();
        public ActionResult Index()
        {
            GioHang cart = (GioHang)Session["Cart"];
            KhachHang customer = (KhachHang)Session["KhachHang"];
            if (customer == null)
            {
                Session["PageRequest"] = "Chekout";
                return RedirectToAction("Login", "KhachHang");
            }
            return View(cart);
        }
        public ActionResult DatHang()
        {
            string diachi = Request.Form["Address"];
            GioHang cart = (GioHang)Session["Cart"];
            KhachHang customer = (KhachHang)Session["KhachHang"];
            DonDatHang donhang = new DonDatHang();
            donhang.DiaChi = diachi;
            donhang.NgayDat = DateTime.Now;
            donhang.MaKhachHang = customer.MaKhachHang;
            donhang.TrangThai = false;
            db.DonDatHangs.Add(donhang);
            foreach(SanPham c in cart.Cart)
            {
                ChiTietDonHang ctdonhang = new ChiTietDonHang();
                ctdonhang.MaThuCung = c.MaSanPham;
                ctdonhang.SoLuong = c.SoLuong;
                ctdonhang.Gia = c.Gia;
                ctdonhang.DonDatHang = donhang;
                db.ChiTietDonHangs.Add(ctdonhang);
            }
            db.SaveChanges();
            return View();
        }
    }
}