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
    public partial class examinerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            String exName = name.Text;
            String email = Email.Text;
            String pass = Password.Text;
            String national = National.SelectedItem.Value;
            String field = fieldOfWork.Text;

            Boolean nationalBit;
            if (national == "1")
                nationalBit = true;
            else
                nationalBit = false;



            SqlCommand ExaminerRegister = new SqlCommand("ExaminerRegister", conn);
            ExaminerRegister.CommandType = CommandType.StoredProcedure;


            ExaminerRegister.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = exName;
            ExaminerRegister.Parameters.Add(new SqlParameter("@fieldOfWork", SqlDbType.VarChar)).Value = field;
            ExaminerRegister.Parameters.Add(new SqlParameter("@isNational", SqlDbType.Bit)).Value = nationalBit;
            ExaminerRegister.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;
            ExaminerRegister.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;


            conn.Open();
            ExaminerRegister.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("loginPage.aspx");

        }
    }
}