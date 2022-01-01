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
    public partial class addExaminer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand AddExaminer = new SqlCommand("AddExaminer", conn);
            AddExaminer.CommandType = CommandType.StoredProcedure;
            AddExaminer.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = ThesisSerialNo.Text;
            AddExaminer.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value =  DateTime.ParseExact(DefenseDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            AddExaminer.Parameters.Add(new SqlParameter("@ExaminerName", SqlDbType.VarChar)).Value = ExaminerName.Text;
            AddExaminer.Parameters.Add(new SqlParameter("@National", SqlDbType.VarChar)).Value = National.Text;
            AddExaminer.Parameters.Add(new SqlParameter("@fieldOfWork", SqlDbType.VarChar)).Value = fieldOfWork.Text;
            conn.Open();
            Response.Write(National.Text);
            try
            {
                AddExaminer.ExecuteNonQuery();
                Response.Write("Examiner  added");

            }
            catch (SqlException sqlEx)
            {
                if (sqlEx.Message.StartsWith("The INSERT statement conflicted with the FOREIGN KEY"))
                {
                    Response.Write("<script>alert('Invalid DefenseDate or  wanted Thesis Or Invalid Thesis');</script>");

                }
                else
                {
                    if (sqlEx.Message.StartsWith("Failed to convert parameter value from a String to a DateTime"))
                    {
                        Response.Write("<script>alert('Date format should be mm/dd/yyyy ');</script>");

                    }

                }

            }
            catch (System.FormatException sFe)
            {
                if (sFe.Message.StartsWith("Failed to convert parameter value from a String to a DateTime"))
                {
                    Response.Write("<script>alert('Date must be written in mm/dd/yyyy format');</script>");

                }
            }
            conn.Close();




        }
    }
}