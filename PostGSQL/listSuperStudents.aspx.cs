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
    public partial class listSuperStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand listStudents = new SqlCommand("ViewSupStudentsYear", conn);
            listStudents.CommandType = CommandType.StoredProcedure;

            listStudents.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = Session["user"];

            conn.Open();
            SqlDataReader rdr = listStudents.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String fullName = rdr.GetString(rdr.GetOrdinal("Student Name"));
                int years = rdr.GetInt32(rdr.GetOrdinal("Thesis Years"));

                Label name = new Label();
                name.Text = "Name: " + fullName;

                Label yearsSpent = new Label();
                yearsSpent.Text = "Years Spent: " + years;

                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(name);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(yearsSpent);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(new LiteralControl("<br />"));

            }
        }
    }
}