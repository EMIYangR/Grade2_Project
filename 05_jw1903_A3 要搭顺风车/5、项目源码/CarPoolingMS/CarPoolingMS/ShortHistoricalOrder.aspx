<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShortHistoricalOrder.aspx.cs" Inherits="CarPoolingMS.ShortHistoricalOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <a href="HistoricalOrder.aspx">长途</a>
        <a href="ShortHistoricalOrder.aspx">短途</a>
    </div>
    <div>
        <a href="ShortHistoricalOrder.aspx?le='有效'">进行中</a>
        <a href="ShortHistoricalOrder.aspx?le='无效'">已完成</a>
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
                            <%# Eval("S_StartingPlace") %>
                        </td>
                        <td>
                            <%# Eval("S_Destination") %>
                        </td>
                        <td>长途
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
