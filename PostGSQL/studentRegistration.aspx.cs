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
    public partial class studentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Backbutton(object sender, EventArgs e)
        {

            Response.Redirect("loginPage.aspx");
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
            String Ggucian = gucselect.SelectedItem.Value;
            String types = type.SelectedItem.Text;
            Boolean GUCBit;
            if (firstname == "" || lastname == "" || mail == "" || pass == "" || ffaculty == "" || aaddress == "" || Ggucian == "" || types == "")
            {
                textMessage.Text = "You need to fill all fields";
                messagePanel.Style["text-align"] = "center";
            }
            else
            {


                if (Ggucian == "1")
                    GUCBit = true;
                else
                    GUCBit = false;

                SqlCommand StudentRegister = new SqlCommand("StudentRegister", conn);
                StudentRegister.CommandType = CommandType.StoredProcedure;

                StudentRegister.Parameters.Add(new SqlParameter("@first_name", SqlDbType.VarChar)).Value = firstname;
                StudentRegister.Parameters.Add(new SqlParameter("@last_name", SqlDbType.VarChar)).Value = lastname;
                StudentRegister.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;
                StudentRegister.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = ffaculty;
                StudentRegister.Parameters.Add(new SqlParameter("@Gucian", SqlDbType.Bit)).Value = GUCBit;
                StudentRegister.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = mail;
                StudentRegister.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value = aaddress;
                StudentRegister.Parameters.Add(new SqlParameter("@type", SqlDbType.VarChar)).Value = types;

                conn.Open();
                StudentRegister.ExecuteNonQuery();
                conn.Close();

                textMessage.Text = "User registered successfully";
                messagePanel.Style["text-align"] = "center";
            }
        }
    }
}