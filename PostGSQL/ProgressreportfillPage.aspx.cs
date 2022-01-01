using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGSQL
{
    public partial class ProgressreportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Backbutton(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand getType = new SqlCommand("GetType", conn);
            getType.CommandType = CommandType.StoredProcedure;

            getType.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];

            SqlParameter type = getType.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            getType.ExecuteNonQuery();
            conn.Close();

            if (type.Value.ToString() == "1")
            {
                Response.Redirect("loggedGUCian.aspx");
            }
            if (type.Value.ToString() == "2")
            {
                Response.Redirect("loggedNonGUCian.aspx");
            }
        }
        protected void Fillprogress(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String serialno = Thesis.Text;
            String reportno = repno.Text;
            String statee = State.Text;
            String description = Report.Text;

            if (serialno == "" || reportno == "" || statee == "" || description == "")
            {
                textMessage.Text = "You need to fill all fields";
                messagePanel.Style["text-align"] = "center";
            }
            else
            {

                SqlCommand checkThesis = new SqlCommand("checkThesisV2", conn);
                checkThesis.CommandType = CommandType.StoredProcedure;


                checkThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int)).Value = Session["user"];
                checkThesis.Parameters.Add(new SqlParameter("@serialNo", SqlDbType.Int)).Value = serialno;
                SqlParameter isValid = checkThesis.Parameters.Add("@isValid", SqlDbType.Bit);
                isValid.Direction = System.Data.ParameterDirection.Output;

                SqlCommand checkreport = new SqlCommand("checkreport", conn);
                checkreport.CommandType = CommandType.StoredProcedure;


                checkreport.Parameters.Add(new SqlParameter("@pid", SqlDbType.Int)).Value = reportno;
                checkreport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialno;
                SqlParameter checkpid = checkreport.Parameters.Add("@checkpid", SqlDbType.Bit);
                checkpid.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                checkThesis.ExecuteNonQuery();
                checkreport.ExecuteNonQuery();
                conn.Close();


                if (isValid.Value.ToString() == "False")
                {
                    textMessage.Text = "You either don't own this Thesis or it is outdated";
                    messagePanel.Style["text-align"] = "center";
                    //messagePanel.Visible = true;            
                }
                else
                {
                    if (checkpid.Value.ToString() == "False")
                    {

                        textMessage.Text = "Enter a valid progress report number";
                        messagePanel.Style["text-align"] = "center";
                        //messagePanel.Visible = true;            
                    }
                    else
                    {

                        SqlCommand FillProgressReportV2 = new SqlCommand("FillProgressReportV2", conn);
                        FillProgressReportV2.CommandType = CommandType.StoredProcedure;

                        FillProgressReportV2.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialno;
                        FillProgressReportV2.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = reportno;
                        FillProgressReportV2.Parameters.Add(new SqlParameter("@state", SqlDbType.Int)).Value = statee;
                        FillProgressReportV2.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar)).Value = description;

                        SqlParameter success = FillProgressReportV2.Parameters.Add("@success", SqlDbType.Bit);
                        success.Direction = System.Data.ParameterDirection.Output;


                        conn.Open();
                        FillProgressReportV2.ExecuteNonQuery();

                        conn.Close();

                        if (success.Value.ToString() == "True")
                        {
                            textMessage.Text = "Report Filled successfully";
                            messagePanel.Style["text-align"] = "center";
                        }
                        else
                        {
                            textMessage.Text = "Failed to fill progress report : invalid entries";
                            messagePanel.Style["text-align"] = "center";
                        }

                    }
                }
            }
        }
    }
}