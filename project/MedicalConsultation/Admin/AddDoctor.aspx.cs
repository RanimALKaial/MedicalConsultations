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
    public partial class AddDoctor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string s = "select * from Medical_specialty ";
                SqlCommand cmd = new SqlCommand(s, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                d1.DataSource = dt;
                d1.DataTextField = "s_name";
                d1.DataValueField = "s_id";
                d1.DataBind();

            }

        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string num = " select isnull(max(doc_id), 0)+1 from doctor";
            SqlCommand cm = new SqlCommand(num, con);
            con.Open();
            int id = Convert.ToInt32(cm.ExecuteScalar());
            con.Close();
            string s1 = "insert into doctor values( '" + id + "','" + t1.Text + "','" +Convert.ToInt32( d1.SelectedValue) + "','" + t2.Text + "','" + t3.Text + "')";
            SqlCommand cmd1 = new SqlCommand(s1, con);
            con.Open();
            cmd1.ExecuteNonQuery();
            con.Close();
            l1.ForeColor = System.Drawing.Color.Green;
            l1.Text = "Successfully added";


        }
    }
}