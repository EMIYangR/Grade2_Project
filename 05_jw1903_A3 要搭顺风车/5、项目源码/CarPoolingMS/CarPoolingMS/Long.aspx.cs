using BLL;
using CarPoolingMS.Help;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    public partial class Long : System.Web.UI.Page
    {
        Pager pager;
        int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            pager = ViewState["pager"] as Pager;
            if (!IsPostBack)
            {
                Repeater2.DataSource = PublishManager.SelectAll();
                Repeater2.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    id = int.Parse(Request.QueryString["id"]);
                }

                Pager pager1 = new Pager();
                ViewState["pager"] = pager1;//页面重新加载后更新分页对象
                ReapterPageBind(pager1, id);
            }
        }

        private void ReapterPageBind(Pager pager, int id)//分页绑定
        {
            pager.Count = LongDistanceManager.SelectByNumber(id).Count; //总记录数
            //当前页码 / 总页码
            Label1.Text = string.Format("{0}/{1}", pager.PageIndex, pager.PageCount);
            Repeater1.DataSource = LongDistanceManager.SelectByPublishIDPage(pager.PageSize, pager.PageIndex, id);
            Repeater1.DataBind();
        }
        //搜索
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "")
                {
                    Repeater1.DataSource = LongDistanceManager.SelectAllByCity(id, TextBox1.Text, TextBox2.Text);
                    Repeater1.DataBind();
                }
                else
                {
                    Repeater1.DataSource = LongDistanceManager.SelectByPublishID(2);
                    Repeater1.DataBind();
                }
            }
        }
        //首页
        protected void Button7_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                pager.FirstPage();
                ReapterPageBind(pager, id);
            }
        }
        //上一页
        protected void Button8_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                pager.PrevPage();
                ReapterPageBind(pager, id);
            }
        }
        //搜索
        protected void Button9_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                if (TextBox3.Text.Trim() != "")
                {
                    int i = int.Parse(TextBox3.Text.Trim());
                    pager.ToPage(i);
                    ReapterPageBind(pager, id);
                }
            }
        }
        //下一页
        protected void Button10_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                pager.NextPage();
                ReapterPageBind(pager, id);
            }
        }
        //尾页
        protected void Button11_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Pager pager = ViewState["pager"] as Pager;
                pager.LastPage();
                ReapterPageBind(pager, id);
            }
        }

        ////司机
        //protected void Button5_Click(object sender, EventArgs e)
        //{
        //    Repeater1.DataSource = LongDistanceManager.SelectByPublishID(2);
        //    Repeater1.DataBind();
        //}
        ////乘客
        //protected void Button6_Click(object sender, EventArgs e)
        //{
        //    Repeater1.DataSource = LongDistanceManager.SelectByPublishID(1);
        //    Repeater1.DataBind();
        //}
    }
}