using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;

namespace CarPoolingMS
{
    public partial class ALogin : System.Web.UI.Page
    {
        public static int userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string user = TextBox1.Text.Trim();
            string pwd = TextBox2.Text.Trim();


            if (UserInfoManager.UserInfoByuserpwd(TextBox1.Text, TextBox2.Text) == null)
            {
                Response.Write("<script>location.href='Index.aspx'</script>");

                userid = UserInfoManager.UserInfoByuserid(TextBox1.Text, TextBox2.Text);

                Response.Cookies["userid"].Value = userid.ToString();
            }
            else
            {
                Response.Write("<script>alert('账号和密码错误')</script>");
            }
        }
    }
}