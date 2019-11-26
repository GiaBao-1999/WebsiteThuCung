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
    public class ManagermentChungLoaisController : Controller
    {
        private DataProvider db = new DataProvider();

        // GET: Admin/ManagermentChungLoais
        public ActionResult Index()
        {
            var chungLoais = db.ChungLoais.Include(c => c.Loai);
            return View(chungLoais.ToList());
        }

        // GET: Admin/ManagermentChungLoais/Create
        public ActionResult Create()
        {
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai");
            return View();
        }

        // POST: Admin/ManagermentChungLoais/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaChungLoai,TenChungLoai,MaLoai")] ChungLoai chungLoai)
        {
            if (ModelState.IsValid)
            {
                db.ChungLoais.Add(chungLoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai", chungLoai.MaLoai);
            return View(chungLoai);
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ChungLoai chungLoai = db.ChungLoais.Find(id);
            if (chungLoai == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai", chungLoai.MaLoai);
            return View(chungLoai);
        }

        [HttpPost]
        public ActionResult Edit(ChungLoai chungLoai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chungLoai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLoai = new SelectList(db.Loais, "MaLoai", "TenLoai", chungLoai.MaLoai);
            return View(chungLoai);
        }

        public ActionResult Delete(int id)
        {
            ChungLoai chungLoai = db.ChungLoais.Find(id);
            var p = db.ThuCungs.Where(x => x.MaChungLoai == chungLoai.MaChungLoai);
            if(p != null)
            {
                ModelState.AddModelError("", "Chủng loại này đã có sản phẩm");
            }
            else
            {
                db.ChungLoais.Remove(chungLoai);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

    }
}
