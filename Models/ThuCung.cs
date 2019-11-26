namespace Petshop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuCung")]
    public partial class ThuCung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThuCung()
        {
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        [Key]
        public int MaThuCung { get; set; }

        [StringLength(50)]
        public string TenThuCung { get; set; }

        [StringLength(50)]
        public string MauLong { get; set; }

        public double? CanNang { get; set; }

        public int? Tuoi { get; set; }

        public int? MaLoai { get; set; }

        public int? MaChungLoai { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        public long? Gia { get; set; }

        public string MoTa { get; set; }

        public int? SoLuong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual ChungLoai ChungLoai { get; set; }

        public virtual Loai Loai { get; set; }
    }
}
