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
    public partial class ViewReplay : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                string s = "SELECT   Counseling.Counseling ,Counseling.replay from Counseling where id='" + Request.QueryString["id"] + "'";
                SqlCommand cmd = new SqlCommand(s, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                t1.InnerText = dt.Rows[0]["Counseling"].ToString();
                t2.InnerText = dt.Rows[0]["replay"].ToString();

            }

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string txt = Request.Form["t3"].ToString();
            string s1 = "update  Counseling set Counseling='"+txt+ "' where id='" + Request.QueryString["id"] + "'";
            SqlCommand cmd1 = new SqlCommand(s1, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            l1.ForeColor = System.Drawing.Color.Green;
            l1.Text = "تم إرسال الرد بنجاح ";

        }
    }
}