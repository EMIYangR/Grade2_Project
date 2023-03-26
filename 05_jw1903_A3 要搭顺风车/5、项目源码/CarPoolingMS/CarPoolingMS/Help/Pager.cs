using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarPoolingMS.Help
{
    [Serializable]
    public class Pager
    {
        public int PageIndex { get; set; }//页号
        public int PageSize { get; set; }//每页记录数
        public int PageCount { get; set; }//总页数

        private int count;//数据记录总数

        public int Count { get => count;
            set
            {
                this.PageCount = Convert.ToInt32(
                    Math.Ceiling(
                        double.Parse(value.ToString()) /
                        double.Parse(PageSize.ToString())
                        ));//计算总页数
                this.count = value;
            }
        }
        public Pager()
        {
            this.PageSize = 10;
            this.PageIndex = 1;
            this.Count = 0;
        }
        //是否为首页
        public bool IsFirst()
        {
            return this.PageIndex <= 1;
        }
        //是否为尾页
        public bool IsLast()
        {
            return this.PageIndex  >= this.PageCount;
        }
        //首页
        public void FirstPage()
        {
            this.PageIndex = 1;
        }
        //上一页
        public void PrevPage()
        {
            if (!this.IsFirst())
            {
                this.PageIndex--;
            }
            //if (this.IsFirst())
            //{
            //    this.PageIndex = 1;
            //}
            //else
            //{
            //    this.PageIndex--;
            //}
        }
        //下一页
        public void NextPage()
        {
            if (!this.IsLast())
            {
                this.PageIndex++;
            }

            //if (this.IsLast())
            //{
            //    this.PageIndex = this.PageCount;
            //}
            //else
            //{
            //    this.PageIndex++;
            //}
        }
        //指定页
        public void ToPage(int i)
        {
            if (i>=1 && i<=PageCount)
            {
                PageIndex = i;
            }
        }
        //尾页
        public void LastPage()
        {
            this.PageIndex = this.PageCount;
        }

    }
    
}