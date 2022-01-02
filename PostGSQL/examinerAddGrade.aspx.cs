using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGSQL
{
    public partial class examinerAddGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("loginPage.aspx");
            }
        }

        protected void addGrade(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            

            if (thesisSerial.Text == "" | thesisGrade.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('please fill the required data');", true);

            }

            else
            {
                try
                {
                    int serial = Int32.Parse(thesisSerial.Text);
                    float grade = float.Parse(thesisGrade.Text);

                    SqlCommand addGrade = new SqlCommand("examinerAddGrade", conn);
                    addGrade.CommandType = System.Data.CommandType.StoredProcedure;


                    addGrade.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.Int)).Value = Session["user"];
                    addGrade.Parameters.Add(new SqlParameter("@thesisSerial", System.Data.SqlDbType.Int)).Value = serial;
                    addGrade.Parameters.Add(new SqlParameter("@grade", System.Data.SqlDbType.VarChar)).Value = grade;

                    SqlParameter successGrade = addGrade.Parameters.Add("@gradeSuccess", System.Data.SqlDbType.Bit);
                    successGrade.Direction = System.Data.ParameterDirection.Output;

                    SqlParameter successThesis = addGrade.Parameters.Add("@thesisSuccess", System.Data.SqlDbType.Bit);
                    successThesis.Direction = System.Data.ParameterDirection.Output;

                    conn.Open();
                    addGrade.ExecuteNonQuery();
                    conn.Close();


                    if (successGrade.Value.ToString() == "False")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('please add a valid grade between 0 and 100');", true);

                    }
                    if (successThesis.Value.ToString() == "False")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('this thesis does not belong to you');", true);

                    }
                    if (successGrade.Value.ToString() == "True" & successThesis.Value.ToString() == "True")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('grade has been added successfully');", true);

                    }
                }
                catch(Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('please enter a vaild format');", true);
                    return;

                }
                
            }
        }

        protected void backButton(object sender, EventArgs e)
        {


            Response.Redirect("loggedExaminer.aspx");

        }
    }
}