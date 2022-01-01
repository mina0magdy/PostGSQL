using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
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

            if(paymentID.Text == "" || startDate.Text == "")
            {
                Response.Write("<script>alert('One of the fields is empty, Please enter all fields');</script>");
            }
            else
            {
                int pID = int.Parse(paymentID.Text);
                String sDate = startDate.Text;

                SqlCommand issueInstallments = new SqlCommand("AdminIssueInstallPayment", conn);
                issueInstallments.CommandType = CommandType.StoredProcedure;

                issueInstallments.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = pID;
                issueInstallments.Parameters.Add(new SqlParameter("@InstallStartDate", SqlDbType.VarChar)).Value = DateTime.ParseExact(sDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                SqlCommand validPayment = new SqlCommand("validPayment", conn);
                validPayment.CommandType = CommandType.StoredProcedure;

                validPayment.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = pID;

                SqlParameter valid = validPayment.Parameters.Add("@valid", SqlDbType.Bit);
                valid.Direction = System.Data.ParameterDirection.Output;

                SqlCommand noInstallPayment = new SqlCommand("noInstallPay", conn);
                noInstallPayment.CommandType = CommandType.StoredProcedure;

                noInstallPayment.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = pID;

                SqlParameter noInstall = noInstallPayment.Parameters.Add("@noInstall", SqlDbType.Bit);
                noInstall.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                validPayment.ExecuteNonQuery();
                noInstallPayment.ExecuteNonQuery();
                conn.Close();

                if(valid.Value.ToString() == "False")
                {
                    Response.Write("<script>alert('Invalid Payment ID');</script>");

                }
                else
                {
                    if (noInstall.Value.ToString() == "False")
                    {
                        Response.Write("<script>alert('Installment(s) already exist for this payment');</script>");
                    }
                    else
                    {
                        conn.Open();
                        Response.Write("Installment(s) added successfully");
                        issueInstallments.ExecuteNonQuery();
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