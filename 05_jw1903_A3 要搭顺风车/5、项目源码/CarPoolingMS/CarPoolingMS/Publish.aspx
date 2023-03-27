<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Publish.aspx.cs" Inherits="CarPoolingMS.Publish" %>

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

    <div id="fabumsg">
        <%--<nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Index.aspx">首页</a></li>
                <li class="breadcrumb-item active" aria-current="page">发布</li>
            </ol>
        </nav>--%>
        <h2 id="h2">发布信息</h2>
        <table>
            <tr>
                <td class="text-right">
                    <span>*</span>拼车人：
                </td>
                <td>
                    <div class="custom-control custom-radio custom-control-inline">
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="我是司机" GroupName="people" class="radio md" />
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="我是乘客" GroupName="people" class="radio md" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>类型：
                </td>
                <td>
                    <div class="custom-control custom-radio custom-control-inline">
                        <asp:RadioButton ID="RadioButton3" runat="server" Text="长途拼车" GroupName="type" class="radio md" />
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <asp:RadioButton ID="RadioButton4" runat="server" Text="短途拼车（上下班拼车）" GroupName="type" Checked="true" class="radio md" OnCheckedChanged="RadioButton4_CheckedChanged" />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>出发地：
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="" runat="server" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>到达地：
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="" runat="server" required></asp:TextBox>
                </td>
            </tr>
            <%if (name == "短途拼车（上下班拼车）")
                { %>
            <tr id="yc">
                <td class="text-right">
                    <span></span>途径地：
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" class="form-control" placeholder="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <%} %>
            <tr>
                <td class="text-right">
                    <span>*</span>出发时间：
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" class="form-control" runat="server" Width="400px"></asp:TextBox>
                    <asp:Button ID="Button0" runat="server" OnClick="Button0_Click" Text="" Style="display: none" />
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="false" CssClass="auto-style8" Width="407px">
                        <DayStyle CssClass="td_center" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>人数：
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" class="form-control" placeholder="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>路程(KM)：
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" class="form-control" placeholder="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>价格(&yen;)：
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" class="form-control" placeholder="" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <span>*</span>简介：
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" class="form-control" placeholder="" runat="server" Rows="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p class="btn">
                        <asp:Button ID="Button1" class="form-control btn btn-primary" runat="server" Text="确认并发布" Width="150px" OnClick="Button1_Click" />
                    </p>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
