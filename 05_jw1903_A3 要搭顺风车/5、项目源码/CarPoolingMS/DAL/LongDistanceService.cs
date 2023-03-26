using System;
using System.Collections.Generic;
﻿using Model;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class LongDistanceService
    {
        public static int SelectByL_IDUserID(int L_ID)//根据L_ID查userid
        {
            string sql = "  select a.UserID userid from LongDistance a join UserInfo b on a.UserID=b.UserID where a.L_ID=" + L_ID;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            int userid = 0;
            while (dr.Read())
            {
                userid = (int)dr["userid"];
            }
            dr.Close();
            return userid;
        }
        public static bool ByL_IDNumber(int number, int L_ID)//根据L_ID修改人数
        {
            string sql = string.Format("update LongDistance set L_Number={0} where L_ID={1}", number, L_ID);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static LongDistance SelectAByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询查询具体数据让人数
        {
            string sql = string.Format("  select * from LongDistance where L_StartingPlace='{0}' and L_Destination='{1}' " +
                "and L_TimeRequired = '{2}' and UserID = {3} and PublishID = 1", a, b, c, d);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            LongDistance l = new LongDistance();
            while (dr.Read())
            {
                l.L_ID = (int)dr["L_ID"];
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                l.UserID = (int)dr["UserID"];
                l.L_Effective = dr["L_Effective"].ToString();

            }
            dr.Close();
            return l;
        }
        public static string SelectByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询是否存在
        {
            string sql = string.Format("  select * from LongDistance where L_StartingPlace='{0}' and L_Destination='{1}' " +
                "and L_TimeRequired = '{2}' and UserID = {3} and PublishID = 1", a, b, c, d);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            string p = "";
            if (dr.HasRows)
            {
                p = null;
            }
            dr.Close();
            return p;
        }
        public static bool Delete(int id)//删除
        {
            string sql = "delete from LongDistance where L_ID=" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static int SelectByUserID(int id)//根据L_ID查询UserID
        {
            string sql = "select UserID from LongDistance where L_ID=" + id;
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
            string sql = "UPDATE LongDistance SET L_Effective = '无效' WHERE L_ID=" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool XgEffective(int id)//司机修改有效无效
        {
            string sql = "UPDATE LongDistance SET L_Effective ='无效' WHERE L_ID =" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static int SelectByL_ID(int id)//总人数
        {
            string sql = "select L_Number from LongDistance where L_ID=" + id;
            int number = 0;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            while (dr.Read())
            {
                number = (int)dr["L_Number"];
            }
            dr.Close();
            return number;
        }
        public static bool Add(LongDistance l)//添加
        {
            string sql = string.Format("insert LongDistance values('{0}','{1}','{2}',{3},{4},{5},'{6}',{7},{8},'{9}')"
                , l.L_StartingPlace, l.L_Destination, l.L_TimeRequired, l.L_Number, l.L_Kilometers, l.L_Price, l.L_Message, l.PublishID, l.UserID, l.L_Effective);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static List<LongDistance> lianbiao()//连表查询
        {
            string sql = "select b.PublishID,a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers,a.L_Message,a.L_Price from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID";
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<LongDistance> list = new List<LongDistance>();
            while (dr.Read())
            {
                LongDistance l = new LongDistance();
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static List<LongDistance> SelectByNumber(int id)//司机根基Publishid的总数据条数
        {
            string sql;
            if (id == 1)
            {
                sql = string.Format("SELECT * FROM LongDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID={0} and ld.L_Effective = '有效'", id);
            }
            else
            {
                sql = string.Format("select * from LongDistance a join Publish b on a.PublishID = b.PublishID " +
                "join UserInfo c on c.UserID = a.UserID where b.PublishID = {0}", id);
            }
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<LongDistance> list = new List<LongDistance>();

            while (dr.Read())
            {
                LongDistance l = new LongDistance();
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;

        }
        public static List<LongDistance> SelectByPublishIDPage(int count, int pageIndex, int id)//根基Publishid查询分页查询
        {
            int a = (pageIndex - 1) * 10;
            string sql;
            if (id == 1)
            {
                sql = string.Format("SELECT top {0} * FROM LongDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.L_Effective = '有效' AND ld.L_ID " +
                "NOT IN(SELECT TOP {1} ld.L_ID FROM LongDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.L_Effective = '有效')", count, a, id);
            }
            else
            {
                sql = string.Format("SELECT TOP {0} * FROM LongDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.L_Effective = '有效' AND ld.L_ID " +
                "NOT IN(SELECT TOP {1} ld.L_ID FROM LongDistance ld " +
                "JOIN UserInfo ui ON ui.UserID = ld.UserID " +
                "JOIN Publish p ON p.PublishID = ld.PublishID " +
                "WHERE ld.PublishID = {2} AND ld.L_Effective = '有效')", count, a, id);
            }


            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<LongDistance> list = new List<LongDistance>();

            while (dr.Read())
            {
                LongDistance l = new LongDistance();
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static List<LongDistance> SelectByPublishID(int id)//根基Publishid查询
        {
            string sql = "select b.PublishID,c.UserPhone,c.CarID,a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers,a.L_Message,a.L_Price from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where b.PublishID=" + id;

            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<LongDistance> list = new List<LongDistance>();
            while (dr.Read())
            {
                LongDistance l = new LongDistance();
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static LongDistance SelectByID(int id)//根据id查
        {
            string sql = "select b.PublishID,a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers," +
            "a.L_Message,a.L_Price,c.UserPhone,c.CarID from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where a.L_ID=" + id;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            LongDistance l = new LongDistance();
            if (dr.Read())
            {
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.CarID = dr["CarID"].ToString();
                l.UserPhone = dr["UserPhone"].ToString();
                l.PublishID = (int)dr["PublishID"];
            }
            dr.Close();
            return l;
        }
        public static LongDistance SelectByAddNumber(int id)//人数
        {
            string sql = "select a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers," +
            "a.L_Message,a.L_Price,c.UserPhone,c.CarID,d.AddNumber from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID join Follow d on a.L_ID=d.L_ID where a.L_ID=" + id;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            LongDistance l = new LongDistance();
            if (dr.Read())
            {
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.CarID = dr["CarID"].ToString();
                l.UserPhone = dr["UserPhone"].ToString();
                l.AddNumber = (int)dr["AddNumber"];
            }
            dr.Close();
            return l;
        }
        public static List<LongDistance> All()//全查
        {
            string sql = "select * from LongDistance";
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<LongDistance> list = new List<LongDistance>();
            while (dr.Read())
            {
                LongDistance l = new LongDistance();
                l.L_ID = (int)dr["L_ID"];
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.UserID = (int)dr["UserID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }

        public static List<LongDistance> SelectAllByCity(int id, string a, string b)//根据地区查询
        {
            string sql = string.Format("select * from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where b.PublishID ={0} and a.L_StartingPlace = '{1}' and a.L_Destination = '{2}' and a.L_Effective = '有效'", id, a, b);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<LongDistance> list = new List<LongDistance>();
            while (dr.Read())
            {
                LongDistance l = new LongDistance();
                l.L_ID = (int)dr["L_ID"];
                l.PublishName = dr["PublishName"].ToString();
                l.CarType = dr["CarType"].ToString();
                l.L_StartingPlace = dr["L_StartingPlace"].ToString();
                l.L_Destination = dr["L_Destination"].ToString();
                l.L_TimeRequired = dr["L_TimeRequired"].ToString();
                l.L_Number = (int)dr["L_Number"];
                l.L_Kilometers = Convert.ToDecimal(dr["L_Kilometers"]);
                l.L_Price = Convert.ToDecimal(dr["L_Price"]);
                l.L_Message = dr["L_Message"].ToString();
                l.PublishID = (int)dr["PublishID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }

    }
}
