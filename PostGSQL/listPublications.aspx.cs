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
    public partial class listPublications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand listPublications = new SqlCommand("ViewAStudentPublications", conn);
            listPublications.CommandType = CommandType.StoredProcedure;

            listPublications.Parameters.Add(new SqlParameter("@StudentID", SqlDbType.Int)).Value = Session["sid"];

            conn.Open();
            SqlDataReader rdr = listPublications.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                String title = rdr.GetString(rdr.GetOrdinal("title"));
                String date = rdr.GetDateTime(rdr.GetOrdinal("date")).ToString();
                String place = rdr.GetString(rdr.GetOrdinal("place"));
                bool accepted = rdr.GetBoolean(rdr.GetOrdinal("accepted"));
                String host = rdr.GetString(rdr.GetOrdinal("host"));

                Label idL = new Label();
                idL.Text = "ID: " + id;

                Label titleL = new Label();
                titleL.Text = "Title: " + title;

                Label dateL = new Label();
                dateL.Text = "Date: " + date;

                Label placeL = new Label();
                placeL.Text = "Place: " + place;

                Label acceptedL = new Label();
                if (accepted)
                {
                    acceptedL.Text = "Accepted: Yes";
                }
                else
                {
                    acceptedL.Text = "Accepted: No";
                }

                Label hostL = new Label();
                hostL.Text = "Host: " + host;

                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(idL);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(titleL);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(dateL);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(placeL);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(acceptedL);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(hostL);
                form1.Controls.Add(new LiteralControl("<br />"));
                form1.Controls.Add(new LiteralControl("<br />"));
            }

        }
    }
}