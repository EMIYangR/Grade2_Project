using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PublishService
    {
        public static List<Publish> SelectAll()//全查
        {
            string sql = "select * from Publish";
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<Publish> list = new List<Publish>();
            while (dr.Read())
            {
                Publish p = new Publish();
                p.PublishID = (int)dr["PublishID"];
                p.PublishName = dr["PublishName"].ToString();
                list.Add(p);
            }
            dr.Close();
            return list;
        }
    }
}
