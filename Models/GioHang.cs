using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Petshop.Models
{
    public class GioHang
    {
        private List<SanPham> listSanPham;
        public GioHang()
        {
            listSanPham = new List<SanPham>();
        }
        public List<SanPham> Cart
        {
            get { return listSanPham; }
        }
        public void AddToCart(SanPham p)
        {
            SanPham x = listSanPham.SingleOrDefault(m => m.MaSanPham == p.MaSanPham);
            if (x == null)
                listSanPham.Add(p);
            else
                x.SoLuong++;
        }
        public void Delete(int id)
        {
            SanPham x = listSanPham.SingleOrDefault(m => m.MaSanPham == id);
            if (x != null)
                listSanPham.Remove(x);
        }
        public void Update(int id, int soluong)
        {
            SanPham x = listSanPham.SingleOrDefault(m => m.MaSanPham == id);
            if(x != null)
            {
                if (soluong > 0)
                    x.SoLuong = soluong;
                else
                    listSanPham.Remove(x);
            }
        }
        public long TongTien()
        {
            long tt = 0;
            foreach(SanPham x in listSanPham)
            {
                tt += x.ThanhTien;
            }
            return tt;
        }
    }
    public class SanPham
    {
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public string HinhAnh { get; set; }
        public long Gia { get; set; }
        public int SoLuong { get; set; }
        public long ThanhTien
        {
            get { return SoLuong * Gia; }
        }
        public SanPham()
        { }
        public SanPham(int id, string name, string img, long price, int unit)
        {
            this.MaSanPham = id;
            this.TenSanPham = name;
            this.HinhAnh = img;
            this.Gia = price;
            this.SoLuong = unit;
        }
    }
}