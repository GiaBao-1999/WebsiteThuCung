using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;
using PagedList;

namespace Petshop.Areas.Admin.Controllers
{
    public class ManagermentThuCungsController : Controller
    {
        private DataProvider db = new DataProvider();

        // GET: Admin/ManagermentThuCungs
        public ActionResult Index(int? page)
        {
            var thuCungs = db.ThuCungs.Include(t => t.ChungLoai).Include(t => t.Loai).OrderBy(x=>x.MaThuCung);
            int pageNumber = (page ?? 1);
            int pageSize = 10;
            return View(thuCungs.ToPagedList(pageNumber,pageSize));
        }

        // GET: Admin/ManagermentThuCungs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuCung thuCung = db.ThuCungs.Find(id);
            if (thuCung == null)
            {
                return HttpNotFound();
            }
            return View(thuCung);
        }

        // GET: Admin/ManagermentThuCungs/Create
        public ActionResult Create()
        {
            ViewBag.MaChungLoai = new SelectList(db.ChungLoais, "MaChungLoai", "TenChungLoai");
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai");
            return View();
        }

        // POST: Admin/ManagermentThuCungs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaThuCung,TenThuCung,MauLong,CanNang,Tuoi,MaLoai,MaChungLoai,HinhAnh,Gia,MoTa,SoLuong")] ThuCung thuCung)
        {
            if (ModelState.IsValid)
            {
                db.ThuCungs.Add(thuCung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaChungLoai = new SelectList(db.ChungLoais, "MaChungLoai", "TenChungLoai", thuCung.MaChungLoai);
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai", thuCung.MaLoai);
            return View(thuCung);
        }

        // GET: Admin/ManagermentThuCungs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuCung thuCung = db.ThuCungs.Find(id);
            if (thuCung == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaChungLoai = new SelectList(db.ChungLoais, "MaChungLoai", "TenChungLoai", thuCung.MaChungLoai);
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai", thuCung.MaLoai);
            return View(thuCung);
        }

        // POST: Admin/ManagermentThuCungs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaThuCung,TenThuCung,MauLong,CanNang,Tuoi,MaLoai,MaChungLoai,HinhAnh,Gia,MoTa,SoLuong")] ThuCung thuCung)
        {
            if (ModelState.IsValid)
            {
                var file = Request.Files["HinhAnh"];
                if(file.FileName!=null && file.ContentLength>0)
                {
                    string path = Server.MapPath("~/Content/img/Pet/" + file.FileName);
                    file.SaveAs(path);
                    thuCung.HinhAnh = file.FileName;
                }
                db.Entry(thuCung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaChungLoai = new SelectList(db.ChungLoais, "MaChungLoai", "TenChungLoai", thuCung.MaChungLoai);
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai", thuCung.MaLoai);
            return View(thuCung);
        }

        // GET: Admin/ManagermentThuCungs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThuCung thuCung = db.ThuCungs.Find(id);
            if (thuCung == null)
            {
                return HttpNotFound();
            }
            return View(thuCung);
        }

        // POST: Admin/ManagermentThuCungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ThuCung thuCung = db.ThuCungs.Find(id);
            db.ThuCungs.Remove(thuCung);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
