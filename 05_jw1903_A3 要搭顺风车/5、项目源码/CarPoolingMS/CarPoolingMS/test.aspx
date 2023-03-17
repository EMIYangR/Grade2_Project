<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CarPoolingMS.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                起点
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
            <p>
                终点
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </p>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="S_ID">
                <Columns>
                    <asp:BoundField DataField="S_ID" HeaderText="S_ID" InsertVisible="False" ReadOnly="True" SortExpression="S_ID" />
                    <asp:BoundField DataField="S_StartingPlace" HeaderText="S_StartingPlace" SortExpression="S_StartingPlace" />
                    <asp:BoundField DataField="S_Approach" HeaderText="S_Approach" SortExpression="S_Approach" />
                    <asp:BoundField DataField="S_Destination" HeaderText="S_Destination" SortExpression="S_Destination" />
                    <asp:BoundField DataField="S_TimeRequired" HeaderText="S_TimeRequired" SortExpression="S_TimeRequired" />
                    <asp:BoundField DataField="S_Number" HeaderText="S_Number" SortExpression="S_Number" />
                    <asp:BoundField DataField="S_Kilometers" HeaderText="S_Kilometers" SortExpression="S_Kilometers" />
                    <asp:BoundField DataField="S_Price" HeaderText="S_Price" SortExpression="S_Price" />
                    <asp:BoundField DataField="S_Message" HeaderText="S_Message" SortExpression="S_Message" />
                    <asp:BoundField DataField="PublishID" HeaderText="PublishID" SortExpression="PublishID" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarPoolingDBConnectionString %>" SelectCommand="SELECT * FROM [ShortDistance]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
