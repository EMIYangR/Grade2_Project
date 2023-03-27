using Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class FollowService
    {
        public static bool Delete(int id)
        {
            string sql = "delete from Follow where L_ID=" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool Add(Follow f)//添加
        {
            string sql = string.Format("insert Follow values({0},null,{1},{2})", f.L_ID, f.UserID, f.AddNumber);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static int SelectByNumber(int id)//加入的人数
        {
            string sql = string.Format("select sum(AddNumber) a from Follow group by L_ID having L_ID>0 and L_ID={0}", id);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            int number = 0;
            while (dr.Read())
            {
                number = (int)dr["a"];
            }
            dr.Close();
            return number;
        }
        public static bool DeleteS(int id)
        {
            string sql = "delete from Follow where S_ID=" + id;
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static bool AddS(Follow f)//添加
        {
            string sql = string.Format("insert Follow values(null,{0},{1},{2})", f.S_ID, f.UserID, f.AddNumber);
            return DBHelperSQL.ExecuteNonQuery(sql);
        }
        public static int SelectBySNumber(int id)//加入的人数
        {
            string sql = string.Format("select sum(AddNumber) a from Follow group by S_ID having S_ID>0 and S_ID={0}", id);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            int number = 0;
            while (dr.Read())
            {
                number = (int)dr["a"];
            }
            dr.Close();
            return number;
        }
    }
}
