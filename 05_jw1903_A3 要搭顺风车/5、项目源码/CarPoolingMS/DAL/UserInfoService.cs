using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserInfoService
    {
        public static string SelectByCarID(int id)//根据userid查询车牌号
        {
            string sql = "select CarID from UserInfo where UserID=" + id;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            string CarID = "";
            while (dr.Read())
            {
                CarID = dr["CarID"].ToString();
            }
            dr.Close();
            return CarID;
        }
        public static int UserInfoByuserid(string user, string pwd)//登录获取userid
        {
            string sql = string.Format("select UserID from UserInfo where UserAccount='{0}' and UserPwd='{1}'", user, pwd);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            int userid = 0;
            while (dr.Read())
            {
                userid = (int)dr["UserID"];
            }
            dr.Close();
            return userid;
        }
        public static string UserInfoByuserpwd(string user, string pwd)//登录
        {
            string sql = string.Format("select * from UserInfo where UserAccount='{0}' and UserPwd='{1}'", user, pwd);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            string p = "";
            if (dr.HasRows)
            {
                p = null;
            }
            dr.Close();
            return p;
        }
        public static string UserInfoByemail(string email)//邮箱登录
        {
            string sql = string.Format("select * from UserInfo where Email='{0}'", email);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            string p = "";
            if (dr.HasRows)
            {
                p = null;
            }
            dr.Close();
            return p;
        }
        public static bool Add(UserInfo u)//注册
        {
            string sql = string.Format("insert UserInfo values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')"
                , u.UserName, u.UserAccount, u.UserPwd, u.UserPhone, u.Email, u.CarType, u.CarID);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool xg(string email, string pwd)//修改
        {
            string sql = string.Format("update userinfo set userpwd='{0}' where email='{1}'", pwd, email);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool XgByType(string type, string carid, int id)//修改车牌号和车类型
        {
            string sql = string.Format("update userinfo set CarType='{0}',CarID='{1}' where UserID={2}", type, carid, id);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
    }
}
