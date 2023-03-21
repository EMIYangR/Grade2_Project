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
        public static List<LongDistance> SelectAllByCity(string a, string b)//城市
        {
            return LongDistanceService.SelectAllByCity(a, b);
        }
    }
}
