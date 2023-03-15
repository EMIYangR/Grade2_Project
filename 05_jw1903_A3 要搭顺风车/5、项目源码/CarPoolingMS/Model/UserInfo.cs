using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UserInfo
    {
        int userID;
        string userName;
        string userAccount;
        string userPwd;
        string userPhone;
        string email;
        string carType;
        string carID;

        public int UserID { get => userID; set => userID = value; }
        public string UserName { get => userName; set => userName = value; }
        public string UserAccount { get => userAccount; set => userAccount = value; }
        public string UserPwd { get => userPwd; set => userPwd = value; }
        public string UserPhone { get => userPhone; set => userPhone = value; }
        public string Email { get => email; set => email = value; }
        public string CarType { get => carType; set => carType = value; }
        public string CarID { get => carID; set => carID = value; }
    }
}
