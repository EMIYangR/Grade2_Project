using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class Login : System.Web.UI.Page
    {
        //public static int userid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string code = Session["emailCode"].ToString();
            if (code == TextBox2.Text)
            {

                Response.Write("<script>alert('登录成功')</script>");
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                Response.Write("<script>alert('登录失败')</script>");
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (BLL.UserInfoManager.UserInfoByemail(TextBox1.Text) != null)
            {
                Help.EmailCode.Send(TextBox1.Text);
            }
            else
            {
                Response.Write("<script>alert('邮箱不存在')</script>");
            }
        }
    }
}