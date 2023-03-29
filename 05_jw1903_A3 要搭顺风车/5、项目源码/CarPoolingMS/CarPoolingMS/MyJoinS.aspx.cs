using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace CarPoolingMS
{
    public partial class MyJoinS : System.Web.UI.Page
    {
        public static int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["userid"];
                if (cookie == null)
                {
                    Response.Write("<script>alert('请先登录！');location.href='ALogin.aspx'</script>");
                }
                int userid = ALogin.userid;
                i = 1;
                Repeater1.DataSource = FollowManager.JRB(userid);
                Repeater1.DataBind();
            }
            
        }
    }
}