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
        public static List<LongDistance> lianbiao()//连表查询
        {
            string sql = "select a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers,a.L_Message,a.L_Price from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID";
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
                //l.UserID = (int)dr["UserID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static List<LongDistance> SelectByPublishID(int id)//根基Publishid查询
        {
            string sql = "select c.UserPhone,c.CarID,a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers,a.L_Message,a.L_Price from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID=a.UserID where b.PublishID=" + id;

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

                //l.UserID = (int)dr["UserID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
        public static LongDistance SelectByID(int id)//根据id查
        {
            string sql = "select a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers," +
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
                //l.UserID = (int)dr["UserID"];
                l.CarID = dr["CarID"].ToString();
                l.UserPhone = dr["UserPhone"].ToString();
                //l.AddNumber =(int)dr["AddNumber"];
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
                //l.UserID = (int)dr["UserID"];
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
                //l.PublishID =(int) dr["PublishID"];
                l.UserID = (int)dr["UserID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }

        public static List<LongDistance> SelectAllByCity(string a, string b)//根据地区查询
        {
            string sql = string.Format("select a.L_ID,b.PublishName,c.CarType,a.L_StartingPlace,a.L_Destination,a.L_TimeRequired,a.L_Number,a.L_Kilometers,a.L_Message,a.L_Price from LongDistance a join Publish b on a.PublishID = b.PublishID join UserInfo c on c.UserID = a.UserID where a.L_StartingPlace = '{0}' and a.L_Destination = '{1}'", a, b);
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
                //l.UserID = (int)dr["UserID"];
                list.Add(l);
            }
            dr.Close();
            return list;
        }
    }
}
