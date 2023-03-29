using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class Reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox3.Text == TextBox4.Text)
            {
                string code = Session["emailCode"].ToString();
                if (code == TextBox2.Text)
                {
                    if (BLL.UserInfoManager.xg(TextBox3.Text, TextBox1.Text))
                    {

                        Response.Write("<script>alert('修改成功')</script>");
                        Response.Redirect("~/ALogin.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('账号错误或者不存在')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('验证码错误')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('两次密码不一致')</script>");
            }
        }
        //密码
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            this.TextBox1.Attributes["value"] = Request.Form[TextBox1.ClientID];
        }
        //确认密码
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            this.TextBox2.Attributes["value"] = Request.Form[TextBox2.ClientID];
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (BLL.UserInfoManager.UserInfoByemail(TextBox1.Text) == null)
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