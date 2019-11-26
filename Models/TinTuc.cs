namespace Petshop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TinTuc")]
    public partial class TinTuc
    {
        [Key]
        public int IDTinTuc { get; set; }

        public string NoiDung { get; set; }

        public int? ID { get; set; }

        public bool? AnHien { get; set; }

        [StringLength(100)]
        public string Image { get; set; }

        public virtual NguoiQuanTri NguoiQuanTri { get; set; }
    }
}
