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
    public partial class ShortDetails : System.Web.UI.Page
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
                    ShortDistance l = ShortDistanceManager.SelectByID(id);
                    Label1.Text = l.S_Price.ToString();
                    Label3.Text = l.S_StartingPlace + "-"+l.S_Approach+"-" + l.S_Destination;
                    Label4.Text = l.S_TimeRequired;
                    Label5.Text = l.UserPhone;
                    Label6.Text = l.CarType;
                    Label7.Text = l.S_Number.ToString();
                    Label8.Text = l.S_Message;
                    Label9.Text = l.CarID;
                    Label10.Text = l.S_Kilometers.ToString();
                    ShortDistance la = ShortDistanceManager.SelectByAddNumber(id);
                    int number = la.S_Number - la.AddNumber;
                    if (number < 0)
                    {
                        number = la.S_Number;
                    }
                    else
                    {
                        Label11.Text = number.ToString();
                    }
                    Label12.Text = l.PublishName;
                }
                else
                {
                    Response.Redirect("Short.aspx");
                }
            }
        }
    }
}