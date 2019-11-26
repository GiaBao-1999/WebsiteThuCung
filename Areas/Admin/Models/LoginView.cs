using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Petshop.Areas.Admin.Models
{
    public class LoginView
    {
        [Required(ErrorMessage ="Username không được rỗng")]
        public string Username { get; set; }
        [Required(ErrorMessage ="Password không được rỗng")]
        public string Password { get; set; }
    }
}