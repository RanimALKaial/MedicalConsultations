using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using Microsoft.Office.Interop.Word;
using System.Text.RegularExpressions;

namespace MedicalConsultation.Patient
{
    public partial class MedicaltopicsDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            

                if (!IsPostBack)
            {
                string s = "select id,imagepath,title,date,views,description from Medicaltopics where id='" + Request.QueryString["id"] + "'";
                SqlCommand cmd = new SqlCommand(s, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);
                int views = Convert.ToInt32(dt.Rows[0]["views"]);
                int newViews = views + 1;
                string s1 = "update Medicaltopics set [views]='" + newViews + "' where id='" + Request.QueryString["id"] + "'";
                SqlCommand cmd1 = new SqlCommand(s1, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();

                string s2 = "select id,imagepath,title,date,views,description from Medicaltopics where id='" + Request.QueryString["id"] + "'";
                SqlCommand cmd2 = new SqlCommand(s2, con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                System.Data.DataTable dt2 = new System.Data.DataTable();
                da2.Fill(dt2);
                l3.Text = dt.Rows[0]["title"].ToString();
                l1.Text="Views: "+ dt.Rows[0]["views"].ToString();
                l2.Text ="Publish Date: "+ dt.Rows[0]["date"].ToString();
                img.ImageUrl = "~\\Doctor\\images\\" + dt.Rows[0]["imagepath"].ToString();
                rbr.DataSource = dt2;
                rbr.DataBind();
            }

        }
    }
}