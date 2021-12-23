using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace PostGSQL
{
    public partial class publicationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linknadd(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String titlez = title.Text;
            String pub = pubdate.Text;
            String hostt = host.Text;
            String placee = place.Text;
            String acceptedd = accepted.SelectedItem.Text;
            String serialnoo = serialno.Text;

            Boolean acc;
            if (acceptedd == "1")
                acc = true;
            else
                acc = false;

            SqlCommand addPublication = new SqlCommand("addPublication", conn);
            addPublication.CommandType = CommandType.StoredProcedure;


            SqlCommand lastid = new SqlCommand("lastid", conn);
            lastid.CommandType = CommandType.StoredProcedure;

            addPublication.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar)).Value = titlez;
            addPublication.Parameters.Add(new SqlParameter("@pubDate", SqlDbType.DateTime)).Value = DateTime.ParseExact(pub, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            addPublication.Parameters.Add(new SqlParameter("@host", SqlDbType.VarChar)).Value = hostt;
            addPublication.Parameters.Add(new SqlParameter("@place", SqlDbType.VarChar)).Value = placee;
            addPublication.Parameters.Add(new SqlParameter("@accepted", SqlDbType.Bit)).Value = acc;
            
            conn.Open();
            addPublication.ExecuteNonQuery();
            conn.Close();

            SqlParameter id = lastid.Parameters.Add("@lastid", SqlDbType.Int);
            id.Direction = System.Data.ParameterDirection.Output;

            SqlCommand linkPubThesis = new SqlCommand("linkPubThesis", conn);
            linkPubThesis.CommandType = CommandType.StoredProcedure;

            conn.Open();
            lastid.ExecuteNonQuery();
            conn.Close();

            linkPubThesis.Parameters.Add(new SqlParameter("@PubID", SqlDbType.Int)).Value = id.Value;
            linkPubThesis.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialnoo;


            SqlCommand getType = new SqlCommand("GetType", conn);
            getType.CommandType = CommandType.StoredProcedure;


            getType.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];

            SqlParameter type = getType.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;


            conn.Open();
            linkPubThesis.ExecuteNonQuery();
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
    }
}