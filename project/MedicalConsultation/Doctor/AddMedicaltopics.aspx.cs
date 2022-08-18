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


namespace MedicalConsultation.Doctor
{
    public partial class AdminHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            string num = " select isnull(max(id), 0)+1 from Medicaltopics";
            SqlCommand cm = new SqlCommand(num, con);
            con.Open();
            int id = Convert.ToInt32(cm.ExecuteScalar());
            con.Close();
            if (f1.HasFiles && f4.HasFiles)
            {
                string ext1 = System.IO.Path.GetExtension(f1.FileName);
                string ext2 = System.IO.Path.GetExtension(f4.FileName);
                if (ext1 != ".jpg" && ext1 != ".png" && ext1 !="jpeg" && ext2 !="pdf")
                {
                    l1.Visible = true;
                    l1.Text = "please select the Document ";
                    return;

                }

                string file_name1 = f1.FileName;
                f1.SaveAs(Server.MapPath("~\\Doctor\\images") + "\\" + file_name1);
                object documentFormat = 8;
                string randomName = DateTime.Now.Ticks.ToString();
                object htmlFilePath = Server.MapPath("~\\Doctor\\images\\") + randomName + ".htm";
                string directoryPath = Server.MapPath("~\\Doctor\\images\\") + randomName + "_files";
                object fileSavePath = Server.MapPath("~\\Doctor\\images\\") + Path.GetFileName(f4.PostedFile.FileName);
                f4.PostedFile.SaveAs(fileSavePath.ToString());
                string path2 = f4.PostedFile.FileName;
                string path1 = file_name1;
                ////string txt = Request.Form["t2"].ToString();
                //_Application applicationclass = new Application();
                //applicationclass.Documents.Open(ref fileSavePath);
                //applicationclass.Visible = false;
                //Document document = applicationclass.ActiveDocument;

                ////Save the word document as HTML file.
                //document.SaveAs(ref htmlFilePath, ref documentFormat);

                ////Close the word document.
                //document.Close();

                int view = 0;
                string s1 = "insert into Medicaltopics values( '" + id + "','" + path1 + "','" + t1.Text + "','"+DateTime.Now.ToShortDateString().ToString()+"','"+view+"','"+path2+"')";
                SqlCommand cmd1 = new SqlCommand(s1, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                l1.ForeColor = System.Drawing.Color.Green;
                l1.Text = "Successfully added";

            }
            else
            {
                l1.ForeColor = System.Drawing.Color.Red;
                l1.Text = "please select the pdf Document ";

            }

        }
    }
}