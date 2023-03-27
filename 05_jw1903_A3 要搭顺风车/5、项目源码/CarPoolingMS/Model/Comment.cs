using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Comment
    {
        int commentID;
        int userID;
        int sjUserID;
        string commentContent;
        string commentTime;
        int star;
        string userName;

        public int CommentID { get => commentID; set => commentID = value; }
        public int UserID { get => userID; set => userID = value; }
        public string CommentContent { get => commentContent; set => commentContent = value; }
        public string CommentTime { get => commentTime; set => commentTime = value; }
        public int Star { get => star; set => star = value; }
        public int SjUserID { get => sjUserID; set => sjUserID = value; }
        public string UserName { get => userName; set => userName = value; }
    }
}
