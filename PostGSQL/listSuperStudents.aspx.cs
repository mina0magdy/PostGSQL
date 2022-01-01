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
            SqlCommand ViewSupStudentsYear = new SqlCommand("ViewSupStudentsYear", conn);
            ViewSupStudentsYear.CommandType = CommandType.StoredProcedure;
            ViewSupStudentsYear.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = Session["user"];

            conn.Open();
            SqlDataReader rdr = ViewSupStudentsYear.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable table = new DataTable();
            table.Columns.Add("Name");
            table.Columns.Add("Years spent on Thesis");

            while (rdr.Read())
            {
                DataRow dataRow = table.NewRow();
                String sName = rdr.GetString(rdr.GetOrdinal("Student Name"));
                int thY = rdr.GetInt32(rdr.GetOrdinal("Thesis Years"));
                dataRow["Name"] = sName;
                dataRow["Years spent on Thesis"] = thY;
                table.Rows.Add(dataRow);





            }
            GridView1.DataSource = table;
            GridView1.DataBind();





        }
    }
}