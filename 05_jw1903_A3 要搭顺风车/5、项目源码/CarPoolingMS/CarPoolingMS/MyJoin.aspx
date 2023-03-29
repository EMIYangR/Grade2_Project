<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyJoin.aspx.cs" Inherits="CarPoolingMS.MyJoin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @keyframes hidePreloader {
            0% {
                width: 100%;
                height: 100%;
            }

            100% {
                width: 0;
                height: 0;
            }
        }

        body > div.preloader {
            position: fixed;
            background: white;
            width: 100%;
            height: 100%;
            z-index: 1071;
            opacity: 0;
            transition: opacity .5s ease;
            overflow: hidden;
            pointer-events: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        body:not(.loaded) > div.preloader {
            opacity: 1;
        }

        body:not(.loaded) {
            overflow: hidden;
        }

        body.loaded > div.preloader {
            animation: hidePreloader .5s linear .5s forwards;
        }

        table tr td {
            margin: 15px 0;
        }

            table tr td span {
                color: #f00;
            }

        #Button1 {
            margin-left: 25px;
        }

        .md {
            margin: 0px;
            color: #718096;
        }

        #d1 {
            margin: 0 12.5%;
        }

        #lbie a {
            margin-right: 30px;
        }

        #zt a {
            margin-right: 45px;
        }

        .dj:active {
            font-weight: bold;
            border: 1px solid #0061b3;
        }
    </style>
    <!-- Favicon -->
    <!--<link rel="icon" href="" type="image/png" />-->
    <!-- Page CSS -->
    <link rel="stylesheet" href="Content/select2.min.css" />
    <link rel="stylesheet" href="Content/flatpickr.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="Content/all.min.css" />
    <!-- Quick CSS -->
    <link rel="stylesheet" href="Content/quick-website.css" />
    <!-- Docs CSS - used only for demo -->
    <link rel="stylesheet" href="Content/docs.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="d1">
        <h2 id="h2">我的加入</h2>
        <p id="lbie">
            <span class="text-muted">类别：</span>
            <a href="MyJoin.aspx?le='有效'" class="font-weight-bold border border-primary">长途拼车</a>
            <a href="MyjoinS.aspx?le='有效'">短途拼车（上下班拼车）</a>
        </p>
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">起点</th>
                        <th scope="col">终点</th>
                        <th scope="col">人数</th>
                        <th scope="col">类型</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th>
                                    <%# i++ %>
                                </th>
                                <td>
                                    <%# Eval("L_StartingPlace") %>
                                </td>

                                <td>
                                    <%# Eval("L_Destination") %>
                                </td>
                                <td>
                                    <%# Eval("AddNumber") %>
                                </td>
                                <td>长途
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
