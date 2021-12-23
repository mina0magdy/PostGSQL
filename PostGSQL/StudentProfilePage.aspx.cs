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
                int line5= rdr.GetInt32(rdr.GetOrdinal("id"));
                String line = rdr.GetString(rdr.GetOrdinal("firstName"));
                String line1 = rdr.GetString(rdr.GetOrdinal("lastName"));
                String line2 = rdr.GetString(rdr.GetOrdinal("type"));
                String line3 = rdr.GetString(rdr.GetOrdinal("faculty"));
                String line4 = rdr.GetString(rdr.GetOrdinal("address"));
                float line6 = rdr.GetFloat(rdr.GetOrdinal("GPA"));
               // String line6 = rdr.GetString(rdr.GetOrdinal("undergradID"));

                Label label1 = new Label();
                label1.Text = " ID: " + line5;
                Label label2 = new Label();
                label2.Text = " Name: " + line+" "+line1;
                Label label3 = new Label();
                label3.Text = " Degree: " + line2;
                Label label6 = new Label();
                label6.Text = " Faculty: " + line3;
                Label label4 = new Label();
                label4.Text = " Address: " + line4;
                Label label5 = new Label();
                label5.Text = "GPA: " + line6;
                form1.Controls.Add(label1);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(label2);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(label3);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(label6);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(label4);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(label5);

            }
        }
    }
}
