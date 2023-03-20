using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        //注册
        protected void Button1_Click(object sender, EventArgs e)
        {
            UserInfo u = new UserInfo();
            u.UserName = TextBox1.Text;
            u.UserAccount = TextBox2.Text;
            u.UserPwd = TextBox3.Text;
            u.UserPhone = TextBox5.Text;
            u.Email = TextBox6.Text;
            u.CarType = TextBox7.Text;
            u.CarID = TextBox8.Text;

            if (TextBox3.Text == TextBox4.Text)
            {
                string code = Session["emailCode"].ToString();
                if (code == TextBox9.Text)
                {
                    if (UserInfoManager.Add(u))
                    {
                        Response.Write("<script>alert('注册成功')</script>");
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('注册失败')</script>");
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
        //发送验证码
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            if (UserInfoManager.UserInfoByemail(TextBox6.Text) != null)
            {
                Response.Write("<script>alert('邮箱已经注册')</script>");
            }
            else
            {
                Help.EmailCode.Send(TextBox6.Text);
            }
        }

        //密码
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            this.TextBox3.Attributes["value"] = Request.Form[TextBox3.ClientID];
        }
        //确认密码
        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            this.TextBox4.Attributes["value"] = Request.Form[TextBox4.ClientID];
        }
    }
}