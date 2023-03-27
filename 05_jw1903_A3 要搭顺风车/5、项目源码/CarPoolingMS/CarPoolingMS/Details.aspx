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
        <p>2、该信息由要搭顺风车网友发布，其真实性及合法性由发布人负责，要搭顺风车网仅引用以供用户参考，详情请阅读要搭顺风车网免责条款。</p>
        <p>3、在签订合同或相关协议之前，任何要求预付定金、汇款等方式均存在风险，谨防上当受骗！</p>
    </div>
    <div id="fd">
        <p>
            类型:
                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
        </p>
        <% if (ID == 1)
            { %>
        <p>
            <span>车牌号:
                <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
            </span>
            <span id="carType">车型:
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
            </span>
        </p>
        <p>
            剩余人数:
            <asp:Label ID="Label11" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <div>
        <p>
            类型:
                <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
        </p>
        <% if (ID == 1)
            { %>
        <p>

            <span>车牌号:
                        <asp:Label ID="Label19" runat="server" Text=""></asp:Label>
            </span>
            <span>车型:
                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
            </span>
        </p>
        <p>
            剩余人数:
                    <asp:Label ID="Label16" runat="server" Text=""></asp:Label>
        </p>
        <%if (UserID != dlUserID)
            { %>
        <p>
            <asp:Label ID="Label17" runat="server" Text="加入人数"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" type="number"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="加入" />

        </p>
        <%}
            else
            {%>
        <p>
            <%--司机删除修改--%>
            <asp:Button ID="Button3" runat="server" Text="删除" OnClick="Button3_Click" OnClientClick="return confirm('是否确认删除?')" />
            <a href="Modify.aspx">修改</a>
        </p>
        <%} %>
        <div>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="comment-item">
                        <p>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Star")+"星好评" %>'></asp:Label>
                        </p>
                        <div>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("commentContent") %>'></asp:Label>
                        </div>
                        <p align="right">
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("commentTime") %>'></asp:Label>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div>
                <h2>评论：</h2>
            </div>
            <div>
                <asp:Button ID="Button6" runat="server" Text="首页" OnClick="Button6_Click" />
                <asp:Button ID="Button7" runat="server" Text="上一页" OnClick="Button7_Click" />
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:Button ID="Button8" runat="server" Text="搜索" OnClick="Button8_Click" />
                <asp:Button ID="Button9" runat="server" Text="下一页" OnClick="Button9_Click" />
                <asp:Button ID="Button10" runat="server" Text="尾页" OnClick="Button10_Click" />
                <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
            </div>
            <div>
                内容:
                        <asp:TextBox ID="TextBox2" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                填写(1-5)星:
                        <asp:TextBox ID="TextBox3" runat="server" type="number"></asp:TextBox>
                <asp:Button ID="Button5" runat="server" Text="提交评论" OnClick="Button5_Click" />
            </div>
        </div>
        <%}
            else
            { %>
        <%if (UserID != dlUserID)
            { %>
        <p>
            <asp:Button ID="Button2" runat="server" Text="邀请加入" OnClick="Button2_Click" />
        </p>
        <%}
            else
            { %>
        <p>
            <%--乘客删除修改--%>
            <asp:Button ID="Button4" runat="server" Text="删除" OnClick="Button4_Click" OnClientClick="return confirm('是否确认删除?')" />
            <a href="Modify.aspx">修改</a>
        </p>
        <%} %>

        <%}
            } %>
    </div>
</asp:Content>
