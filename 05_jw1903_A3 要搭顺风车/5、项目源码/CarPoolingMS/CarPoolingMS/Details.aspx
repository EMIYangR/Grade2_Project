<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="CarPoolingMS.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #form1 #ld {
            display: flex;
        }

        #form1 #yellow {
            background-color: #fffcea;
        }

        #mg {
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

        h2 {
            margin-top: 30px;
        }
        #ld div img {
            max-width: 344px;
            max-height: 258px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mg">
        <h3 id="title">
            <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
        </h3>
        <div id="ld">
            <div>
                <img src="Content/image/lcar.jpg" />
            </div>
            <div id="msg">
                <p>
                    价格：
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
                类型：
                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>
            </p>
            <% if (ID == 1)
                { %>
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
        <div>
            <%if (UserID != dlUserID)
                { %>
            <p>
                <asp:Label ID="Label17" runat="server" Text="加入人数"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" type="number" class="form-control form-control-emphasized" Width="200px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="加入" class="btn btn-soft-success" />

            </p>
            <%}
                else
                {%>
            <p>
                <%--司机删除修改--%>
                <asp:Button ID="Button3" runat="server" Text="删除" OnClick="Button3_Click" OnClientClick="return confirm('是否确认删除?')" class="btn btn-soft-warning" />
                <a href="Modify.aspx" class="btn btn-link">修改</a>
            </p>
            <%} %>
            <div>
                <h4>评论：</h4>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <div class="comment-item border-bottom">
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

                <p class="text-center">
                    <asp:Button ID="Button6" runat="server" Text="首页" OnClick="Button6_Click" class="btn" />
                    <asp:Button ID="Button7" runat="server" Text="上一页" OnClick="Button7_Click" class="btn" />
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control form-control-emphasized text-center" Width="125px" Height="20px"></asp:TextBox>
                    <asp:Button ID="Button8" runat="server" Text="搜索" OnClick="Button8_Click" class="btn" />
                    <asp:Button ID="Button9" runat="server" Text="下一页" OnClick="Button9_Click" class="btn" />
                    <asp:Button ID="Button10" runat="server" Text="尾页" OnClick="Button10_Click" class="btn" />
                    <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
                </p>
                <div>
                    <table>
                        <tr>
                            <td class="text-right align-text-top">内容:</td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Rows="3" TextMode="MultiLine" Width="800px" class="form-control form-control-emphasized"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">填写(1-5)星:</td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" type="number" class="form-control form-control-emphasized" Width="200px"></asp:TextBox>
                                <asp:Button ID="Button5" runat="server" Text="提交评论" OnClick="Button5_Click" class="btn btn-soft-success" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <%}
                else
                { %>
            <%if (UserID != dlUserID)
                { %>
            <p>
                <asp:Button ID="Button2" runat="server" Text="邀请加入" OnClick="Button2_Click" class="btn btn-soft-info" />
            </p>
            <%}
                else
                { %>
            <p>
                <%--乘客删除修改--%>
                <asp:Button ID="Button4" runat="server" Text="删除" OnClick="Button4_Click" OnClientClick="return confirm('是否确认删除?')" class="btn btn-soft-warning" />
                <a href="Modify.aspx" class="btn btn-link">修改</a>
            </p>
            <%} %>

            <%} %>
        </div>
    </div>
</asp:Content>
