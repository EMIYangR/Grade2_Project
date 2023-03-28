using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class ShortHistoricalOrder : System.Web.UI.Page
    {
        public static int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                i = 1;
                int userid = ALogin.userid;
                if (userid != 0)
                {
                    if (Request.QueryString["le"] != null)
                    {
                        string S_Effective = Request.QueryString["le"];
                        Repeater1.DataSource = ShortDistanceManager.SelectByS_Effective(userid, S_Effective);
                        Repeater1.DataBind();
                    }
                }
                else
                {
                    Response.Write("<script>alert('请先登录！');location.href='ALogin.aspx'</script>");
                }
            }
        }
    }
}