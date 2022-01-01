using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PostGSQL
{
    public partial class examinerAddComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("loginPage.aspx");
            }
        }


        protected void addComment(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int serial = Int32.Parse(thesisSerial.Text);
            String comment = thesisComment.Text;

            if (thesisSerial.Text == "" | comment == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('please fill the required data');", true);

            }
            else
            {
                SqlCommand addComment = new SqlCommand("addComment", conn);
                addComment.CommandType = System.Data.CommandType.StoredProcedure;


                addComment.Parameters.Add(new SqlParameter("@id", System.Data.SqlDbType.Int)).Value = Session["user"];
                addComment.Parameters.Add(new SqlParameter("@thesisSerial", System.Data.SqlDbType.Int)).Value = serial;
                addComment.Parameters.Add(new SqlParameter("@comment", System.Data.SqlDbType.VarChar)).Value = comment;

                SqlParameter success = addComment.Parameters.Add("@success", System.Data.SqlDbType.Bit);
                success.Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                addComment.ExecuteNonQuery();
                conn.Close();


                if (success.Value.ToString() == "True")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('your comment has been added successfully');", true);

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('this thesis does not belong to you');", true);

                }

            }
        }

        protected void backButton(object sender, EventArgs e)
        {


            Response.Redirect("loggedExaminer.aspx");

        }
    }
}