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
    public partial class loggedAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void updateExt_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int SSN = int.Parse(thesisSSn.Text);

            SqlCommand updateExtensions = new SqlCommand("AdminUpdateExtension", conn);
            updateExtensions.CommandType = CommandType.StoredProcedure;

            updateExtensions.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = SSN;

            conn.Open();
            updateExtensions.ExecuteNonQuery();
            conn.Close();
        }
    }
}