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
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        public void BindData()
        {
            List<ShortDistance> list = ShortDistanceManager.SelectAllLineByName(TextBox1.Text,TextBox2.Text);
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            BindData();
        }
    }
}