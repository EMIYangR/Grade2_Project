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
        public static List<Follow> JRA(int id)
        {
            string sql = string.Format("select b.L_StartingPlace,b.L_Destination,a.AddNumber from Follow a join LongDistance b on a.L_ID=b.L_ID where a.UserID={0} and a.L_ID>0",id);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<Follow> list = new List<Follow>();
            while (dr.Read())
            {
                Follow f = new Follow();
                f.L_StartingPlace = dr["L_StartingPlace"].ToString();
                f.L_Destination = dr["L_Destination"].ToString();
                f.AddNumber = (int)dr["AddNumber"];

                list.Add(f);
            }
            dr.Close();
            return list;
        }

        public static List<Follow> JRB(int id)
        {
            string sql = string.Format(" select b.S_StartingPlace,b.S_Destination,b.S_Approach,a.AddNumber from Follow a join ShortDistance b on a.S_ID=b.S_ID  where a.UserID={0} and a.S_ID>0", id);
            SqlDataReader dr = DBHelperSQL.GetDataReader(sql);
            List<Follow> list = new List<Follow>();
            while (dr.Read())
            {
                Follow f = new Follow();
                f.S_StartingPlace = dr["S_StartingPlace"].ToString();
                f.S_Approach = dr["S_Approach"].ToString();
                f.S_Destination = dr["S_Destination"].ToString();
                f.AddNumber = (int)dr["AddNumber"];

                list.Add(f);
            }
            dr.Close();
            return list;
        }
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
