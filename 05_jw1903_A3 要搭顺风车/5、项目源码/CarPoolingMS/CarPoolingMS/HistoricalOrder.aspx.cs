using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class HistoricalOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int userid = ALogin.userid;
                if (userid != 0)
                {
                    if (Request.QueryString["le"] != null)
                    {
                        string L_Effective = Request.QueryString["le"];
                        Repeater1.DataSource = LongDistanceManager.SelectByL_Effective(userid, L_Effective);
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