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
    public partial class Publish : System.Web.UI.Page
    {
        public static string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox4.Attributes["onclick"] = ClientScript.GetPostBackEventReference(Button0, null);
                if (ALogin.userid == 0)
                {
                    Response.Write("<script>alert('请先登录！');location.href='ALogin.aspx'</script>");
                }

                string a = name;

            }


        }

        protected void Button0_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Calendar1.Visible = false;
            TextBox4.Text = Calendar1.SelectedDate.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadioButton1.Checked)
            {
                if (RadioButton3.Checked)
                {
                    if (Request.QueryString["id"] == null)
                    {
                        string type = UserInfoManager.SelectByCarID(ALogin.userid);//根据userid查询车牌号
                        if (type.Trim() != "无")
                        {
                            LongDistance l = new LongDistance();
                            l.L_StartingPlace = TextBox1.Text;
                            l.L_Destination = TextBox2.Text;
                            l.L_TimeRequired = TextBox4.Text;
                            l.L_Message = TextBox8.Text;
                            l.PublishID = 1;
                            l.UserID = ALogin.userid;
                            l.L_Effective = "有效";
                            if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox4.Text.Trim() != "" && TextBox8.Text.Trim() != "")
                            {
                                if (TextBox5.Text.Trim() != "" && TextBox6.Text.Trim() != "" && TextBox7.Text.Trim() != "")
                                {
                                    l.L_Number = int.Parse(TextBox5.Text);
                                    l.L_Kilometers = Convert.ToDecimal(TextBox6.Text);
                                    l.L_Price = Convert.ToDecimal(TextBox7.Text);
                                    if (LongDistanceManager.Add(l))
                                    {
                                        Response.Write("<script>alert('发布成功');location.href='Long.aspx?id=2'</script>");
                                    }
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('请完善车牌号和车类型');location.href='AddCarID.aspx'</script>");
                        }
                    }
                }
                else if (RadioButton4.Checked)
                {
                    if (Request.QueryString["id"] == null)
                    {
                        //name = RadioButton4.Text;
                        string type = UserInfoManager.SelectByCarID(ALogin.userid);//根据userid查询车牌号
                        if (type.Trim() != "无")
                        {
                            ShortDistance l = new ShortDistance();
                            l.S_StartingPlace = TextBox1.Text;
                            l.S_Destination = TextBox2.Text;
                            l.S_Approach = TextBox3.Text;
                            l.S_TimeRequired = TextBox4.Text;
                            l.S_Message = TextBox8.Text;
                            l.PublishID = 1;
                            l.UserID = ALogin.userid;
                            l.S_Effective = "有效";
                            if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox3.Text.Trim() != "" && TextBox4.Text.Trim() != "" && TextBox8.Text.Trim() != "")
                            {
                                if (TextBox5.Text.Trim() != "" && TextBox6.Text.Trim() != "" && TextBox7.Text.Trim() != "")
                                {
                                    l.S_Number = int.Parse(TextBox5.Text);
                                    l.S_Kilometers = Convert.ToDecimal(TextBox6.Text);
                                    l.S_Price = Convert.ToDecimal(TextBox7.Text);
                                    if (ShortDistanceManager.Add(l))
                                    {
                                        Response.Write("<script>alert('发布成功');location.href='Short.aspx?id=2'</script>");
                                    }
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('请完善车牌号和车类型');location.href='AddCarID.aspx'</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('请选择类型！')</script>");
                }
            }
            else if (RadioButton2.Checked)
            {
                if (RadioButton3.Checked)
                {
                    if (Request.QueryString["id"] == null)
                    {
                        LongDistance l = new LongDistance();
                        l.L_StartingPlace = TextBox1.Text;
                        l.L_Destination = TextBox2.Text;
                        l.L_TimeRequired = TextBox4.Text;
                        l.L_Message = TextBox8.Text;
                        //l.PublishID = int.Parse(Request.QueryString["id"]);
                        l.PublishID = 2;
                        l.UserID = ALogin.userid;
                        l.L_Effective = "有效";
                        if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox4.Text.Trim() != "" && TextBox7.Text.Trim() != "")
                        {
                            if (TextBox5.Text.Trim() != "" && TextBox6.Text.Trim() != "" && TextBox7.Text.Trim() != "")
                            {
                                l.L_Number = int.Parse(TextBox5.Text);
                                l.L_Kilometers = Convert.ToDecimal(TextBox6.Text);
                                l.L_Price = Convert.ToDecimal(TextBox7.Text);
                                if (LongDistanceManager.Add(l))
                                {
                                    Response.Write("<script>alert('发布成功');location.href='Long.aspx'</script>");

                                }
                            }
                        }
                    }
                }
                else if (RadioButton4.Checked)
                {
                    if (Request.QueryString["id"] == null)
                    {
                        ShortDistance l = new ShortDistance();
                        l.S_StartingPlace = TextBox1.Text;
                        l.S_Destination = TextBox2.Text;
                        l.S_Approach = TextBox3.Text;
                        l.S_TimeRequired = TextBox4.Text;
                        l.S_Message = TextBox8.Text;
                        l.PublishID = 2;
                        l.UserID = ALogin.userid;
                        l.S_Effective = "有效";
                        if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox3.Text.Trim() != "" && TextBox4.Text.Trim() != "" && TextBox7.Text.Trim() != "")
                        {
                            if (TextBox5.Text.Trim() != "" && TextBox6.Text.Trim() != "" && TextBox7.Text.Trim() != "")
                            {
                                l.S_Number = int.Parse(TextBox5.Text);
                                l.S_Kilometers = Convert.ToDecimal(TextBox6.Text);
                                l.S_Price = Convert.ToDecimal(TextBox7.Text);
                                if (ShortDistanceManager.Add(l))
                                {
                                    Response.Write("<script>alert('发布成功');location.href='Long.aspx'</script>");

                                }
                            }
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('请选择类型！')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('请选择拼车人！')</script>");
            }
        }

        protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = (RadioButton)sender;
            if (rb.Checked)
            {
                name = "短途拼车（上下班拼车）";
                
            }
        }
    }
}