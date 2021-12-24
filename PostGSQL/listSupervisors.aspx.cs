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
    public partial class listSupervisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand listSupervisors = new SqlCommand("AdminListSup", conn);
            listSupervisors.CommandType = CommandType.StoredProcedure;

            DataTable table = new DataTable();
            table.Columns.Add("id");
            table.Columns.Add("name");
            table.Columns.Add("faculty");

            conn.Open();
            SqlDataReader rdr = listSupervisors.ExecuteReader(CommandBehavior.CloseConnection);
            Boolean flag = false;
            while (rdr.Read())
            {
                flag = true;
                DataRow dataRow = table.NewRow();
                int SupID = rdr.GetInt32(rdr.GetOrdinal("id"));
                String SupName = rdr.GetString(rdr.GetOrdinal("name"));
                String SupFaculty = rdr.GetString(rdr.GetOrdinal("faculty"));

                dataRow["id"] = SupID;
                dataRow["name"] = SupName;
                dataRow["faculty"] = SupFaculty;

                table.Rows.Add(dataRow);
            }

            if (flag == false)
            {
                Response.Write("<script>alert('No Supervisors Found');</script>");
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