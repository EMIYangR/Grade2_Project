using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace CarPoolingMS.Help
{
    public class EmailCode
    {
        private static string GetCode()//验证码生成
        {
            string code = "";
            string num1 = (new Random().Next(500, 1000)).ToString();
            string num2 = (new Random().Next(100, 500)).ToString();
            code = num1 + num2;
            HttpContext.Current.Session["emailcode"] = code; //r写入session
            return num1 + num2; //6位数=3位数+3位数
        }


        public static void Send(string toEmail)//发送邮箱验证码
        {
            MailMessage m = new MailMessage();
            m.From = new MailAddress("10001@qq.com", "要搭顺风车");//发送地址、显示抬头
            m.To.Add(toEmail);//目标邮箱
            m.Subject = "要搭顺风车_验证码";//标题/ /邮件内容
            m.Body = "感谢您注册要搭顺风车,您的验证码为:" + GetCode() + "\r\n请勿转告他人,感谢您的使用";
            m.SubjectEncoding = System.Text.Encoding.UTF8;
            m.BodyEncoding = System.Text.Encoding.UTF8;
            SmtpClient s = new SmtpClient();
            //创建发送对象
            s.Credentials = new NetworkCredential("10001@qq.com", "gadvgfychvgasvghsa");//邮箱授权码
            s.Host = "smtp.qq.com"; //服务器地址
            s.Send(m);//发送
        }
    }
}
