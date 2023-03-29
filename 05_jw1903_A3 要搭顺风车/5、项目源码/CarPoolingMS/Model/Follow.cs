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
        string l_StartingPlace;
        string l_Destination;
        string s_StartingPlace;
        string s_Approach;
        string s_Destination;
        public int FollowID { get => followID; set => followID = value; }
        public int L_ID { get => l_ID; set => l_ID = value; }
        public int S_ID { get => s_ID; set => s_ID = value; }
        public int UserID { get => userID; set => userID = value; }
        public int AddNumber { get => addNumber; set => addNumber = value; }
        public string L_StartingPlace { get => l_StartingPlace; set => l_StartingPlace = value; }
        public string L_Destination { get => l_Destination; set => l_Destination = value; }
        public string S_StartingPlace { get => s_StartingPlace; set => s_StartingPlace = value; }
        public string S_Approach { get => s_Approach; set => s_Approach = value; }
        public string S_Destination { get => s_Destination; set => s_Destination = value; }
    }
}
