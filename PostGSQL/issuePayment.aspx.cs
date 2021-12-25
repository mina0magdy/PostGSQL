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
            if (ThesisSSN.Text == "" || Amount.Text == "" || noOfInstallmets.Text == "" || fundPercentage.Text == "")
            {
                Response.Write("<script>alert('One of the fields is empty, Please enter all fields');</script>");
            }
            else
            {
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

                SqlCommand existingThesis = new SqlCommand("isThesisExist", conn);
                existingThesis.CommandType = CommandType.StoredProcedure;

                existingThesis.Parameters.Add(new SqlParameter("@SSN", SqlDbType.Int)).Value = SSN;

                SqlParameter existing = existingThesis.Parameters.Add("@exist", SqlDbType.Bit);
                existing.Direction = System.Data.ParameterDirection.Output;

                SqlCommand noPaymentForThesis = new SqlCommand("noPayThesis", conn);
                noPaymentForThesis.CommandType = CommandType.StoredProcedure;

                noPaymentForThesis.Parameters.Add(new SqlParameter("@SSN", SqlDbType.Int)).Value = SSN;

                SqlParameter noPayment = noPaymentForThesis.Parameters.Add("@noPay", SqlDbType.Bit);
                noPayment.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                existingThesis.ExecuteNonQuery();
                noPaymentForThesis.ExecuteNonQuery();
                conn.Close();

                if(existing.Value.ToString() == "False")
                {
                    Response.Write("<script>alert('Thesis is not registered by a student');</script>");
                }
                else
                {
                    if(noPayment.Value.ToString() == "False")
                    {
                        Response.Write("<script>alert('A payment already exists for this thesis');</script>");
                    }
                    else
                    {
                        conn.Open();
                        Response.Write("Payment added successfully");
                        issuePayment.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("loggedAdmin.aspx");
        }
    }
}