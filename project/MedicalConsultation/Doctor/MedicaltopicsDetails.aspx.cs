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
    public partial class MedicaltopicsDetails : System.Web.UI.Page
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
            fillpage();

            }

        }
        public void fillpage()
        {
            string s = "select description ,imagepath from Medicaltopics where id='" + Request.QueryString["id"]+"'";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rbr.DataSource = dt;
            rbr.DataBind();
        }
    }
}