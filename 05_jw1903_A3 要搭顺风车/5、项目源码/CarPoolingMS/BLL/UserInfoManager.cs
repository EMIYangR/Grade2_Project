using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UserInfoManager
    {
        public static bool XgByType(string type, string carid, int id)//修改车牌号和车类型
        {
            return UserInfoService.XgByType(type, carid, id);
        }
        public static string SelectByCarID(int id)//根据userid查询车牌号
        {
            return UserInfoService.SelectByCarID(id);
        }
        public static int UserInfoByuserid(string user, string pwd)//登录获取userid
        {
            return UserInfoService.UserInfoByuserid(user, pwd);
        }
        public static string UserInfoByuserpwd(string user, string pwd)//登录
        {
            return UserInfoService.UserInfoByuserpwd(user, pwd);
        }
        public static string UserInfoByemail(string email)//邮箱登录
        {
            return UserInfoService.UserInfoByemail(email);
        }
        public static bool Add(UserInfo u)
        {
            return DAL.UserInfoService.Add(u);
        }
        public static bool xg(string email, string pwd)
        {
            return DAL.UserInfoService.xg(pwd, email);
        }
    }

}
