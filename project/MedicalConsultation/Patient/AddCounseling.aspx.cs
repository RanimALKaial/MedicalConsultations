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
    public partial class AddCounseling : System.Web.UI.Page
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
                if(Session["Counseling"] != null)
                {
                    t2.InnerText = Session["Counseling"].ToString();
                }
                filldrop();

            }


        }
         void filldrop()
        {
            string s = "select * from Medical_specialty ";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            drop.DataSource = dt;
            drop.DataTextField = "s_name";
            drop.DataValueField = "s_id";
            drop.DataBind();

        }
        protected void b1_Click(object sender, EventArgs e)
        {
            string num = " select isnull(max(id), 0)+1 from Counseling";
            SqlCommand cm = new SqlCommand(num, con);
            con.Open();
            int id = Convert.ToInt32(cm.ExecuteScalar());
            con.Close();
            string ext1 = System.IO.Path.GetExtension(f1.FileName);
                if (ext1 != ".jpg" && ext1 != ".png" && ext1 != "jpeg")
                {
                    l1.Visible = true;
                    l1.Text = "رجاء حدد الصورة فقط";
                    return;

                }

                string file_name1 = f1.FileName;
                f1.SaveAs(Server.MapPath("~\\Patient\\images") + "\\" + file_name1);
                string path1 = file_name1;
                string s1 = "insert into Counseling values( '" + id + "','" + Convert.ToInt32(Session["user_id"]) + "','" + t1.Text + "','" + t2.InnerText.Trim() + "',' ','" + DateTime.Now.ToShortDateString().ToString() + "','"+path1+"','"+Convert.ToInt32(drop.SelectedValue)+"')";
                SqlCommand cmd1 = new SqlCommand(s1, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                l1.ForeColor = System.Drawing.Color.Green;
                l1.Text = "تم إضافة الاستشارة بنجاح";
            Session["Counseling"] = null;
            }

        }
    }
