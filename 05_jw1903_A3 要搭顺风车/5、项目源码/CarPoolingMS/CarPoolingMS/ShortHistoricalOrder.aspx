<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShortHistoricalOrder.aspx.cs" Inherits="CarPoolingMS.ShortHistoricalOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="d1">
        <h2 id="h2">历史订单</h2>
        <p id="lbie">
            <span class="text-muted">类别：</span>
            <a href="HistoricalOrder.aspx?le='有效'">长途拼车</a>
            <a href="ShortHistoricalOrder.aspx?le='有效'" class="font-weight-bold border border-primary">短途拼车（上下班拼车）</a>
        </p>
        <div id="zt">
            <span class="text-muted">状态：</span>
            <a href="ShortHistoricalOrder.aspx?le='有效'" class="dj">进行中</a>
            <a href="ShortHistoricalOrder.aspx?le='无效'" class="dj">已完成</a>
        </div>
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">起点</th>
                        <th scope="col">途径</th>
                        <th scope="col">终点</th>
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
                                    <%# Eval("S_StartingPlace") %>
                                </td>
                                <td>
                                    <%# Eval("S_Approach") %>
                                </td>
                                <td>
                                    <%# Eval("S_Destination") %>
                                </td>
                                <td>短途
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
