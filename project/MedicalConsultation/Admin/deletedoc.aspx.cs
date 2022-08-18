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
    public partial class deletedoc : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            string s1 = "delete from doctor where doc_id='" + Request.QueryString["id"] + "' ";
            SqlCommand cmd1 = new SqlCommand(s1, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            Response.Redirect("DoctorList.aspx");


        }
    }
}