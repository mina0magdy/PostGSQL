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
    public partial class examinerViewAllTheses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand viewAll = new SqlCommand("examinerViewAllThesesAndSupervisorsAndStudents", conn);
            viewAll.CommandType = System.Data.CommandType.StoredProcedure;

            viewAll.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.VarChar)).Value = Session["user"];
            

            conn.Open();
            viewAll.ExecuteNonQuery();
            conn.Close();


            viewAll.Connection = conn;
            conn.Open();
            SqlDataReader reader = viewAll.ExecuteReader();
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