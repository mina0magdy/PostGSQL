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
    public partial class issuePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void issuePayment_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int SSN = int.Parse(ThesisSSN.Text);
            decimal PAmount = decimal.Parse(Amount.Text);
            int PnoOfInstallments = int.Parse(noOfInstallmets.Text);
            decimal PfundPercentage = decimal.Parse(fundPercentage.Text);

            SqlCommand issuePayment = new SqlCommand("AdminIssueThesisPayment", conn);
            issuePayment.CommandType = CommandType.StoredProcedure;

            issuePayment.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = SSN;
            issuePayment.Parameters.Add(new SqlParameter("@amount", SqlDbType.Decimal)).Value = PAmount;
            issuePayment.Parameters.Add(new SqlParameter("@noOfInstallments", SqlDbType.Int)).Value = PnoOfInstallments;
            issuePayment.Parameters.Add(new SqlParameter("@fundPercentage", SqlDbType.Decimal)).Value = PfundPercentage;

            SqlParameter success = issuePayment.Parameters.Add("@Success", SqlDbType.Bit);
            success.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            issuePayment.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "True")
            {
                Response.Write("Payment Added Successfully");
            }
        }
    }
}