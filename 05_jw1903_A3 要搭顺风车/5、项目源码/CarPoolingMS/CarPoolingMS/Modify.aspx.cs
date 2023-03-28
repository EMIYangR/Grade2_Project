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
    public partial class Modify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Details.a == 1)
                {
                    LongDistance l = LongDistanceManager.SelectByID(Details.L_ID);
                    Label1.Text = l.PublishName;
                    Label2.Text = l.L_StartingPlace;
                    Label3.Text = l.L_Destination;
                    Label4.Text = "";
                    Label5.Text = string.Format(l.L_TimeRequired,"yyyy-MM-DD HH-mm-SS");
                    Label5.Text = l.L_TimeRequired;
                    Label6.Text = l.L_Kilometers.ToString();
                    Label7.Text = l.CarID;
                    Label8.Text = l.CarType;
                    Label9.Text = l.UserPhone;
                    Label10.Text = "";
                    TextBox1.Text = l.L_Number.ToString();
                }
                else
                {
                    ShortDistance l = ShortDistanceManager.SelectByID(ShortDetails.S_ID);
                    Label1.Text = l.PublishName;
                    Label2.Text = l.S_StartingPlace;
                    Label3.Text = l.S_Destination;
                    Label4.Text = l.S_Approach;
                    Label5.Text = l.S_TimeRequired;
                    Label6.Text = l.S_Kilometers.ToString();
                    Label7.Text = l.CarID;
                    Label8.Text = l.CarType;
                    Label9.Text = l.UserPhone;
                    TextBox1.Text = l.S_Number.ToString();
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int number = int.Parse(TextBox1.Text);
            if (Details.a == 1)
            {
                if (LongDistanceManager.ByL_IDNumber(number, Details.L_ID))
                {
                    Response.Write("<script>alert('修改成功');location.href = 'Long.aspx?id=1'</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败')</script>");
                }
            }
            else 
            {
                if (ShortDistanceManager.ByS_IDNumber(number, ShortDetails.S_ID))
                {
                    Response.Write("<script>alert('修改成功');location.href = 'Short.aspx?id=1'</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改失败')</script>");
                }
            }
        }
    }
}