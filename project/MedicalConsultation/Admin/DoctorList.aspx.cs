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
    public partial class DoctorList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            fillpage();

        }
        public void fillpage()
        {
            string s = "select doctor.doc_id,doctor.doc_name,Medical_specialty.s_name,doctor.user_name,doctor.password from Medical_specialty,doctor where doctor.s_id=Medical_specialty.s_id";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rbr.DataSource = dt;
            rbr.DataBind();

        }
    }
}