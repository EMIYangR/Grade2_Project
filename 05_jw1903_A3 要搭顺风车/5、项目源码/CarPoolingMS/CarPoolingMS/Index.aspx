<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CarPoolingMS.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #bg {
            max-width: 1600px;
            height: 900px;
            background-image: url("Content/image/bg.jpg");
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="bg">
        <h2>欢迎使用搭个顺风车！</h2>
    </div>
</asp:Content>
