<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CarPoolingMS.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #bg {
            max-width: 1600px;
            height: 900px;
            background-image: url("Content/image/bg.jpg");
        }

        h1 {
            margin-left: 15%;
            padding-top: 250px;
        }

        p {
            font-weight: bold;
            margin-left: 15%;
            font-size: large;
            color: #fff;
        }

        span {
            color: #f00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="bg">
        <h1>欢迎使用<span>要搭顺风车</span>！

        </h1>
        <p>
            要搭顺风车网站是督导组开发的一款能够让挤
            公交车地铁的上班一族能够舒适出行，省时省力
            省钱的网站，还能减轻公共交通压力和节能环保。
        </p>
    </div>
</asp:Content>
