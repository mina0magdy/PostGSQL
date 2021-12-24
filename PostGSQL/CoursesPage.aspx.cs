using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace PostGSQL {
    public partial class CoursesPage : System.Web.UI.Page {

        protected void Backbutton(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand getType = new SqlCommand("GetType", conn);
            getType.CommandType = CommandType.StoredProcedure;

            getType.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];

            SqlParameter type = getType.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            getType.ExecuteNonQuery();
            conn.Close();

            if (type.Value.ToString() == "1")
            {
                Response.Redirect("loggedGUCian.aspx");
            }
            if (type.Value.ToString() == "2")
            {
                Response.Redirect("loggedNonGUCian.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e) {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ViewCoursesGrades = new SqlCommand("ViewCoursesGrades", conn);
            ViewCoursesGrades.CommandType = CommandType.StoredProcedure;
            ViewCoursesGrades.Parameters.Add(new SqlParameter("@studentID", SqlDbType.Int)).Value = Session["user"];

            conn.Open();
            SqlDataReader rdr = ViewCoursesGrades.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable table = new DataTable();
            table.Columns.Add("Course Code");
            table.Columns.Add("Grade");

            while (rdr.Read())
            {
                DataRow dataRow = table.NewRow();
                String sName = rdr.GetString(rdr.GetOrdinal("Course Code"));
                Decimal thY = rdr.GetDecimal(rdr.GetOrdinal("Grade"));
                dataRow["Course Code"] = sName;
                dataRow["Grade"] = thY;
                table.Rows.Add(dataRow);





            }
            GridView1.DataSource = table;
            GridView1.DataBind();





        }
    }
}
        
    