using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PublishManager
    {
        public static List<Publish> SelectAll()
        {
            return PublishService.SelectAll();//全查
        }
    }
}
