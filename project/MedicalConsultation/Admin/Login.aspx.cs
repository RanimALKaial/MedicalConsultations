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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string s = "select * from login where user_name='" + t1.Text + "' and password='" + t2.Text + "'";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("DoctorList.aspx");
            }
            else
            {
                l1.ForeColor = System.Drawing.Color.Red;
                l1.Text = "invalid user name or password";
            }
        }
    }
}