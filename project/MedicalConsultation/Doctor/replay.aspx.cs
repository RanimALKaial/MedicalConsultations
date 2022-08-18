using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MedicalConsultation.Doctor
{
    public partial class replay : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
            string s = "SELECT   Counseling.Counseling ,Counseling.replay ,image_path from Counseling where id='"+Request.QueryString["id"]+"'";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            t1.InnerText = dt.Rows[0]["Counseling"].ToString();
            t2.InnerText= dt.Rows[0]["replay"].ToString();
            img.ImageUrl = "../Patient/images/"+ dt.Rows[0]["image_path"].ToString();

            }
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string s = Request.Form["t2"].ToString();
            string s1 = "update  Counseling set replay= '" + s + "' where id='" + Request.QueryString["id"] + "'";
            SqlCommand cmd1 = new SqlCommand(s1, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            l1.ForeColor = System.Drawing.Color.Green;
            l1.Text = "Successfully Update";

        }
    }
}