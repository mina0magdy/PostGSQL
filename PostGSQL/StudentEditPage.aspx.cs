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
    public partial class StudentEditPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Backbutton(object sender, EventArgs e)
        {
            Response.Redirect("StudentProfilePage.aspx");
        }
        protected void ESP(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            String firstname = firstName.Text;
            String lastname = lastName.Text;
            String mail = email.Text;
            String pass = password.Text;
            String aaddress = address.Text;
            String types = type.SelectedItem.Text;
            if (firstname == "" || lastname == "" || mail == "" || pass == "" || aaddress == "" || types == "")
            {

                textMessage.Text = "You need to fill all fields";
                messagePanel.Style["text-align"] = "center";
            }
            else
            {



                SqlCommand editMyProfile = new SqlCommand("editMyProfile", conn);
                editMyProfile.CommandType = CommandType.StoredProcedure;

                editMyProfile.Parameters.Add(new SqlParameter("@studentID", SqlDbType.VarChar)).Value = Session["user"];
                editMyProfile.Parameters.Add(new SqlParameter("@firstName", SqlDbType.VarChar)).Value = firstname;
                editMyProfile.Parameters.Add(new SqlParameter("@lastName", SqlDbType.VarChar)).Value = lastname;
                editMyProfile.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;
                editMyProfile.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = mail;
                editMyProfile.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value = aaddress;
                editMyProfile.Parameters.Add(new SqlParameter("@type", SqlDbType.VarChar)).Value = types;

                textMessage.Text = "Profile has been edited";
                messagePanel.Style["text-align"] = "center";
                conn.Open();
                editMyProfile.ExecuteNonQuery();
                conn.Close();

            }
        }
    }
}