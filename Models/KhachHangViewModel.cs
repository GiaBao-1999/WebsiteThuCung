using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Petshop.Models
{
    public class KhachHangViewLoginModel
    {
        [Required(ErrorMessage ="Email không được rỗng")]
        [EmailAddress(ErrorMessage ="Email không hợp lệ")]
        public string Email { get; set; }
        [Required(ErrorMessage ="Mật khẩu không được rỗng")]
        [Display(Name ="Mật khẩu")]
        public string Password { get; set; }
    }
    public class KhachHangViewRegisterModel
    {
        [StringLength(50)]
        [Required(ErrorMessage = "Họ tên không được rỗng")]
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        [StringLength(50)]
        [Required(ErrorMessage = "Email không được rỗng")]
        [EmailAddress(ErrorMessage = "Email không hợp lệ")]
        public string Email { get; set; }
        [StringLength(10)]
        [Required(ErrorMessage = "Số điện thoại không được rỗng")]
        [RegularExpression("\\d{10}", ErrorMessage = "Số điện thoại không hợp lệ")]
        [Display(Name = "Số điện thoại")]
        public string SoDienThoai { get; set; }
        [Required(ErrorMessage = "Mật khẩu không được rỗng")]
        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }
        [Required(ErrorMessage = "Mật khẩu nhập lại không được rỗng")]
        [Display(Name = "Mật khẩu nhập lại")]
        [Compare("MatKhau",ErrorMessage ="Mật khẩu nhập lại không khớp")]
        public string MatKhauNhapLai { get; set; }
    }
}