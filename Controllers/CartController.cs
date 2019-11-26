using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;

namespace Petshop.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public DataProvider db = new DataProvider();
        public GioHang GetCart()
        {
            GioHang giohang = (GioHang)Session["Cart"];
            if(giohang == null)
            {
                giohang = new GioHang();
                Session["Cart"] = giohang;
            }
            return giohang;
        }
        public ActionResult Index()
        {
            GioHang giohang = GetCart();
            return View(giohang);
        }
        public ActionResult Add(int ID)
        {
            GioHang giohang = GetCart();
            ThuCung x = db.ThuCungs.Find(ID);
            if (x == null)
                return View("Error");
            SanPham p = new SanPham(x.MaThuCung, x.TenThuCung, x.HinhAnh, (long)x.Gia, 1);
            giohang.AddToCart(p);
            return RedirectToAction("Index");
        }
        public ActionResult Update(int Unit, int Id)
        {
            GioHang giohang = GetCart();
            giohang.Update(Id, Unit);
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int ID)
        {
            GioHang giohang = GetCart();
            giohang.Delete(ID);
            return RedirectToAction("Index");
        }
    }
}