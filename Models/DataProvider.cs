namespace Petshop.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DataProvider : DbContext
    {
        public DataProvider()
            : base("name=DataProvider")
        {
        }

        public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual DbSet<ChungLoai> ChungLoais { get; set; }
        public virtual DbSet<DonDatHang> DonDatHangs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Loai> Loais { get; set; }
        public virtual DbSet<NguoiQuanTri> NguoiQuanTris { get; set; }
        public virtual DbSet<ThuCung> ThuCungs { get; set; }
        public virtual DbSet<TinTuc> TinTucs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiQuanTri>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<ThuCung>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<TinTuc>()
                .Property(e => e.Image)
                .IsUnicode(false);
        }
    }
}
