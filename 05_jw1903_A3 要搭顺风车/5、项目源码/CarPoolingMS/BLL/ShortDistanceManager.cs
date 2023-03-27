using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ShortDistanceManager
    {
        public static List<ShortDistance> SelectAllLine()
        {
            return ShortDistanceService.SelectAll();
        }
        public static List<ShortDistance> SelectAllLineByName(string a, string b)
        {
            return ShortDistanceService.SelectLine(a, b);
        }

        public static int SelectByS_IDUserID(int S_ID)//根据S_ID查userid
        {
            return ShortDistanceService.SelectByS_IDUserID(S_ID);
        }
        public static bool ByS_IDNumber(int number, int S_ID)//根据S_ID修改人数
        {
            return ShortDistanceService.ByS_IDNumber(number, S_ID);
        }
        public static ShortDistance SelectAByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询查询具体数据让人数
        {
            return ShortDistanceService.SelectAByLsLdTime(a, b, c, d);
        }
        public static string SelectByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询
        {
            return ShortDistanceService.SelectByLsLdTime(a, b, c, d);
        }
        public static bool Delete(int id)//删除
        {
            return ShortDistanceService.Delete(id);
        }
        public static int SelectByUserID(int id)//根据S_ID查询UserID
        {
            return ShortDistanceService.SelectByUserID(id);
        }
        public static bool XgEffectiveCk(int id)//乘客修改有效无效
        {
            return ShortDistanceService.XgEffectiveCk(id);
        }
        public static bool XgEffective(int id)//修改有效无效
        {
            return ShortDistanceService.XgEffective(id);
        }
        public static int SelectByS_ID(int id)//总人数
        {
            return ShortDistanceService.SelectByS_ID(id);
        }
        public static List<ShortDistance> SelectByNumber(int id)//司机根基Publishid的总数据条数
        {
            return ShortDistanceService.SelectByNumber(id);
        }
        public static List<ShortDistance> SelectByPublishIDPage(int count, int pageIndex, int id)//根基Publishid查询分页查询
        {
            return ShortDistanceService.SelectByPublishIDPage(count, pageIndex, id);
        }
        public static bool Add(ShortDistance l)//添加
        {
            return ShortDistanceService.Add(l);
        }
        public static List<ShortDistance> SelectByPublishID(int id)//根基PublishID查询
        {
            return ShortDistanceService.SelectByPublishID(id);
        }
        public static ShortDistance SelectByID(int id)//根据id
        {
            return ShortDistanceService.SelectByID(id);
        }
        public static ShortDistance SelectByAddNumber(int id)//根据id
        {
            return ShortDistanceService.SelectByAddNumber(id);
        }
        public static List<ShortDistance> ShortDistancesAll()//全查
        {
            return ShortDistanceService.All();
        }
        public static List<ShortDistance> lianbiao()//连表查
        {
            return ShortDistanceService.lianbiao();
        }
        public static List<ShortDistance> SelectAllByCity(int id, string a, string b)//城市
        {
            return ShortDistanceService.SelectAllByCity(id, a, b);
        }
        public static List<ShortDistance> SelectByS_Effective(int userid, string Le)//根据有效无效查询历史订单
        {
            return ShortDistanceService.SelectByS_Effective(userid, Le);
        }
    }
}
