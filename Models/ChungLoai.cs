namespace Petshop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChungLoai")]
    public partial class ChungLoai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChungLoai()
        {
            ThuCungs = new HashSet<ThuCung>();
        }

        [Key]
        public int MaChungLoai { get; set; }

        [StringLength(50)]
        public string TenChungLoai { get; set; }

        public int? MaLoai { get; set; }

        public virtual Loai Loai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThuCung> ThuCungs { get; set; }
    }
}
