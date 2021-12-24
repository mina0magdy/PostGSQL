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
    public partial class cancelThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelThesis_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand CancelThesis = new SqlCommand("CancelThesis", conn);
            CancelThesis.CommandType = CommandType.StoredProcedure;
            CancelThesis.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = ThesisSN.Text;
            conn.Open();
            // try
            //{
            int Check = CancelThesis.ExecuteNonQuery();
            if (Check <= 0)
            {
                Response.Write("<script>alert('The following Thesis number is not suited for cancelation as the last progress report evaluation is higher than zero ');</script>");


            }
            else
            {
                Response.Write("<h1>Thesis is Canceled successfuly</h1>");


            }

        }
    }
}