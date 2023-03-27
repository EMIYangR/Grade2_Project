using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            if (UserInfoManager.UserInfoByuserpwd(TextBox1.Text, TextBox2.Text) == null)
            {
                Response.Write("<script>alert('登录成功')</script>");
                userid = UserInfoManager.UserInfoByuserid(TextBox1.Text, TextBox2.Text);
                Response.Redirect("Index.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败')</script>");
            }
        }
    }
}