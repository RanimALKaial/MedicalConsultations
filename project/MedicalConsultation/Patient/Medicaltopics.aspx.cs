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
    public partial class Medicaltopics : System.Web.UI.Page
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
                string s = "select id,imagepath,title,date,views,SUBSTRING(Medicaltopics.description, 1,40)  as description from Medicaltopics";
                SqlCommand cmd = new SqlCommand(s, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rbr1.DataSource = dt;
                rbr1.DataBind();

            }
        }

    }
}