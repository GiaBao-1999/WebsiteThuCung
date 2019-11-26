namespace Petshop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietDonHang")]
    public partial class ChiTietDonHang
    {
        [Key]
        public int MaChiTiet { get; set; }

        public int? MaDon { get; set; }

        public int? MaThuCung { get; set; }

        public int? SoLuong { get; set; }

        public long? Gia { get; set; }

        public virtual DonDatHang DonDatHang { get; set; }

        public virtual ThuCung ThuCung { get; set; }
    }
}
