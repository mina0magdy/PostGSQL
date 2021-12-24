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
    public partial class listTheses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGSQL"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand listTheses = new SqlCommand("AdminViewAllTheses", conn);
            listTheses.CommandType = CommandType.StoredProcedure;

            SqlCommand thesesCount = new SqlCommand("AdminViewOnGoingThesesP", conn);
            thesesCount.CommandType = CommandType.StoredProcedure;

            SqlParameter countT = thesesCount.Parameters.Add("@count", SqlDbType.Int);
            countT.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            thesesCount.ExecuteNonQuery();
            Response.Write("Number of ongoing Theses: " + countT.Value);
            conn.Close();

            DataTable table = new DataTable();
            table.Columns.Add("Serial Number");
            table.Columns.Add("Field");
            table.Columns.Add("Type");
            table.Columns.Add("Title");
            table.Columns.Add("Start Date");
            table.Columns.Add("End Date");
            table.Columns.Add("Defense Date");
            table.Columns.Add("Years");
            table.Columns.Add("Grade");
            table.Columns.Add("Payment ID");
            table.Columns.Add("Number Of Extensions");

            conn.Open();
            SqlDataReader rdr = listTheses.ExecuteReader(CommandBehavior.CloseConnection);
            Boolean flag = false;
            while (rdr.Read())
            {
                flag = true;
                DataRow dataRow = table.NewRow();
                int SSN = rdr.GetInt32(rdr.GetOrdinal("serialNumber"));
                String Field = rdr.GetString(rdr.GetOrdinal("field"));
                String Type = rdr.GetString(rdr.GetOrdinal("type"));
                String Title = rdr.GetString(rdr.GetOrdinal("title"));
                if (!rdr.IsDBNull(rdr.GetOrdinal("startDate")))
                {
                    DateTime StartDate = rdr.GetDateTime(rdr.GetOrdinal("startDate"));
                    dataRow["Start Date"] = StartDate;
                }
                else
                {
                    dataRow["Start Date"] = "_";
                }
                if (!rdr.IsDBNull(rdr.GetOrdinal("endDate")))
                {
                    DateTime EndDate = rdr.GetDateTime(rdr.GetOrdinal("endDate"));
                    dataRow["End Date"] = EndDate;
                }
                else
                {
                    dataRow["End Date"] = "_";
                }
                if (!rdr.IsDBNull(rdr.GetOrdinal("defenseDate")))
                {
                    DateTime DefenseDate = rdr.GetDateTime(rdr.GetOrdinal("defenseDate"));
                    dataRow["Defense Date"] = DefenseDate;
                }
                else
                {
                    dataRow["Defense Date"] = "_";
                }
                if (!rdr.IsDBNull(rdr.GetOrdinal("years")))
                {
                    int Years = rdr.GetInt32(rdr.GetOrdinal("years"));
                    dataRow["Years"] = Years;
                }
                else
                {
                    dataRow["Years"] = "_";
                }
                if (!rdr.IsDBNull(rdr.GetOrdinal("grade")))
                {
                    decimal Grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                    dataRow["Grade"] = Grade;
                }
                else
                {
                    dataRow["Grade"] = "_";
                }
                if (!rdr.IsDBNull(rdr.GetOrdinal("payment_id")))
                {
                    int PaymentID = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                    dataRow["Payment ID"] = PaymentID;
                }
                else
                {
                    dataRow["Payment ID"] = "_";
                }
                int NoExtension = rdr.GetInt32(rdr.GetOrdinal("noExtension"));

                dataRow["Serial Number"] = SSN;
                dataRow["Field"] = Field;
                dataRow["Type"] = Type;
                dataRow["Title"] = Title;
                dataRow["Number Of Extensions"] = NoExtension;

                table.Rows.Add(dataRow);
            }

            if (flag == false)
            {
                Response.Write("<script>alert('No Theses found');</script>");
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = table;
                GridView1.DataBind();

            }
        }
    }
}