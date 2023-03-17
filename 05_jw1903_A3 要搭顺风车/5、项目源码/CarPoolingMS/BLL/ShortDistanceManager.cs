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
        public static List<ShortDistance> SelectAllLineByName(string a,string b)
        {
            return ShortDistanceService.SelectLine(a,b);
        }
    }
}
