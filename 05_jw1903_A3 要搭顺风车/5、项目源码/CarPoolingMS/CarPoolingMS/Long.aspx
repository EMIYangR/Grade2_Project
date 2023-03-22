<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Long.aspx.cs" Inherits="CarPoolingMS.Long" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #form1 #long #long1 {
            display: flex;
            flex-wrap: wrap;
            /*border:1px solid red;*/
            height: 180px;
        }

            #form1 #long #long1:hover {
                background-color: #fffcea;
            }

        #form1 #long #long2 {
            margin-left: 50px;
        }

            #form1 #long #long2 p {
                margin-top: 30px;
            }

        #form1 #long #long3 {
            height: 150px;
            line-height: 180px;
            margin-left: 45%;
        }

        #form1 #long #long1 img {
            width: 250px;
            height: 150px;
        }

        #form1 #long #long1 #long4 {
            margin-left: 30px;
            margin-top: 15px;
        }

        #search {
            text-align: center;
        }

        #long {
            margin-left: 10%;
            margin-right: 10%;
        }

        .rebtn {
            font-size: 1rem;
            line-height: 1.5;
            display: inline-block;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            text-align: center;
            vertical-align: middle;
            color: #718096;
            border: 1px solid transparent;
            border-radius: .375rem;
            background-color: transparent;
        }

        .lbbtn:active {
            border: 1px solid;
        }

        #leibie {
            margin-left: 12%;
            font-weight: bold;
            padding-right: 1.75rem;
        }

        .lbbtn {
            padding: .75rem 1.75rem;
        }

        .sbtn {
            padding: .25rem 1.75rem;
        }
    </style>

    <link rel="stylesheet" href="Content/all.min.css" />
    <!-- Quick CSS -->
    <link rel="stylesheet" href="Content/quick-website.css" id="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p id="search">
        出发城市：
        <asp:TextBox ID="TextBox1" class="" runat="server"></asp:TextBox>
        目的城市：
        <asp:TextBox ID="TextBox2" class="" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" class="rebtn sbtn btn-youtube" runat="server" Text="搜索" OnClick="Button1_Click" />
    </p>
    <p id="lbie">
        <span class="text-muted">类别：</span>
        <asp:Button ID="Button2" class="rebtn lbbtn" runat="server" Text="全部" />
        <asp:Button ID="Button3" class="rebtn lbbtn" runat="server" Text="长途拼车" />
        <asp:Button ID="Button4" class="rebtn lbbtn" runat="server" Text="短途拼车（上下班拼车）" />
    </p>
    <p id="leibie">
        <span class="text-muted">供需：</span>
        <asp:Button ID="Button5" class="rebtn lbbtn" runat="server" Text="乘客" OnClick="Button5_Click" />
        <asp:Button ID="Button6" class="rebtn lbbtn" runat="server" Text="司机" OnClick="Button6_Click" />
    </p>
    <div id="long">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div id="long1">
                    <div id="long4">
                        <img src="Content/image/car.png" />
                    </div>
                    <div id="long2">
                        <p>
                            <%# Eval("L_Message") %>
                        </p>
                        <p>
                            类型：长途
                        </p>
                        <p>
                            <%# Eval("L_StartingPlace") %>-
                                <%# Eval("L_Destination")  %>
                        </p>
                    </div>
                    <div id="long3">
                        <a href="Details.aspx?id=<%# Eval("L_ID") %>">查看详情</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

