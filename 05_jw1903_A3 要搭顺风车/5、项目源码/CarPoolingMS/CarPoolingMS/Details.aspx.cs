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
    public partial class Details : System.Web.UI.Page
    {
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
                    Response.Redirect("Long.aspx");
                }
            }
        }
    }
}