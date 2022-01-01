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
    public partial class evaluatePR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addButton_Click(object sender, EventArgs e)

        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand EvaluateProgressReport = new SqlCommand("EvaluateProgressReport", conn);
            EvaluateProgressReport.CommandType = CommandType.StoredProcedure;
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = 18;
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = thesisSerialNo.Text;
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = progressReportNo.Text;
            EvaluateProgressReport.Parameters.Add(new SqlParameter("@evaluation", SqlDbType.Int)).Value = evaluation.Text;
            conn.Open();
            try
            {
                int Check = EvaluateProgressReport.ExecuteNonQuery();
                if (Check <= 0)
                {
                    Response.Write("<script>alert('Make sure that you added the correct Thesisnumber or progressreport number ');</script>");


                }
                else
                {
                    Response.Write("<h1>Evaluation is Added successfuly</h1>");


                }

            }
            catch (System.Data.SqlClient.SqlException sqlE)
            {
                if (sqlE.Message.StartsWith("GRADE SHOULD BE FROM"))
                {
                    Response.Write("<script>alert('Make sure that the evaluation is between 0 and 3 ');</script>");

                }




            }

            conn.Close();



        }
    }
}