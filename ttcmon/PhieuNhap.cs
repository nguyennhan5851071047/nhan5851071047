using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace ttcmon
{
    public partial class PhieuNhap : Form
    {
        public PhieuNhap()
        {
            InitializeComponent();
            LoadDL();
        }      
        public void LoadDL()
        {
            string query = " select * from PhieuNhap";
            DataTable data = Connectcs.Instance.excuteQuery(query);
            dtg1.DataSource = data;

        }

        private void PhieuNhap_Load(object sender, EventArgs e)
        {

        }

        private void dtg1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
            {
                return;
            }
            else
            {
                txtMaPN.Text = dtg1.Rows[row].Cells["MaPN"].Value.ToString();

                txtNgayLapPN.Text = dtg1.Rows[row].Cells["NgayLapPN"].Value.ToString();
                txtTongTienNhap.Text = dtg1.Rows[row].Cells["TongTienNhap"].Value.ToString();
                txtTinhTrang.Text = dtg1.Rows[row].Cells["TinhTrang"].Value.ToString();
                txtMaNCC.Text = dtg1.Rows[row].Cells["MaNCC"].Value.ToString();
                txtMaNV.Text = dtg1.Rows[row].Cells["MaNV"].Value.ToString();            
            }

        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (txtMaPN.Text == "")
            {
                MessageBox.Show("vui long nhap du thong tin");
            }
            else
                //{
                //    if (kiemtra(txtMaPN.Text) == true)
                //    {
                //        MessageBox.Show("ma da ton tai");
                //        return;
                //}
                try
                {
                    string query = "insert into PhieuNhap values (N'" + txtMaPN.Text + "','" + txtNgayLapPN.Text + "','" + txtTongTienNhap.Text + "','" + txtTinhTrang.Text + "','" + txtMaNCC.Text + "','" + txtMaNV.Text + "')";
                    DataTable data = Connectcs.Instance.excuteQuery(query);
                    MessageBox.Show("Thêm thanh cong");
                    LoadDL();
                }
                catch
                {
                    MessageBox.Show("Thêm that bai");
                }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMaPN.Text == "")
            {
                MessageBox.Show("vui long chon dong can sua");
            }
            else
            {
                try
                {
                    string query = "update PhieuNhap set NgayLapPN=N'" + txtNgayLapPN.Text + "',TongTienNhap='" + txtTongTienNhap.Text + "',TinhTrang='" + txtTinhTrang.Text + "',MaNCC=N'" + txtMaNCC.Text + "',MaNV='" + txtMaNV.Text + "' Where MaPN='" + txtMaPN.Text + "'";
                    DataTable data = Connectcs.Instance.excuteQuery(query);
                    MessageBox.Show(" sua thanh cong");
                    LoadDL();

                }
                catch
                {
                    MessageBox.Show(" Sua That bại");
                }

            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtMaPN.Text == "")
            {
                MessageBox.Show("vui long chon dong can xoa");
            }
            else
            {
                try
                {
                    string query = " delete NhanVien where MaPN='" + txtMaPN.Text + "'";
                    DataTable data = Connectcs.Instance.excuteQuery(query);
                    MessageBox.Show(" xóa thanh cong");
                    LoadDL();
                }
                catch
                {
                    MessageBox.Show(" Xóa Thất Bại");
                }


            }
        }
    }
}
