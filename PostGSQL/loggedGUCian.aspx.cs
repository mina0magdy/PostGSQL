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
    public partial class loggedGUCian : System.Web.UI.Page
    {
        //  public int id ;
        protected void Page_Load(object sender, EventArgs e)
        {
            //    id = (int)Session["user"];
        }
        protected void Backbutton(object sender, EventArgs e)
        {
            Response.Redirect("loginPage.aspx");
        }

        protected void Mobile(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String mobilez = mobile.Text;

            if (mobilez == "")
            {

                textMessage.Text = "You need to enter a phone number in order to add";
                messagePanel.Style["text-align"] = "center";
            }
            else
            {
                SqlCommand addMobile = new SqlCommand("addMobile", conn);
                addMobile.CommandType = CommandType.StoredProcedure;

                addMobile.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int)).Value = Session["user"];
                addMobile.Parameters.Add(new SqlParameter("@mobile_number", SqlDbType.VarChar)).Value = mobilez;

                textMessage.Text = "Mobile number added";
                messagePanel.Style["text-align"] = "center";
                conn.Open();
                addMobile.ExecuteNonQuery();
                conn.Close();

            }
        }
    }
}