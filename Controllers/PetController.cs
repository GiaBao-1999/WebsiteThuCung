using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Petshop.Models;

namespace Petshop.Controllers
{
    public class PetController : Controller
    {
        // GET: Pet
        public DataProvider db = new DataProvider();
        public ActionResult Index(int ID)
        {
            ThuCung pet = db.ThuCungs.Find(ID);
            if (pet == null)
                return View("Error");
            return View(pet);
        }
    }
}