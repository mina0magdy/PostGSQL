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
    public partial class editSupervisorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveSupervisorEdit_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String name = Name.Text;
            String faculty = Faculty.Text;

            SqlCommand updateSupProfile = new SqlCommand("UpdateSupProfile", conn);
            updateSupProfile.CommandType = CommandType.StoredProcedure;

            updateSupProfile.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = Session["user"];  
            updateSupProfile.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = name;
            updateSupProfile.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = faculty;

            conn.Open();
            updateSupProfile.ExecuteNonQuery();
            Response.Redirect("supervisorProfile.aspx");
            conn.Close();
        }
    }
}