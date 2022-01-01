using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGSQL
{
    public partial class examinerEditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
        }


        protected void editProfile(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            
            String name = newName.Text;
            String field = newFieldOfWork.Text;

            if (name == "" | field == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('please fill the required data');", true);

            }
            else
            {

                SqlCommand editName = new SqlCommand("editExaminerName1", conn);
                editName.CommandType = System.Data.CommandType.StoredProcedure;

                SqlCommand editField = new SqlCommand("editExaminerFieldOfWork1", conn);
                editField.CommandType = System.Data.CommandType.StoredProcedure;

                editName.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.Int)).Value = Session["user"];
                editName.Parameters.Add(new SqlParameter("@newName", System.Data.SqlDbType.VarChar)).Value = name;

                editField.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.Int)).Value = Session["user"];
                editField.Parameters.Add(new SqlParameter("@newFieldOfWork", System.Data.SqlDbType.VarChar)).Value = field;

                conn.Open();
                editField.ExecuteNonQuery();
                conn.Close();

                conn.Open();
                editName.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('profile has been edited successfully');", true);

            }
        }

        protected void backButton(object sender, EventArgs e)
        {


            Response.Redirect("loggedExaminer.aspx");

        }

    }
}