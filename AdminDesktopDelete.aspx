<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDesktopDelete.aspx.cs" Inherits="AdminDesktopDelete" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Logout</asp:LinkButton></br>
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Home</asp:LinkButton>
    <asp:ListView ID="ListView1" runat="server" GroupItemCount="5" 
        GroupPlaceholderID="gp1" ItemPlaceholderID="iph" 
        DataSourceID="SqlDataSource1"> 
       <LayoutTemplate>
        <table>
            <tr id="gp1" runat="server">
            </tr>
           
        </table>
       </LayoutTemplate>
       <GroupTemplate>
       <tr>
            <td id="iph" runat="server"></td>
       </tr>
       
       </GroupTemplate> 
    <ItemTemplate>
        <td align="center">
            <asp:ImageButton ID="ImageButton1" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("image") %>'/> <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%#Eval("id") %>' OnCommand="lnkbtn_Command">Delete</asp:LinkButton>
            
              
        </td>
    </ItemTemplate>
    </asp:ListView>
 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [image], [id] FROM [DeskWallpaper]">
    </asp:SqlDataSource>
    </form>
 
 
</body>
</html>
