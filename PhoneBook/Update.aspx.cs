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
    public partial class Update : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection(@"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        private SqlDataAdapter sda;
        private DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showdata();
            }
        }

        private void showdata()
        {
            dt = new DataTable();
            conn.Open();
            sda = new SqlDataAdapter("SELECT * FROM PhoneBook ORDER BY ID", conn);
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridViewPhoneBook.DataSource = dt;
                GridViewPhoneBook.DataBind();
            }
            conn.Close();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //NewEditIndex property used to determine the index of the row being edited.
            GridViewPhoneBook.EditIndex = e.NewEditIndex;
            showdata();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            GridViewPhoneBook.EditIndex = -1;
            showdata();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update
            Label id = GridViewPhoneBook.Rows[e.RowIndex].FindControl("labelID") as Label;
            TextBox name = GridViewPhoneBook.Rows[e.RowIndex].FindControl("TextBoxName") as TextBox;
            TextBox contact = GridViewPhoneBook.Rows[e.RowIndex].FindControl("TextBoxContact") as TextBox;
            TextBox location = GridViewPhoneBook.Rows[e.RowIndex].FindControl("TextBoxLocation") as TextBox;
            conn.Open();
            //updating the record
            string sql = string.Format("UPDATE PhoneBook SET Name = N'{0}', Contact = '{1}', Location = N'{2}' WHERE ID = '{3}' ", name.Text, contact.Text, location.Text, Convert.ToInt32(id.Text));
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview
            GridViewPhoneBook.EditIndex = -1;
            //Call ShowData method for displaying updated data
            showdata();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}