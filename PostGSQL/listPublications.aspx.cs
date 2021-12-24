using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGSQL
{
    public partial class listPublications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand listPublications = new SqlCommand("ViewAStudentPublications", conn);
            listPublications.CommandType = CommandType.StoredProcedure;

            listPublications.Parameters.Add(new SqlParameter("@StudentID", SqlDbType.Int)).Value = Session["sid"];

            DataTable table = new DataTable();
            table.Columns.Add("id");
            table.Columns.Add("title");
            table.Columns.Add("date");
            table.Columns.Add("place");
            table.Columns.Add("accepted");
            table.Columns.Add("host");

            conn.Open();
            SqlDataReader rdr = listPublications.ExecuteReader(CommandBehavior.CloseConnection);
            Boolean flag = false;
            while (rdr.Read())
            {
                flag = true;
                DataRow dataRow = table.NewRow();
                int Pid = rdr.GetInt32(rdr.GetOrdinal("id"));
                String Ptitle = rdr.GetString(rdr.GetOrdinal("title"));
                DateTime Pdate = rdr.GetDateTime(rdr.GetOrdinal("date"));
                String Pplace = rdr.GetString(rdr.GetOrdinal("place"));
                Boolean Paccepted = rdr.GetBoolean(rdr.GetOrdinal("accepted"));
                String Phost = rdr.GetString(rdr.GetOrdinal("host"));

                dataRow["id"] = Pid;
                dataRow["title"] = Ptitle;
                dataRow["date"] = Pdate;
                dataRow["place"] = Pplace;
                dataRow["accepted"] = Paccepted;
                dataRow["host"] = Phost;

                table.Rows.Add(dataRow);
            }

            if (flag == false)
            {
                Response.Write("<script>alert('No publication found for this student');</script>");
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = table;
                GridView1.DataBind();

            }

        }
    }
}