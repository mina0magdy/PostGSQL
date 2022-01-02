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
    public partial class loggedExaminer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["user"] == null)
            {
                Response.Redirect("loginPage.aspx");
            }
            
        }



        protected void editProfile(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


           // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('alooooooooo');", true);
            
            Response.Redirect("examinerEditProfile.aspx");
        }


        protected void viewThesis(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("examinerViewAllTheses.aspx");

        }


        protected void addComment(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("examinerAddComment.aspx");

        }



        protected void addGrade(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Response.Redirect("examinerAddGrade.aspx");

        }




        protected void thesisSearch(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            Session["search"] = searchForThesis.Text;

            SqlCommand thesisSearch = new SqlCommand("searchForThesisV3", conn);
            thesisSearch.CommandType = System.Data.CommandType.StoredProcedure;

            thesisSearch.Parameters.Add(new SqlParameter("@search", System.Data.SqlDbType.VarChar)).Value = Session["search"];


            SqlParameter success = thesisSearch.Parameters.Add(new SqlParameter("@success", System.Data.SqlDbType.Bit));
            success.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            thesisSearch.ExecuteNonQuery();
            conn.Close();


            if (success.Value.ToString() == "True")
            {
               // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('alooooooo');", true);

               Response.Redirect("thesisSearchResults.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('thesis not found');", true);
            }

        }


        protected void backButton(object sender, EventArgs e)
        {
            

            Response.Redirect("loginPage.aspx");

        }


    }
}











