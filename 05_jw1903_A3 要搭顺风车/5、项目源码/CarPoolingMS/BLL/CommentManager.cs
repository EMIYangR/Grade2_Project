using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DAL;

namespace BLL
{
    public class CommentManager
    {
        public static List<Comment> SelectAll(int id)
        {
            return CommentService.SelectAll(id);
        }
            public static List<Comment> SelectBySjUserID(int count, int PageIndex, int UserID)//根据userID查找评论
        {
            return CommentService.SelectBySjUserID(count,UserID,PageIndex);
        }
        public static bool Add(Comment c)//添加
        {
            return CommentService.Add(c);
        }
    }
}
