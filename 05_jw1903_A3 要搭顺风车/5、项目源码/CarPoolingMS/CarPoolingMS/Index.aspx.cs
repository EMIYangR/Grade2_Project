using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater1.DataSource = LongDistanceManager.lianbiao();
                Repeater1.DataBind();
            }
        }
        //搜索
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "")
            {
                Repeater1.DataSource = LongDistanceManager.SelectAllByCity(TextBox1.Text, TextBox2.Text);
            }
            else
            {
                Repeater1.DataSource = LongDistanceManager.lianbiao();
            }
            Repeater1.DataBind();
        }
        //乘客
        protected void Button4_Click(object sender, EventArgs e)
        {
            Repeater1.DataSource = LongDistanceManager.lianbiao();
            Repeater1.DataBind();
        }
        //司机
        protected void Button2_Click(object sender, EventArgs e)
        {
            Repeater1.DataSource = LongDistanceManager.SelectByPublishID(2);
            Repeater1.DataBind();
        }
        //全部
        protected void Button3_Click(object sender, EventArgs e)
        {
            Repeater1.DataSource = LongDistanceManager.SelectByPublishID(1);
            Repeater1.DataBind();
        }
    }
}