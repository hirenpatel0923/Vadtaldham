<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="Video_Gallary.aspx.cs" Inherits="Video_Gallary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style>
        .video
        {
            position:relative;
            float:left;
            top:0px;
            left:0px;
            }
    
            
    </style>
    
    
    <script src="js/{common,util,stats}.js" type="text/javascript"></script>
    <script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="url" 
        DataSourceID="SqlDataSource1" GroupItemCount="6">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FAFAD2;color: #284775;">

			<a href='<%# Eval("url") %>' target="_blank" rel="prettyPhoto" title="YouTube demo"><img src='<%# Eval("image") %>' width="240" height="150" alt=""></a>
               <br />
                Name:
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                <br />
                Date:
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("date") %>'></asp:Label>  
                <br /> 
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #FFCC66;color: #000080;">
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />url:
                <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
                <br />date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" 
                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">
                name:
                <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />url:
                <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
                <br />date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #FFFBD6;color: #333333;">
           <a href='<%# Eval("url") %>' target="_blank" rel="prettyPhoto" title="YouTube demo"><img src='<%# Eval("image") %>' width="240" height="150" alt=""></a>
            
                <br />
                Name:
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                <br />
                Date:
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("date") %>'></asp:Label>  
                <br /> 
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" 
                        style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" 
                style="background-color: #FFCC66;font-weight: bold;color: #000080;">
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                <br />url:
                <asp:Label ID="urlLabel" runat="server" Text='<%# Eval("url") %>' />
                <br />date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [video] ORDER BY [date] DESC"></asp:SqlDataSource>
    <asp:TextBox ID="txturl" runat="server"></asp:TextBox>
</div>
</asp:Content>

