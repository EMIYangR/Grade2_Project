using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;

namespace DAL
{
    public class CommentService
    {
        public static List<Comment> SelectAll(int id)
        {
            string sql = "select CommentID,UserName,Star,CommentContent,CommentTime from Comment a " +
            "join UserInfo b on a.UserID = b.UserID where sjuserid ="+id;
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<Comment> list = new List<Comment>();
            while (dr.Read())
            {
                Comment c = new Comment();
                c.CommentID = (int)dr["CommentID"];
                c.UserName = dr["UserName"].ToString();
                //c.SjUserID = (int)dr["SjUserID"];
                //c.UserID= (int)dr["UserID"];
                c.CommentContent = dr["CommentContent"].ToString();
                c.CommentTime = dr["CommentTime"].ToString();
                c.Star = (int)dr["Star"];
                list.Add(c);
            }
            dr.Close();
            return list;
        }
        public static List<Comment> SelectBySjUserID(int count,int PageIndex,int UserID)//根据userID查找评论
        {
            string sql;
            if (PageIndex > 0)
            {
                sql = string.Format("select top {0} CommentID,UserName,Star,CommentContent,CommentTime from Comment a " +
                "join UserInfo b on a.UserID = b.UserID where sjuserid = {1} and CommentID not in " +
                "(select top {2} CommentID from Comment a " +
                "join UserInfo b on a.UserID = b.UserID where sjuserid = {1})", count, UserID, (PageIndex - 1) * 10);
            }
            else
            {
                sql = string.Format("select top {0} CommentID,UserName,Star,CommentContent,CommentTime from Comment a " +
                "join UserInfo b on a.UserID = b.UserID where sjuserid = {1} and CommentID not in " +
                "(select top {2} CommentID from Comment a " +
                "join UserInfo b on a.UserID = b.UserID where sjuserid = {1})", count, UserID, PageIndex);
            }
            
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<Comment> list = new List<Comment>();
            while (dr.Read())
            {
                Comment c = new Comment();
                c.CommentID = (int)dr["CommentID"];
                c.UserName = dr["UserName"].ToString();
                //c.SjUserID = (int)dr["SjUserID"];
                //c.UserID= (int)dr["UserID"];
                c.CommentContent = dr["CommentContent"].ToString();
                c.CommentTime = dr["CommentTime"].ToString();
                c.Star= (int)dr["Star"];
                list.Add(c);
            }
            dr.Close();
            return list;
        }
        public static bool Add(Comment c)//添加
        {
            string sql =string.Format( "insert Comment values({0},{1},'{2}',GETDATE(),{3})",
                c.SjUserID,c.UserID,c.CommentContent,c.Star);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
    }
}
