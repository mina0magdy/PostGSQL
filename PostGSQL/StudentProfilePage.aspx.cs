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
    public partial class StudentProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand AdminViewStudentProfile = new SqlCommand("AdminViewStudentProfile", conn);
            AdminViewStudentProfile.CommandType = CommandType.StoredProcedure;
            AdminViewStudentProfile.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int)).Value = Session["user"];


            conn.Open();
            SqlDataReader rdr = AdminViewStudentProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String line5= rdr.GetString(rdr.GetOrdinal("id"));
                String line = rdr.GetString(rdr.GetOrdinal("firstName"));
                String line1 = rdr.GetString(rdr.GetOrdinal("lastName"));
                String line2 = rdr.GetString(rdr.GetOrdinal("type"));
                String line3 = rdr.GetString(rdr.GetOrdinal("faculty"));
                String line4 = rdr.GetString(rdr.GetOrdinal("address"));
                //decimal line5 = rdr.GetString(rdr.GetOrdinal("GPA"));
                // String line6 = rdr.GetString(rdr.GetOrdinal("undergradID"));

                Label label = new Label();
                label.Text = "ID: "+line5+" Name: "+line + " " + line1 + " Degree: " + line2 + " Faculty: " + line3 + " Address: " + line4 ;
                form1.Controls.Add(label);

            }
        }
    }
}
