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
        public static string UserInfoByuserpwd(string user, string pwd)//登录
        {
            return UserInfoService.UserInfoByuserpwd(user, pwd);
        }
        public static string UserInfoByemail(string email)//登录
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
