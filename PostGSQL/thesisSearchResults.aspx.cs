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
    public partial class thesisSearchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand thesisSearch = new SqlCommand("searchForThesisV3", conn);
            thesisSearch.CommandType = System.Data.CommandType.StoredProcedure;

            thesisSearch.Parameters.Add(new SqlParameter("@search", System.Data.SqlDbType.VarChar)).Value=Session["search"];
            SqlParameter success = thesisSearch.Parameters.Add(new SqlParameter("@success", System.Data.SqlDbType.Bit));
            success.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            thesisSearch.ExecuteNonQuery();
            conn.Close();


                thesisSearch.Connection = conn;
                conn.Open();
                SqlDataReader reader = thesisSearch.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();

                conn.Close();
            
        }

        protected void backButton(object sender, EventArgs e)
        {


            Response.Redirect("loggedExaminer.aspx");

        }
    }
}