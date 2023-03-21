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
        public static string UserInfoByuserpwd(string user, string pwd)//登录
        {
            string sql = string.Format("select * from UserInfo where UserAccount='{0}' and UserPwd='{1}'", user, pwd);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            string p = "";
            if (!dr.HasRows)
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
            if (!dr.HasRows)
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
    }
}
