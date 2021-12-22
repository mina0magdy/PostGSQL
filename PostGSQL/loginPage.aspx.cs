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
    public partial class loginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String mail = Email.Text;
            String pass = Password.Text;

            SqlCommand getId = new SqlCommand("GetID", conn);
            getId.CommandType = CommandType.StoredProcedure;

            getId.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = mail;

            SqlParameter id = getId.Parameters.Add("@id", SqlDbType.Int);
            id.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            getId.ExecuteNonQuery();
            conn.Close();

            SqlCommand loginProc = new SqlCommand("userLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;

            loginProc.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = id.Value;
            loginProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;

            SqlParameter sucess = loginProc.Parameters.Add("@successBit", SqlDbType.Bit);
            sucess.Direction = System.Data.ParameterDirection.Output;

            SqlCommand getType = new SqlCommand("GetType", conn);
            getType.CommandType = CommandType.StoredProcedure;

            getType.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = id.Value;

            SqlParameter type = getType.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            loginProc.ExecuteNonQuery();
            getType.ExecuteNonQuery();
            conn.Close();
            if (sucess.Value.ToString() == "True")
            {
                Session["user"] = id.Value;
                if (type.Value.ToString() == "1")
                {
                    Response.Redirect("loggedGUCian.aspx");
                }
                if (type.Value.ToString() == "2")
                {
                    Response.Redirect("loggedNonGUCian.aspx");
                }
                if (type.Value.ToString() == "3")
                {
                    Response.Redirect("loggedSupervisor.aspx");
                }
                if (type.Value.ToString() == "4")
                {
                    Response.Redirect("loggedExaminer.aspx");
                }
                if (type.Value.ToString() == "5")
                {
                    Response.Redirect("loggedAdmin.aspx");
                }
            }
        }
    }
}