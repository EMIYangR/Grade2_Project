<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Short.aspx.cs" Inherits="CarPoolingMS.Short" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #form1 #long #long1 {
            /*display: flex;*/
            /*flex-wrap: wrap;*/
            /*border:1px solid red;*/
            height: 180px;
        }

            #form1 #long #long1:hover {
                background-color: #fffcea;
            }

        #form1 #long #long2 {
            /*margin-left: 50px;*/
        }

            #form1 #long #long2 p {
                margin-top: 30px;
            }

        #form1 #long #long3 {
            height: 150px;
            line-height: 180px;
            /*margin-left: 45%;*/
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
            margin-top: 10px;
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

        #leibie, #lbie {
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

        #lbie a {
            margin-right: 30px;
        }

        #leibie a {
            margin-right: 60px;
        }
    </style>
    <link rel="stylesheet" href="Content/all.min.css" />
    <!-- Quick CSS -->
    <link rel="stylesheet" href="Content/quick-website.css" id="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p id="search">
        出发城市：
        <asp:TextBox ID="TextBox1" class="form-control form-control-emphasized text-center" Width="250px" Height="40px" runat="server"></asp:TextBox>
        目的城市：
        <asp:TextBox ID="TextBox2" class="form-control form-control-emphasized text-center" Width="250px" Height="40px" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" class="rebtn sbtn btn-youtube" runat="server" Text="搜索" />
    </p>
    <p id="lbie">
        <span class="text-muted">类别：</span>
        <a href="Long.aspx?id=1">长途拼车</a>
        <a href="Short.aspx?id=1" class="font-weight-bold border border-primary">短途拼车（上下班拼车）</a>
    </p>
    <p id="leibie">
        <span class="text-muted">供需：</span>
        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <a href="?id=<%# Eval("PublishID") %>"><%# Eval("PublishName") %></a>
            </ItemTemplate>
        </asp:Repeater>
    </p>
    <div id="long">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div id="long1" class="row">
                    <div id="long4" class="col-md-3">
                        <img src="Content/image/car.jpg" />
                    </div>
                    <div id="long2" class="col-md-6">
                        <p>
                            <%# Eval("S_Message") %>
                        </p>
                        <p>
                            类型：短途
                        </p>
                        <p>
                            <%# Eval("S_StartingPlace") %>
                            -
                            <%# Eval("S_Approach") %>
                            -
                            <%# Eval("S_Destination") %>
                        </p>
                    </div>
                    <div id="long3" class="col-md-2">
                        <a href="ShortDetails.aspx?id=<%# Eval("S_ID") %>">查看详情</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div>
        <p class="text-center">
            <asp:Button ID="Button7" runat="server" Text="首页" OnClick="Button7_Click" class="btn" />
            <asp:Button ID="Button8" runat="server" Text="上一页" OnClick="Button8_Click" class="btn" />
            <asp:TextBox ID="TextBox3" runat="server" class="form-control form-control-emphasized text-center" Width="125px" Height="20px"></asp:TextBox>
            <asp:Button ID="Button9" runat="server" Text="跳转" OnClick="Button9_Click" class="btn" />
            <asp:Button ID="Button10" runat="server" Text="下一页" OnClick="Button10_Click" class="btn" />
            <asp:Button ID="Button11" runat="server" Text="尾页" OnClick="Button11_Click" class="btn" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
    </div>
</asp:Content>
