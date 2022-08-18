using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MedicalConsultation.Admin
{
    public partial class AddMedicalSpecialty : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string num = " select isnull(max(s_id), 0)+1 from Medical_specialty";
            SqlCommand cm = new SqlCommand(num, con);
            con.Open();
            int id = Convert.ToInt32(cm.ExecuteScalar());
            con.Close();
            string s1 = "insert into Medical_specialty values( '" + id + "','" + t1.Text + "')";
            SqlCommand cmd1 = new SqlCommand(s1, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            l1.ForeColor = System.Drawing.Color.Green;
            l1.Text = "Successfully added";

        }
    }
}