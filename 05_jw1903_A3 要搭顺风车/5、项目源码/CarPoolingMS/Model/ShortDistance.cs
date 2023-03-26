using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class ShortDistance
    {
        int s_ID;
        string s_StartingPlace;
        string s_Approach;
        string s_Destination;
        string s_TimeRequired;
        int s_Number;
        decimal s_Kilometers;
        decimal s_Price;
        string s_Message;
        int publishID;
        int userID;
        string s_Effective;

        string carType;
        string userPhone;
        string carID;
        int addNumber;
        string publishName;

        public int S_ID { get => s_ID; set => s_ID = value; }
        public string S_StartingPlace { get => s_StartingPlace; set => s_StartingPlace = value; }
        public string S_Approach { get => s_Approach; set => s_Approach = value; }
        public string S_Destination { get => s_Destination; set => s_Destination = value; }
        public string S_TimeRequired { get => s_TimeRequired; set => s_TimeRequired = value; }
        public int S_Number { get => s_Number; set => s_Number = value; }
        public decimal S_Kilometers { get => s_Kilometers; set => s_Kilometers = value; }
        public decimal S_Price { get => s_Price; set => s_Price = value; }
        public string S_Message { get => s_Message; set => s_Message = value; }
        public int PublishID { get => publishID; set => publishID = value; }
        public int UserID { get => userID; set => userID = value; }
        public string CarType { get => carType; set => carType = value; }
        public string UserPhone { get => userPhone; set => userPhone = value; }
        public string CarID { get => carID; set => carID = value; }
        public int AddNumber { get => addNumber; set => addNumber = value; }
        public string PublishName { get => publishName; set => publishName = value; }
        public string S_Effective { get => s_Effective; set => s_Effective = value; }
    }
}
