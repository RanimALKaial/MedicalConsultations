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
    public partial class Counseling : System.Web.UI.Page
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
            string s = "SELECT Counseling.id, reg_Patient.name, reg_Patient.age ,reg_Patient.gender ,Counseling.disease_date ,SUBSTRING(Counseling.Counseling,1,40) as Counseling ,Counseling.Counseling_date ,SUBSTRING(Counseling.replay,1,40) as replay, image_path from reg_Patient,Counseling where reg_Patient.user_id=Counseling.user_id and Counseling.s_id='" + Convert.ToInt32(Session["sp"]) + "'";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rbr.DataSource = dt;
            rbr.DataBind();

        }

        protected void l1_Click(object sender, EventArgs e)
        {
            fillpage();
        }

        protected void l2_Click(object sender, EventArgs e)
        {
            string s = "SELECT Counseling.id, reg_Patient.name, reg_Patient.age ,reg_Patient.gender ,Counseling.disease_date ,SUBSTRING(Counseling.Counseling,1,40) as Counseling  ,Counseling.Counseling_date ,SUBSTRING(Counseling.replay,1,40) as replay , image_path from reg_Patient,Counseling where reg_Patient.user_id=Counseling.user_id and Counseling.replay='' and Counseling.s_id='"+Convert.ToInt32( Session["sp"])+"' ";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rbr.DataSource = dt;
            rbr.DataBind();

        }
    }
}