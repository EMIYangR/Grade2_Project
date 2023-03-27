<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="CarPoolingMS.Modify" %>

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
    <div id="fabumsg">
        <%--<nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Library</a></li>
                <li class="breadcrumb-item active" aria-current="page">Data</li>
            </ol>
        </nav>--%>

        <h2 id="h2">修改信息</h2>
        <table>
            <tr>
                <td class="text-right">
                    类型：
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                </td> 
            </tr>
            <tr>
                <td class="text-right">
                    出发地：
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    到达地：
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <asp:Label ID="Label10" runat="server" Text="途径地："></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    出发时间：
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    人数：
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    路程(KM)：
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    车牌号：
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    车型：
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    电话：
                </td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p class="btn">
                        <asp:Button ID="Button1" class="form-control btn btn-primary" runat="server" Text="确认修改" Width="150px" OnClick="Button1_Click" />
                    </p>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
