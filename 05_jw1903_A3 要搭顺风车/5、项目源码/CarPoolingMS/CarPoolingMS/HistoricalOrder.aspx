<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HistoricalOrder.aspx.cs" Inherits="CarPoolingMS.HistoricalOrder" %>

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

        #fabumsg {
            margin: 0 12.5%;
        }

        #h2 {
            margin-bottom: 50px;
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
    </style>
    <script>
        window.addEventListener("load", function () {
            setTimeout(function () {
                document.querySelector('body').classList.add('loaded');
            }, 300);
        });
    </script>
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
    <div>
        <a href="HistoricalOrder.aspx">长途</a>
        <a href="ShortHistoricalOrder.aspx">短途</a>
    </div>
    <div>
        <a href="HistoricalOrder.aspx?le='有效'">进行中</a>
        <a href="HistoricalOrder.aspx?le='无效'">已完成</a>
    </div>
    <div>
        <table border="1">
            <tr>
                <th>终点</th>
                <th>起点</th>
                <th>类型</th>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>
                            <%# Eval("L_StartingPlace") %>
                        </td>
                        <td>
                            <%# Eval("L_Destination") %>
                        </td>
                        <td>长途
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
