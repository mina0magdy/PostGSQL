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
        protected void Backbutton(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand getType = new SqlCommand("GetType", conn);
            getType.CommandType = CommandType.StoredProcedure;

            getType.Parameters.Add(new SqlParameter("@id", SqlDbType.Int)).Value = Session["user"];

            SqlParameter type = getType.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
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


            SqlCommand checkThesis = new SqlCommand("checkThesis", conn);
            checkThesis.CommandType = CommandType.StoredProcedure;


            checkThesis.Parameters.Add(new SqlParameter("@sid", SqlDbType.Int)).Value = Session["user"];
            checkThesis.Parameters.Add(new SqlParameter("@serialNo", SqlDbType.Int)).Value = serialnoo;
            SqlParameter isValid = checkThesis.Parameters.Add("@isValid", SqlDbType.Bit);
            isValid.Direction = System.Data.ParameterDirection.Output;
            conn.Open();
            checkThesis.ExecuteNonQuery();
            conn.Close();
            if (isValid.Value.ToString() == "False")
            {
                textMessage.Text = "Enter a serial number of your own thesis";
                messagePanel.Style["text-align"] = "center";
                //messagePanel.Visible = true;            
            }
            else
            {

                Boolean acc;
                if (acceptedd == "yes")
                    acc = true;
                else
                    acc = false;

                SqlCommand addPublicationV2 = new SqlCommand("addPublicationV2", conn);
                addPublicationV2.CommandType = CommandType.StoredProcedure;



                addPublicationV2.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar)).Value = titlez;
                try
                {
                    addPublicationV2.Parameters.Add(new SqlParameter("@pubDate", SqlDbType.VarChar)).Value = DateTime.ParseExact(pub, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                }
                catch (Exception ex)
                {

                    Response.Write("<script>alert('Date must be written in dd//yyyy format');</script>");
                    return;
                }
                addPublicationV2.Parameters.Add(new SqlParameter("@host", SqlDbType.VarChar)).Value = hostt;
                addPublicationV2.Parameters.Add(new SqlParameter("@place", SqlDbType.VarChar)).Value = placee;
                addPublicationV2.Parameters.Add(new SqlParameter("@accepted", SqlDbType.Bit)).Value = acc;
                SqlParameter id = addPublicationV2.Parameters.Add("@lastID", SqlDbType.Int);
                id.Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                try
                {
                    addPublicationV2.ExecuteNonQuery();

                }
                catch(Exception ex)
                {

                    Response.Write("<script>alert('Date must be written in dd//yyyy format');</script>");
                    return;
                }
                conn.Close();

                
                SqlCommand linkPubThesis = new SqlCommand("linkPubThesis", conn);
                linkPubThesis.CommandType = CommandType.StoredProcedure;


                linkPubThesis.Parameters.Add(new SqlParameter("@PubID", SqlDbType.Int)).Value = id.Value;
                linkPubThesis.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialnoo;

                textMessage.Text = "Publication created and linked successfully";
                messagePanel.Style["text-align"] = "center";


                conn.Open();
                linkPubThesis.ExecuteNonQuery();
                conn.Close();
             
            }
        }
    }
}