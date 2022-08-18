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
    public partial class PatientHome : System.Web.UI.Page
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
                fillpage();

            }
           

        }
        public void fillpage()
        {
            string s = "SELECT Counseling.id, reg_Patient.name, reg_Patient.age ,reg_Patient.gender ,Counseling.disease_date ,SUBSTRING(Counseling.Counseling,1,40) as Counseling ,Counseling.Counseling_date ,SUBSTRING(Counseling.replay,1,40)  as replay ,image_path from reg_Patient,Counseling where reg_Patient.user_id=Counseling.user_id and reg_Patient.user_id='" + Session["user_id"]+"'";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rbr.DataSource = dt;
            rbr.DataBind();

        }
    }
}