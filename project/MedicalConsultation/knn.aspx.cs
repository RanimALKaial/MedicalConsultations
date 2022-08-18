using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Drawing;
using FusionCharts.DataEngine;
using FusionCharts.Visualization;

namespace MedicalConsultation
{
    public partial class knn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);
        public static string classesname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/Patient/login.aspx");
            }

        }

        //send con.
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Counseling"] = "Chest Pain Type:" + d1.SelectedItem + "\nRest Blood Pressure:" + t2.Text + "\nFasting Blood Sugar:" + t4.Text + "\nResting Electro:" + DropDownList1.SelectedItem + "\n";
            Session["Counseling"] += "Max Heart Rate:" + t3.Text + "\nExercise Angina:" + DropDownList2.SelectedItem + "\n";
            Session["Counseling"] += "Patient Result:" + DropDownList3.SelectedItem + "\nSystem Result:" +classesname+ "";
            Response.Redirect("~/Patient/AddCounseling.aspx");

        }

        protected void b2_Click(object sender, EventArgs e)
        {
            double age = Convert.ToDouble(t1.Text);
            double chest_pain_type = Convert.ToDouble(d1.SelectedValue);
            double rest_blood_pressure = Convert.ToDouble(t2.Text);
            double blood_sugar = Convert.ToDouble(t4.Text);
            double rest_electro = Convert.ToDouble(DropDownList1.SelectedValue);
            double max_heart_rate = Convert.ToDouble(t3.Text);
            double exercice_angina = Convert.ToDouble(DropDownList2.SelectedValue);
            string s = "select * from HeartDisease ";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            double pow = 2;
            da.Fill(dt);
            double[] result = new double[dt.Rows.Count];
            string[] classes = new string[dt.Rows.Count];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                double D1 = Math.Pow((age - Convert.ToDouble(dt.Rows[i]["age"])), pow);
                double D2 = Math.Pow((chest_pain_type - Convert.ToDouble(dt.Rows[i]["chest_pain_type"])), pow);
                double D3 = Math.Pow((rest_blood_pressure - Convert.ToDouble(dt.Rows[i]["rest_blood_pressure"])), pow);
                double D4 = Math.Pow((blood_sugar - Convert.ToDouble(dt.Rows[i]["blood_sugar"])), pow);
                double D5 = Math.Pow((rest_electro - Convert.ToDouble(dt.Rows[i]["rest_electro"])), pow);
                double D6 = Math.Pow((max_heart_rate - Convert.ToDouble(dt.Rows[i]["max_heart_rate"])), pow);
                double D7 = Math.Pow((exercice_angina - Convert.ToDouble(dt.Rows[i]["exercice_angina"])), pow);
                result[i] = Math.Sqrt(D1 + D2 + D3 + D4 + D5 + D6 + D7);
                classes[i] = dt.Rows[i]["disease"].ToString();
            }

            int index = 0;
            double min = result[0];
            for (int i = 0; i < result.Length; i++)
            {
                if (min > result[i])
                {
                    min = result[i];

                }
            }

            for (int i = 0; i < result.Length; i++)
            {
                if (min == result[i])
                {
                    index = i;
                }
            }

            classesname = classes[index];
            l1.Text = "minimum distance is: " + min + " and your result is: " + classesname;
            string patient_state = DropDownList3.SelectedValue.ToString();
            if (patient_state == classesname)
            {
                string s1 = "insert into knn_Rate values ('" + Convert.ToInt32(Session["user_id"]) + "','" + patient_state + "','" + classesname + "','1')";
                con.Open();
                SqlCommand cmd1 = new SqlCommand(s1, con);
                cmd1.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                string s1 = "insert into knn_Rate values ('" + Convert.ToInt32(Session["user_id"]) + "','" + patient_state + "','" + classesname + "','0')";
                con.Open();
                SqlCommand cmd1 = new SqlCommand(s1, con);
                cmd1.ExecuteNonQuery();
                con.Close();

            }



        }

        //show rate
        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = " select sum( cast (knn_Rate.matched_result as float))/count(cast( knn_Rate.matched_result as float)) as 'rate' from knn_Rate";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string ss = dt.Rows[0]["rate"].ToString();
            double sa = (Convert.ToDouble(ss) * 100);
            if (sa < 50)
            {
                Label1.Text = +sa + "%"+ "  :خطأ تصنيف الخوارزمية هو  " ;

                DataTable primaryData2 = new DataTable();
                primaryData2.Columns.Add("state_rate");
                primaryData2.Columns.Add("rate", typeof(double));
                primaryData2.Rows.Add(" التصنيف الخطأ", sa);
                primaryData2.Rows.Add(" التصنيف الصحيح", 100 - sa);

                // Create static source with this data table
                StaticSource source = new StaticSource(primaryData2);

                // Create instance of DataModel class
                DataModel model = new DataModel();

                // Add DataSource to the DataModel
                model.DataSources.Add(source);

                // Instantiate doughnut Chart
                Charts.DoughnutChart doughnut = new Charts.DoughnutChart("doughnut_chart");

                // Set Chart's width and height
                doughnut.Width.Pixel(500);
                doughnut.Height.Pixel(350);

                // Set DataModel instance as the data source of the chart
                doughnut.Data.Source = model;

                // Set Chart Title
                doughnut.Caption.Text = " حالة التصنيف ";
                doughnut.SubCaption.Text = " عرض الخطأ والتصنيف الصحيح ";
                // Render the chart to 'doughnutChartLiteral' literal control
                Literal1.Text = doughnut.Render();


            }
            else
            {
                Label1.Text = +sa + "%"+ ":صحة تصنيف الخوارزمية هي " ;

                DataTable primaryData2 = new DataTable();
                primaryData2.Columns.Add("state_rate");
                primaryData2.Columns.Add("rate", typeof(double));
                primaryData2.Rows.Add(" التصنيف الصحيح", sa);
                primaryData2.Rows.Add(" التصنيف الخطأ", 100 - sa);

                // Create static source with this data table
                StaticSource source = new StaticSource(primaryData2);

                // Create instance of DataModel class
                DataModel model = new DataModel();

                // Add DataSource to the DataModel
                model.DataSources.Add(source);

                // Instantiate doughnut Chart
                Charts.DoughnutChart doughnut = new Charts.DoughnutChart("doughnut_chart");

                // Set Chart's width and height
                doughnut.Width.Pixel(500);
                doughnut.Height.Pixel(350);

                // Set DataModel instance as the data source of the chart
                doughnut.Data.Source = model;

                // Set Chart Title
                doughnut.Caption.Text = " : حالة التصنيف ";
                doughnut.SubCaption.Text = " عرض الخطأ والتصنيف الصحيح ";
                // Render the chart to 'doughnutChartLiteral' literal control
                Literal1.Text = doughnut.Render();

            }
        }
    }
}