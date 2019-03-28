using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PhoneBook
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection conn = new SqlConnection(strcon);
            string sql = "SELECT * FROM PhoneBook ORDER BY ID";
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds, "message");
            conn.Close();
            GridView1.DataSource = ds.Tables["message"].DefaultView;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string strcon = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection conn = new SqlConnection(strcon);
            int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            SqlCommand cmd = new SqlCommand("DELETE FROM PhoneBook WHERE ID=" + ID + "", conn);
            conn.Open();
            int temp = cmd.ExecuteNonQuery();
            conn.Close();
            Page_Load(sender, e);
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}