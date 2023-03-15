using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Publish
    {
        int publishID;
        string publishName;

        public int PublishID { get => publishID; set => publishID = value; }
        public string PublishName { get => publishName; set => publishName = value; }
    }
}
