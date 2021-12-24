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
    public partial class issueInstallments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void issueInstallmentsP_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int pID = int.Parse(paymentID.Text);
            DateTime sDate = DateTime.Parse(startDate.Text);

            SqlCommand issueInstallments = new SqlCommand("AdminIssueInstallPayment", conn);
            issueInstallments.CommandType = CommandType.StoredProcedure;

            issueInstallments.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = pID;
            issueInstallments.Parameters.Add(new SqlParameter("@InstallStartDate", SqlDbType.DateTime)).Value = sDate;

            conn.Open();
            issueInstallments.ExecuteNonQuery();
            conn.Close();
        }
    }
}