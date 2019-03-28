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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
            string sqlquery = string.Format("INSERT INTO PhoneBook (Name, Contact, Location) VALUES (N'{0}', '{1}', N'{2}' ) ", TextBoxName.Text, TextBoxContact.Text, TextBoxLocation.Text);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqlquery, conn);
                int count = cmd.ExecuteNonQuery();
                if (count > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "added", "<script>alert('Contact Added...!!!');location='Default.aspx';</script>");
                    TextBoxContact.Text = "";
                    TextBoxLocation.Text = "";
                    TextBoxName.Text = "";
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('Failed, please try again...!!!');</script>");
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "failed", "<script>alert('Failed, please try again...!!!');</script>");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Delete.aspx");
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Update.aspx");
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Search.aspx");
        }
    }
}