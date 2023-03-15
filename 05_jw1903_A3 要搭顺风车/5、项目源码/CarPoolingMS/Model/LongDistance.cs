using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class LongDistance
    {
        int l_ID;
        string l_StartingPlace;
        string l_Destination;
        string l_TimeRequired;
        int l_Number;
        decimal l_Kilometers;
        decimal l_Price;
        string l_Message;
        int publishID;
        int userID;

        public int L_ID { get => l_ID; set => l_ID = value; }
        public string L_StartingPlace { get => l_StartingPlace; set => l_StartingPlace = value; }
        public string L_Destination { get => l_Destination; set => l_Destination = value; }
        public string L_TimeRequired { get => l_TimeRequired; set => l_TimeRequired = value; }
        public int L_Number { get => l_Number; set => l_Number = value; }
        public decimal L_Kilometers { get => l_Kilometers; set => l_Kilometers = value; }
        public decimal L_Price { get => l_Price; set => l_Price = value; }
        public string L_Message { get => l_Message; set => l_Message = value; }
        public int PublishID { get => publishID; set => publishID = value; }
        public int UserID { get => userID; set => userID = value; }
    }
}
