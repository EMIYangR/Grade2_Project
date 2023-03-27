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
            string sql = string.Format("insert ShortDistance values('{0}','{1}','{2}','{3}',{4},{5},{6},'{7}',{8},{9},'{10}')",
                sd.S_StartingPlace, sd.S_Approach, sd.S_Destination,
                sd.S_TimeRequired, sd.S_Number, sd.S_Kilometers, sd.S_Price,
                sd.S_Message, sd.PublishID, sd.UserID, sd.S_Effective);
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
        public static int SelectByS_IDUserID(int S_ID)//根据S_ID查userid
        {
            string sql = "  select a.UserID userid from ShortDistance a join UserInfo b on a.UserID=b.UserID where a.S_ID=" + S_ID;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            int userid = 0;
            while (dr.Read())
            {
                userid = (int)dr["userid"];
            }
            dr.Close();
            return userid;
        }
        public static bool ByS_IDNumber(int number, int S_ID)//根据S_ID修改人数
        {
            string sql = string.Format("update ShortDistance set S_Number={0} where S_ID={1}", number, S_ID);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static ShortDistance SelectAByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询查询具体数据让人数
        {
            string sql = string.Format("  select * from ShortDistance where S_StartingPlace='{0}' and S_Destination='{1}' " +
                "and S_TimeRequired = '{2}' and UserID = {3} and PublishID = 1", a, b, c, d);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            ShortDistance l = new ShortDistance();
            while (dr.Read())
            {
                l.S_ID = (int)dr["S_ID"];
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                l.UserID = (int)dr["UserID"];
                l.S_Effective = dr["S_Effective"].ToString();
            }
            dr.Close();
            return l;
        }
        public static string SelectByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询是否存在
        {
            string sql = string.Format("  select * from ShortDistance where S_StartingPlace='{0}' and S_Destination='{1}' " +
                "and S_TimeRequired = '{2}' and UserID = {3} and PublishID = 1", a, b, c, d);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            string p = "";
            if (dr.HasRows)
            {
                p = null;
            }
            dr.Close();
            return p;
        }
        public static int SelectByUserID(int id)//根据S_ID查询UserID
        {
            string sql = "select UserID from ShortDistance where S_ID=" + id;
            int UserID = 0;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            while (dr.Read())
            {
                UserID = (int)dr["UserID"];
            }
            dr.Close();
            return UserID;
        }
        public static bool XgEffectiveCk(int id)//乘客修改有效无效
        {
            string sql = "UPDATE ShortDistance SET S_Effective = '无效' WHERE S_ID=" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool XgEffective(int id)//司机修改有效无效
        {
            string sql = "UPDATE ShortDistance SET S_Effective ='无效' WHERE S_ID =" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static int SelectByS_ID(int id)//总人数
        {
            string sql = "select S_Number from ShortDistance where S_ID=" + id;
            int number = 0;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            while (dr.Read())
            {
                number = (int)dr["S_Number"];
            }
            dr.Close();
            return number;
        }
        public static List<ShortDistance> lianbiao()//连表查询
        {
            string sql = "select b.PublishID,a.S_ID,b.PublishName,c.CarType,a.S_StartingPlace,a.S_Approach,a.S_Destination,a.S_TimeRequired,a.S_Number,a.S_Kilometers,a.S_Message,a.S_Price from ShortDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID";
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static List<ShortDistance> SelectByNumber(int id)//司机根基Publishid的总数据条数
        {
            string sql;
            if (id == 1)
            {
                sql = string.Format("SELECT * FROM ShortDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID={0} and ld.S_Effective = '有效'", id);
            }
            else
            {
                sql = string.Format("select * from ShortDistance a join Publish b on a.PublishID = b.PublishID " +
                "join UserInfo c on c.UserID = a.UserID where b.PublishID = {0}", id);
            }
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();

            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;

        }
        public static List<ShortDistance> SelectByPublishIDPage(int count, int pageIndex, int id)//根基Publishid查询分页查询
        {
            int a = (pageIndex - 1) * 10;
            string sql;
            if (id == 1)
            {
                sql = string.Format("SELECT top {0} * FROM ShortDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.S_Effective = '有效' AND ld.S_ID " +
                "NOT IN(SELECT TOP {1} ld.S_ID FROM ShortDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.S_Effective = '有效')", count, a, id);
            }
            else
            {
                sql = string.Format("SELECT TOP {0} * FROM ShortDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.S_Effective = '有效' AND ld.S_ID " +
                "NOT IN(SELECT TOP {1} ld.S_ID FROM ShortDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.S_Effective = '有效')", count, a, id);
            }


            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();

            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString(); l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static List<ShortDistance> SelectByPublishID(int id)//根基Publishid查询
        {
            string sql = "select b.PublishID,c.UserPhone,c.CarID,a.S_ID,b.PublishName,c.CarType,a.S_StartingPlace,a.S_Approach,a.S_Destination,a.S_TimeRequired,a.S_Number,a.S_Kilometers,a.S_Message,a.S_Price from ShortDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where b.PublishID=" + id;

            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString();
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static ShortDistance SelectByID(int id)//根据id查
        {
            string sql = "select b.PublishID,a.S_ID,b.PublishName,c.CarType,a.S_StartingPlace,a.S_Approach,a.S_Destination,a.S_TimeRequired,a.S_Number,a.S_Kilometers," +
            "a.S_Message,a.S_Price,c.UserPhone,c.CarID from ShortDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where a.S_ID=" + id;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            ShortDistance l = new ShortDistance();
            if (dr.Read())
            {
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.CarID = dr["CarID"].ToString();
                l.UserPhone = dr["UserPhone"].ToString();
                l.PublishID = (int)dr["PublishID"];
            }
            dr.Close();
            return l;
        }
        public static ShortDistance SelectByAddNumber(int id)//人数
        {
            string sql = "select a.S_ID,b.PublishName,c.CarType,a.S_StartingPlace,a.S_Approach,a.S_Destination,a.S_TimeRequired,a.S_Number,a.S_Kilometers," +
            "a.S_Message,a.S_Price,c.UserPhone,c.CarID,d.AddNumber from ShortDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID join Follow d on a.S_ID=d.S_ID where a.S_ID=" + id;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            ShortDistance l = new ShortDistance();
            if (dr.Read())
            {
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.CarID = dr["CarID"].ToString();
                l.UserPhone = dr["UserPhone"].ToString();
                l.AddNumber = (int)dr["AddNumber"];
            }
            dr.Close();
            return l;
        }
        public static List<ShortDistance> All()//全查
        {
            string sql = "select * from ShortDistance";
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_ID = (int)dr["S_ID"];
                l.S_StartingPlace = dr["S_StartingPlace"].ToString(); 
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.UserID = (int)dr["UserID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }

        public static List<ShortDistance> SelectAllByCity(int id, string a, string b)//根据地区查询
        {
            string sql = string.Format("select * from ShortDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where b.PublishID ={0} and a.S_StartingPlace = '{1}' and a.S_Destination = '{2}' and a.S_Effective = '有效'", id, a, b);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_ID = (int)dr["S_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString();
                l.S_Approach = dr["S_Approach"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                l.S_TimeRequired = dr["S_TimeRequired"].ToString();
                l.S_Number = (int)dr["S_Number"];
                l.S_Kilometers = Convert.ToDecimal(dr["S_Kilometers"]);
                l.S_Price = Convert.ToDecimal(dr["S_Price"]);
                l.S_Message = dr["S_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static List<ShortDistance> SelectByS_Effective(int userid, string Le)//根据有效无效查询历史订单
        {
            string sql = string.Format("select * from ShortDistance where UserID={0} and S_Effective={1}", userid, Le);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<ShortDistance> list = new List<ShortDistance>();
            while (dr.Read())
            {
                ShortDistance l = new ShortDistance();
                l.S_StartingPlace = dr["S_StartingPlace"].ToString();
                l.S_Destination = dr["S_Destination"].ToString();
                list.Add(l);
            }
            dr.Close();
            return list;
        }
    }
}
