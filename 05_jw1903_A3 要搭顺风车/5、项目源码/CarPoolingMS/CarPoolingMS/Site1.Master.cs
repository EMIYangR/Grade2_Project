using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["userid"];
                if (cookie.Value != null)
                {
                    LinkButton1.Text = "切换账户";
                    LinkButton2.Text = "";
                    ALogin.userid = int.Parse(cookie.Value);
                }
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {

            Response.Redirect("<script>alert('请登录！');location.href='ALogin.aspx'</script>");
            //LinkButton1.Text = "登录";
            //LinkButton2.Text = "注册";
            //LinkButton3.Text = "";
        }
    }
}