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
    public partial class DataMinningPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Properties.Settings.Default.con);
      static string result_state;
     static string p;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/Patient/login.aspx");
            }

        }

        protected void b2_Click(object sender, EventArgs e)
        {
            Classifier bayes = new Classifier();
            bayes.primaryData.Columns.Add("result");
            bayes.primaryData.Columns.Add("result_num", typeof(double));
            string s = "select  disease,age,chest_pain_type,rest_blood_pressure ,blood_sugar,rest_electro ,max_heart_rate,exercice_angina from HeartDisease";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            //تمرير البيانات الى المصنف للتدريب
            bayes.TrainClassifier(dt);
            //تخزين القيم المدخلة من الواجهة ضمن متغيرات
            double age = Convert.ToDouble(t1.Text);
            double Chest_Pain_Type = Convert.ToDouble(d1.SelectedValue);
            double blood_pres = Convert.ToDouble(t2.Text);
            double fasting_blood = Convert.ToDouble(t4.Text);
            double Resting_Electro = Convert.ToDouble(DropDownList1.SelectedValue);
            double max_heart_rate = Convert.ToDouble(t3.Text);
            double Exercise = Convert.ToDouble(DropDownList2.SelectedValue);

            if(age<100 || blood_pres< 140 || fasting_blood<200 ||max_heart_rate< 100)
            {
                //تمرير البيانات المدخلة للتصنيف وعرض النتيجة ضمن ليبل

                l1.Text = " The result is: "+ bayes.Classify(new double[] { age, Chest_Pain_Type, blood_pres, fasting_blood, Resting_Electro, max_heart_rate, Exercise }).ToString() ;
                decimal d = decimal.Parse(bayes.maxOne.ToString(), System.Globalization.NumberStyles.Float);
                l1.Text += " and the probability is : " + bayes.maxOne ;
                p = bayes.maxOne.ToString();
                StaticSource source = new StaticSource(bayes.primaryData);
                // Create instance of DataModel class
                DataModel model = new DataModel();
                // Add DataSource to the DataModel
                model.DataSources.Add(source);
                // Instantiate Pie Chart
                Charts.PieChart pie = new Charts.PieChart("pie_chart");
                // Set Chart's width and height
                pie.Width.Pixel(500);
                pie.Height.Pixel(400);
                // Set DataModel instance as the data source of the chart
                pie.Data.Source = model;
                // Set Chart Title
                pie.Caption.Text = "معلومات التحليل الطبي";
                //set chart sub title
                pie.SubCaption.Text = "شاهد نتيجتك باستخدام خوارزمية بايس";
                // Render the chart to 'PieChartLiteral' literal control
                Literal1.Text = pie.Render();



                //تقييم الخوارزمية
                string patient_state = DropDownList3.SelectedValue.ToString();
                result_state = bayes.Classify(new double[] { age, Chest_Pain_Type, blood_pres, fasting_blood, Resting_Electro, max_heart_rate, Exercise }).ToString();
                if (patient_state == result_state)
                {
                    string s1 = "insert into Bayes_Rate values ('"+Convert.ToInt32( Session["user_id"]) + "','" + patient_state + "','" + result_state + "','1')";
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand(s1, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                }
                else
                {
                    string s1 = "insert into Bayes_Rate values ('"+ Convert.ToInt32(Session["user_id"]) + "','" + patient_state + "','" + result_state + "','0')";
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand(s1, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();

                }
            }
            else
            {
                l1.ForeColor = Color.Red;
                l1.Text = "معلومات : العمر < 100 , ضغط دمك < 140 , سكر دمك < 200 , معدل ضربات قلبك < 100";

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Classifier bayes = new Classifier();
            bayes.primaryData.Clear();
            string s = " select sum( cast (Bayes_Rate.matched_result as float))/count(cast( Bayes_Rate.matched_result as float)) as 'rate' from Bayes_Rate";
            SqlCommand cmd = new SqlCommand(s, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
           string ss = dt.Rows[0]["rate"].ToString() ;
            double sa = (Convert.ToDouble(ss) * 100);
            if (sa < 50)
            {
                Label1.Text =  sa + "%" + " : خطأ تصنيف الخوارزمية هو ";

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
                doughnut.Caption.Text = "حالة التصنيف ";
                doughnut.SubCaption.Text = " : عرض الخطأ والتصنيف الصحيح ";
                // Render the chart to 'doughnutChartLiteral' literal control
                Literal1.Text = doughnut.Render();


            }
            else
            {
                Label1.Text = " % " + sa + ": صحة الخوارزمية هي ";

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
                doughnut.Caption.Text = "حالة التصنيف";
                doughnut.SubCaption.Text =  " : عرض الخطأ والتصنيف الصحيح ";
                // Render the chart to 'doughnutChartLiteral' literal control
                Literal1.Text = doughnut.Render();

            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Counseling"] = "Chest Pain Type:" +d1.SelectedItem+ "\nRest Blood Pressure:"+t2.Text+ "\nFasting Blood Sugar:"+t4.Text+ "\nResting Electro:"+DropDownList1.SelectedItem+"\n";
            Session["Counseling"] += "Max Heart Rate:"+t3.Text+ "\nExercise Angina:"+DropDownList2.SelectedItem+"\n";
            Session["Counseling"] += "Patient Result:"+DropDownList3.SelectedItem+"\nSystem Result:"+ result_state + "\nProbability of disease:"+p+"";
            Response.Redirect("~/Patient/AddCounseling.aspx");
        }
    }
}