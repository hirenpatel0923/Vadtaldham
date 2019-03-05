<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GetFeedback.aspx.cs" Inherits="GetFeedback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="message" HeaderText="message" 
                    SortExpression="message" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Feedback1]"></asp:SqlDataSource>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    
    </div>
    </form>
</body>
</html>
