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
    public partial class supervisorRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Register(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            String firstname = firstName.Text;
            String lastname = lastName.Text;
            String mail = email.Text;
            String pass = password.Text;
            String ffaculty = faculty.Text;
            String aaddress = address.Text;


            SqlCommand SupervisorRegister = new SqlCommand("SupervisorRegister", conn);
            SupervisorRegister.CommandType = CommandType.StoredProcedure;

            SupervisorRegister.Parameters.Add(new SqlParameter("@first_name", SqlDbType.VarChar)).Value = firstname;
            SupervisorRegister.Parameters.Add(new SqlParameter("@last_name", SqlDbType.VarChar)).Value = lastname;
            SupervisorRegister.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;
            SupervisorRegister.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = ffaculty;
            SupervisorRegister.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = mail;
            SupervisorRegister.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value = aaddress;

            conn.Open();
            SupervisorRegister.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("loginPage.aspx");
        }
    }
}