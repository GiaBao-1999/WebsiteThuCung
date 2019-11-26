using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;

namespace Petshop.Areas.Admin.Controllers
{
    public class ManagermentLoaisController : Controller
    {
        private DataProvider db = new DataProvider();

        // GET: Admin/ManagermentLoais
        public ActionResult Index()
        {
            return View(db.Loais.ToList());
        }

        // GET: Admin/ManagermentLoais/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ManagermentLoais/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLoai,TenLoai")] Loai loai)
        {
            if (ModelState.IsValid)
            {
                db.Loais.Add(loai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loai);
        }

        // GET: Admin/ManagermentLoais/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Loai loai = db.Loais.Find(id);
            if (loai == null)
            {
                return HttpNotFound();
            }
            return View(loai);
        }

        // POST: Admin/ManagermentLoais/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLoai,TenLoai")] Loai loai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loai);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            Loai loai = db.Loais.Find(id);
            var p = db.ThuCungs.Where(x => x.MaLoai == loai.MaLoai);
            var chl = db.ChungLoais.Where(x => x.MaLoai == loai.MaLoai);
            if(p != null || chl != null)
            {
                ModelState.AddModelError("", "Không thể xóa!");
            } 
            else
            {
                db.Loais.Remove(loai);
                db.SaveChanges();
            }
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
