using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ShortDistanceService
    {
        public static List<ShortDistance> SelectAll()//全查
        {
            string sql = "select * from ShortDistance";
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);

            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance sd = new ShortDistance();

                sd.S_ID = (int)dr["S_ID"];
                sd.S_StartingPlace = dr["S_StartingPlace"].ToString();
                sd.S_Approach = dr["S_Approach"].ToString();
                sd.S_Destination = dr["S_Destination"].ToString();
                sd.S_TimeRequired = dr["S_TimeRequired"].ToString();
                sd.S_Number = (int)dr["S_Number"];
                sd.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                sd.S_Price = Convert.ToDecimal(dr["S_Price"]);
                sd.S_Message = dr["S_Message"].ToString();
                sd.PublishID = (int)dr["PublishID"];
                sd.UserID = (int)dr["UserID"];

                list.Add(sd);
            }
            dr.Close();
            return list;
        }
        public static List<ShortDistance> SelectLine(string a, string b)//查线路
        {
            string sql = string.Format(
                "select * from ShortDistance where S_StartingPlace='{0}' and S_Destination = '{1}';" +
                "select * from ShortDistance where S_StartingPlace = '{2}' and S_Approach ='{3}';" +
                "select * from ShortDistance where S_Approach == '{4}' and S_Destination = '{5}';"
                , a, b, a, b, a, b);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);

            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance sd = new ShortDistance();

                sd.S_ID = (int)dr["S_ID"];
                sd.S_StartingPlace = dr["S_StartingPlace"].ToString();
                sd.S_Approach = dr["S_Approach"].ToString();
                sd.S_Destination = dr["S_Destination"].ToString();
                sd.S_TimeRequired = dr["S_TimeRequired"].ToString();
                sd.S_Number = (int)dr["S_Number"];
                sd.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                sd.S_Price = Convert.ToDecimal(dr["S_Price"]);
                sd.S_Message = dr["S_Message"].ToString();
                sd.PublishID = (int)dr["PublishID"];
                sd.UserID = (int)dr["UserID"];

                list.Add(sd);
            }
            dr.Close();
            return list;
        }
        public static bool Add(ShortDistance sd)//增
        {
            string sql = string.Format("insert ShortDistance values('{0}','{1}',{2},'{3}',{4},{5},{6},{7},{8}})",
                sd.S_StartingPlace, sd.S_Approach, sd.S_Destination,
                sd.S_TimeRequired, sd.S_Number, sd.S_Kilometers, sd.S_Price,
                sd.PublishID, sd.UserID);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool Delete(int id)//删
        {
            string sql = string.Format("delete from ShortDistance where S_ID={0}", id);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool Update(int id, ShortDistance sd)//改
        {
            string sql = string.Format("update ShortDistance set S_Price={0} where S_ID={1}", sd.S_Price, id);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
    }
}
