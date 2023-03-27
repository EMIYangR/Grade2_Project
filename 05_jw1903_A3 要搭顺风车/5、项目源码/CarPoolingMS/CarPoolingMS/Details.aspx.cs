using BLL;
using CarPoolingMS.Help;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarPoolingMS
{
    
    public partial class Details : System.Web.UI.Page
    {
        public static int a;
        public static int ID;//PublishID
        public static int UserID;//用户id
        public static int dlUserID;//登录用户id
        public static int L_ID;

        Pager pager;
        protected void Page_Load(object sender, EventArgs e)
        {
            a = 1;
            if (!IsPostBack)
            {
                pager = ViewState["pager"] as Pager;
                if (Request.QueryString["id"] != null)
                {

                    int id = int.Parse(Request.QueryString["id"]);
                    L_ID = id;
                    UserID = LongDistanceManager.SelectByUserID(id);//获发布用户id
                    dlUserID = ALogin.userid;//登录用户id

                    if (dlUserID == 0)
                    {
                        Response.Redirect("ALogin.aspx");
                    }

                    LongDistance l = LongDistanceManager.SelectByID(id);
                    Label1.Text = l.L_Price.ToString();
                    Label3.Text = l.L_StartingPlace + "-" + l.L_Destination;
                    Label4.Text = l.L_TimeRequired;
                    Label5.Text = l.UserPhone;
                    Label6.Text = l.CarType;
                    Label7.Text = l.L_Number.ToString();
                    Label8.Text = l.L_Message;
                    Label9.Text = l.CarID;
                    Label10.Text = l.L_Kilometers.ToString();

                    int count = LongDistanceManager.SelectByL_ID(id);//总人数
                    int addnumber = FollowManager.SelectByNumber(id);//已经加入的人数
                    int a = count - addnumber;//剩下可加入的数量
                    if (a <= 0)
                    {
                        LongDistanceManager.XgEffective(id);
                    }
                    else
                    {
                        Label11.Text = a.ToString();
                    }
                    Label12.Text = l.PublishName;
                    ID = l.PublishID;
                    Pager pager1 = new Pager();
                    ViewState["pager"] = pager1;//页面重新加载后更新分页对象
                    ReapterPageBind(pager1, id);
                }
                else
                {
                    Response.Redirect("Long.aspx");
                }
            }
        }
        private void ReapterPageBind(Pager pager, int id)//分页绑定
        {
            int sjuserid = LongDistanceManager.SelectByL_IDUserID(id);//发布的司机id
            pager.Count = CommentManager.SelectAll(sjuserid).Count; //总记录数
            //当前页码 / 总页码
            Label14.Text = string.Format("{0}/{1}", pager.PageIndex, pager.PageCount);
            Repeater1.DataSource = CommentManager.SelectBySjUserID(pager.PageSize, sjuserid, pager.PageIndex);
            Repeater1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                int count = LongDistanceManager.SelectByL_ID(id);//总人数
                int addnumber = FollowManager.SelectByNumber(id);//已经加入的人数
                int a = count - addnumber;//剩下可加入的数量
                if (TextBox1.Text.Trim() != "")
                {
                    int number = int.Parse(TextBox1.Text);//用户输入的人数
                    if (number < a)
                    {
                        Follow f = new Follow();

                        f.L_ID = id;
                        f.UserID = ALogin.userid;
                        f.AddNumber = number;
                        if (FollowManager.Add(f))
                        {
                            Label11.Text = (a - number).ToString();
                            if (FollowManager.SelectByNumber(id) == count)
                            {
                                if (LongDistanceManager.XgEffective(id))
                                {

                                }

                            }
                            Response.Write("<script>alert('加入成功')</script>");
                            Response.Redirect("Long.aspx");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('人数超过限制')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('不能为空')</script>");
                }




            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                if (LongDistanceManager.Delete(id))
                {
                    Response.Write("<script>alert('删除成功')</script>;location.href='Long.aspx?id=1'</script>");
                }
                else
                {
                    Response.Write("<script>alert('删除失败')</script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                LongDistance l = LongDistanceManager.SelectByID(id);
                string ls = l.L_StartingPlace;
                string ld = l.L_Destination;
                string time = l.L_TimeRequired;
                int Unumber = l.L_Number;//用户写的加入的人数

                if (LongDistanceManager.SelectByLsLdTime(ls, ld, time, ALogin.userid) != null)
                {
                    Response.Write("<script>alert('请发布相关线路');location.href='SjFabu.aspx?id=2'</script>");
                }
                LongDistance le = LongDistanceManager.SelectAByLsLdTime(ls, ld, time, ALogin.userid);
                int L_ID = le.L_ID;
                int number = le.L_Number;//司机发布人数
                int addnumber = FollowManager.SelectByNumber(L_ID);//已经加入的人数
                if (number - addnumber > Unumber)
                {
                    Follow f = new Follow();
                    f.L_ID = L_ID;
                    f.UserID = ALogin.userid;
                    f.AddNumber = Unumber;
                    if (FollowManager.Add(f))
                    {
                        Response.Write("<script>alert('邀请成功')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('邀请错误')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('人数超出限制')</script>");
                }

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                if (LongDistanceManager.Delete(id))
                {
                    Response.Write("<script>alert('删除成功')</script>");
                }
                else
                {
                    Response.Write("<script>alert('删除失败')</script>");
                }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                int sjuserid = LongDistanceManager.SelectByL_IDUserID(id);
                Comment c = new Comment();
                c.SjUserID = sjuserid;
                c.UserID = ALogin.userid;
                c.CommentContent = TextBox2.Text;
                c.Star = int.Parse(TextBox3.Text);
                if (CommentManager.Add(c))
                {
                    Pager pager = ViewState["pager"] as Pager;
                    pager.FirstPage();
                    ReapterPageBind(pager, id);
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('评论失败')</script>");
                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Pager pager = ViewState["pager"] as Pager;
                pager.FirstPage();
                ReapterPageBind(pager, id);
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Pager pager = ViewState["pager"] as Pager;
                pager.PrevPage();
                ReapterPageBind(pager, id);
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                if (TextBox4.Text.Trim() != "")
                {
                    int i = int.Parse(TextBox4.Text.Trim());
                    Pager pager = ViewState["pager"] as Pager;
                    pager.ToPage(i);
                    ReapterPageBind(pager, id);
                }
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Pager pager = ViewState["pager"] as Pager;
                pager.NextPage();
                ReapterPageBind(pager, id);
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                Pager pager = ViewState["pager"] as Pager;
                pager.LastPage();
                ReapterPageBind(pager, id);
            }
        }
    }
}