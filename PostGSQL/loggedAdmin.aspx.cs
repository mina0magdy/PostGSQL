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

            SqlCommand registeredThesis = new SqlCommand("isThesisExist", conn);
            registeredThesis.CommandType = CommandType.StoredProcedure;

            registeredThesis.Parameters.Add(new SqlParameter("@SSN", SqlDbType.Int)).Value = SSN;

            SqlParameter exist = registeredThesis.Parameters.Add("@exist", SqlDbType.Bit);
            exist.Direction = System.Data.ParameterDirection.Output;



            conn.Open();
            registeredThesis.ExecuteNonQuery();
            conn.Close();

            if(exist.Value.ToString() == "False")
            {
                Response.Write("<script>alert('Thesis is not registered');</script>");
            }
            else
            {
                Response.Write("Number of Extensions updated successfully");
                conn.Open();
                updateExtensions.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}