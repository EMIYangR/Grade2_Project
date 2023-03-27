using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class AddCarID : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        //完成
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = ALogin.userid;
            if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "")
            {
                if (UserInfoManager.XgByType(TextBox1.Text, TextBox2.Text, id))
                {
                    Response.Write("<script>alert('完成添加')</script>;location.href='Publish.aspx'</script>");
                }
            }
        }
    }
}