using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class FollowManager
    {
        public static List<Follow> JRA(int id)
        {
            return FollowService.JRA(id);
        }
            public static List<Follow> JRB(int id)
        {
            return FollowService.JRB(id);
        }
            public static bool Delete(int id)
        {
            return FollowService.Delete(id);
        }
        public static bool Add(Follow f)//添加
        {
            return FollowService.Add(f);
        }
        public static int SelectByNumber(int id)//加入的人数
        {
            return FollowService.SelectByNumber(id);
        }
        public static bool DeleteS(int id)
        {
            return FollowService.DeleteS(id);
        }
        public static bool AddS(Follow f)//添加
        {
            return FollowService.AddS(f);
        }
        public static int SelectBySNumber(int id)//加入的人数
        {
            return FollowService.SelectBySNumber(id);
        }
    }
}
