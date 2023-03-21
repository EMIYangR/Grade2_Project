using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Follow
    {
        int followID;
        int l_ID;
        int s_ID;
        int userID;
        int addNumber;

        public int FollowID { get => followID; set => followID = value; }
        public int L_ID { get => l_ID; set => l_ID = value; }
        public int S_ID { get => s_ID; set => s_ID = value; }
        public int UserID { get => userID; set => userID = value; }
        public int AddNumber { get => addNumber; set => addNumber = value; }
    }
}
