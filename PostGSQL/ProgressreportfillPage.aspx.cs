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
        protected void Fillprogress(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String serialno = Thesis.Text;
            String reportno = repno.Text;
            String statee = State.Text;
            String description = Report.Text;

        SqlCommand FillProgressReport = new SqlCommand("FillProgressReport", conn);
            FillProgressReport.CommandType = CommandType.StoredProcedure;

            FillProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialno;
            FillProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = reportno;
            FillProgressReport.Parameters.Add(new SqlParameter("@state", SqlDbType.Int)).Value = statee;
            FillProgressReport.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar)).Value = description;

            SqlCommand getType = new SqlCommand("GetType", conn);
            getType.CommandType = CommandType.StoredProcedure;

            getType.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];

            SqlParameter type = getType.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;


            conn.Open();
            FillProgressReport.ExecuteNonQuery();
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
    }
}