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
    public partial class ProgressreportaddPage : System.Web.UI.Page
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
        protected void Addprogress(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String serialno = Thesis.Text;
            String dates = Date.Text;

            if (serialno == "" || dates == "")
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
                conn.Open();
                checkThesis.ExecuteNonQuery();
                conn.Close();
                if (isValid.Value.ToString() == "False")
                {
                    textMessage.Text = "You either don't own this Thesis or it is outdated";
                    messagePanel.Style["text-align"] = "center";

                }
                else
                {
                    SqlCommand AddProgressReport = new SqlCommand("AddProgressReport", conn);
                    AddProgressReport.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        AddProgressReport.Parameters.Add(new SqlParameter("@progressReportDate", SqlDbType.VarChar)).Value = DateTime.ParseExact(dates, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                    }
                    catch (Exception ex)
                    {

                        Response.Write("<script>alert('Date must be written in dd/mm/yyyy format');</script>");
                        return;
                    }
                    AddProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialno;



                   

                    conn.Open();
                    try
                    {
                        AddProgressReport.ExecuteNonQuery();

                    }
                    catch (Exception ex)
                    {

                        Response.Write("<script>alert('Date must be written in dd/mm/yyyy format');</script>");
                        return;
                    }
                    conn.Close();
                    textMessage.Text = "Report added successfully";
                    messagePanel.Style["text-align"] = "center";
                }
            }
        }
    }
}