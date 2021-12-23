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
    public partial class supervisorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand supProfile = new SqlCommand("SupViewProfile", conn);
            supProfile.CommandType = CommandType.StoredProcedure;

            supProfile.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = Session["user"];

            conn.Open();
            SqlDataReader rdr = supProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while(rdr.Read())
            {
                String supName = rdr.GetString(rdr.GetOrdinal("name"));
                String supFaculty = rdr.GetString(rdr.GetOrdinal("faculty"));

                Label id = new Label();
                id.Text = "ID: " + Session["user"];

                Label name = new Label();
                name.Text = "Name: " + supName;

                Label faculty = new Label();
                faculty.Text = "Faculty: " + supFaculty;

                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(id);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(name);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(faculty);
            }
            conn.Close();
        }

        protected void editSupervisor_Click(object sender, EventArgs e)
        {
            Response.Redirect("editSupervisorProfile.aspx");
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("loggedSupervisor.aspx");
        }
    }
}