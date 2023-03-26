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
        public static int ID;//PublishID
        public static int UserID;//用户id
        public static int dlUserID;//登录用户id
        public static int L_ID; 
        Pager pager;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);
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
                    LongDistance la = LongDistanceManager.SelectByAddNumber(id);
                    int number = la.L_Number - la.AddNumber;
                    if (number < 0)
                    {
                        number = la.L_Number;
                    }
                    else
                    {
                        Label11.Text = number.ToString();
                    }
                    Label12.Text = l.PublishName;
                }
                else
                {
                    Response.Redirect("Long.aspx?id=1");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }

        protected void Button7_Click(object sender, EventArgs e)
        {

        }

        protected void Button8_Click(object sender, EventArgs e)
        {

        }

        protected void Button9_Click(object sender, EventArgs e)
        {

        }

        protected void Button10_Click(object sender, EventArgs e)
        {

        }
    }
}