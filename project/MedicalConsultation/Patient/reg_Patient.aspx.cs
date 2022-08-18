using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MedicalConsultation.Patient
{
    public partial class reg_Patient : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string num = " select isnull(max(user_id), 0)+1 from reg_Patient";
            SqlCommand cm = new SqlCommand(num, con);
            con.Open();
            int id = Convert.ToInt32(cm.ExecuteScalar());
            con.Close();
            string s1 = "insert into reg_Patient values( '" + id + "','" + t1.Text + "','" + t2.Text + "','" +t3.Text+ "','" + t4.Text + "','" + t5.Text + "','"+t6.Text+"','"+d1.SelectedValue.ToString()+"')";
            SqlCommand cmd1 = new SqlCommand(s1, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            l1.ForeColor = System.Drawing.Color.Green;
            l1.Text = "Successfully added";
            Response.Redirect("login.aspx");
        }
    }
}