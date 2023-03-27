using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class LongDistanceManager
    {
        public static int SelectByL_IDUserID(int L_ID)//根据L_ID查userid
        {
            return LongDistanceService.SelectByL_IDUserID(L_ID);
        }
        public static bool ByL_IDNumber(int number, int L_ID)//根据L_ID修改人数
        {
            return LongDistanceService.ByL_IDNumber(number, L_ID);
        }
        public static LongDistance SelectAByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询查询具体数据让人数
        {
            return LongDistanceService.SelectAByLsLdTime(a, b, c, d);
        }
        public static string SelectByLsLdTime(string a, string b, string c, int d)//根据终点、起点、时间查询
        {
            return LongDistanceService.SelectByLsLdTime(a, b, c, d);
        }
        public static bool Delete(int id)//删除
        {
            return LongDistanceService.Delete(id);
        }
        public static int SelectByUserID(int id)//根据L_ID查询UserID
        {
            return LongDistanceService.SelectByUserID(id);
        }
        public static bool XgEffectiveCk(int id)//乘客修改有效无效
        {
            return LongDistanceService.XgEffectiveCk(id);
        }
        public static bool XgEffective(int id)//修改有效无效
        {
            return LongDistanceService.XgEffective(id);
        }
        public static int SelectByL_ID(int id)//总人数
        {
            return LongDistanceService.SelectByL_ID(id);
        }
        public static List<LongDistance> SelectByNumber(int id)//司机根基Publishid的总数据条数
        {
            return LongDistanceService.SelectByNumber(id);
        }
        public static List<LongDistance> SelectByPublishIDPage(int count, int pageIndex, int id)//根基Publishid查询分页查询
        {
            return LongDistanceService.SelectByPublishIDPage(count, pageIndex, id);
        }
        public static bool Add(LongDistance l)//添加
        {
            return LongDistanceService.Add(l);
        }
        public static List<LongDistance> SelectByPublishID(int id)//根基PublishID查询
        {
            return LongDistanceService.SelectByPublishID(id);
        }
        public static LongDistance SelectByID(int id)//根据id
        {
            return LongDistanceService.SelectByID(id);
        }
        public static LongDistance SelectByAddNumber(int id)//根据id
        {
            return LongDistanceService.SelectByAddNumber(id);
        }
        public static List<LongDistance> LongDistancesAll()//全查
        {
            return LongDistanceService.All();
        }
        public static List<LongDistance> lianbiao()//连表查
        {
            return LongDistanceService.lianbiao();
        }
        public static List<LongDistance> SelectAllByCity(int id, string a, string b)//城市
        {
            return LongDistanceService.SelectAllByCity(id, a, b);
        }
        public static List<LongDistance> SelectByL_Effective(int userid, string Le)//根据有效无效查询历史订单
        {
            return LongDistanceService.SelectByL_Effective(userid, Le);
        }
    }
}
