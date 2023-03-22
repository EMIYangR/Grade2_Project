<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="CarPoolingMS.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #form1 #ld {
            display: flex;
        }

        #form1 #yellow {
            background-color: #fffcea;
        }

        #title, #ld, #yellow, #fd {
            margin-left: 10%;
            margin-right: 10%;
        }

        #msg {
            margin-left: 2.5%;
        }

        #carType {
            margin-left: 30%;
        }

        #yellow {
            padding: 25px;
            margin-bottom: 20px;
        }

        #NumCount {
            width: 100px;
            margin-left: 75%;
        }

        #num {
            width: 91px;
        }

        #NumCount a {
            width: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 id="title">
        <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
    </h3>
    <div id="ld">
        <div>
            <img src="Content/image/car.png" />
        </div>
        <div id="msg">
            <p>
                价格：&yen;
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </p>
            <p>
                类型：
                    <asp:Label ID="Label2" runat="server" Text="长途"></asp:Label>
            </p>
            <p>
                线路：
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            </p>
            <p>
                时间：
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            </p>
            <p>
                电话：
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
            </p>
            <p>
                路程：
                    <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                KM

            </p>
            <p>
                人数：
                    <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
            </p>
        </div>
    </div>
    <div id="yellow">
        <p>
            <ion-icon name="alert-outline"></ion-icon>
            温馨提示
        </p>
        <p>1、交易前请仔细核实商家真实资质，勿信夸张宣传和承诺。</p>
        <p>2、该信息由搭个顺风车网友发布，其真实性及合法性由发布人负责，列表网仅引用以供用户参考，详情请阅读列表网免责条款。</p>
        <p>3、在签订合同或相关协议之前，任何要求预付定金、汇款等方式均存在风险，谨防上当受骗！</p>
    </div>
    <div id="fd">
        <p>
            类型：
                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <span>车牌号：
                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
            </span>
            <span id="carType">车型：
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
            </span>
        </p>
        <p>
            剩余人数：
                <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <div id="NumCount">
        <input id="num" type="text" value="1" />
        <a id="add" href="#">+</a>
        <a id="Reduce" href="#">-</a>
    </div>
</asp:Content>
