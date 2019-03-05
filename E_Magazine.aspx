<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="E_Magazine.aspx.cs" Inherits="E_Magazine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" GroupItemCount="6">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" Height ="150px" Width="150px" ImageUrl='<%# Bind("mag_img") %>' OnCommand="imgbtn_Command" CommandArgument='<%# Bind("mag_id") %>' />
                <br />
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("mag_name") %>'></asp:Label>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="lnkbtn_Command" CommandName='<%# Bind("mag_path") %>'>Download</asp:LinkButton>
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #FFCC66;color: #000080;">
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />mag_name:
                <asp:TextBox ID="mag_nameTextBox" runat="server" 
                    Text='<%# Bind("mag_name") %>' />
                <br />mag_id:
                <asp:TextBox ID="mag_idTextBox" runat="server" Text='<%# Bind("mag_id") %>' />
                <br />mag_img:
                <asp:TextBox ID="mag_imgTextBox" runat="server" Text='<%# Bind("mag_img") %>' />
                <br />
                mag_path:
                <asp:TextBox ID="mag_pathTextBox" runat="server" 
                    Text='<%# Bind("mag_path") %>' />
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
                mag_name:
                <asp:TextBox ID="mag_nameTextBox" runat="server" 
                    Text='<%# Bind("mag_name") %>' />
                <br />mag_id:
                <asp:TextBox ID="mag_idTextBox" runat="server" Text='<%# Bind("mag_id") %>' />
                <br />mag_img:
                <asp:TextBox ID="mag_imgTextBox" runat="server" Text='<%# Bind("mag_img") %>' />
                <br />
                mag_path:
                <asp:TextBox ID="mag_pathTextBox" runat="server" 
                    Text='<%# Bind("mag_path") %>' />
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
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" Height ="150px" Width="150px" ImageUrl='<%# Bind("mag_img") %>' OnCommand="imgbtn_Command" CommandArgument='<%# Bind("mag_id") %>' />
                <br />
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("mag_name") %>'></asp:Label>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="lnkbtn_Command" CommandName='<%# Bind("mag_path") %>'>Download</asp:LinkButton>
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
                <br />mag_name:
                <asp:Label ID="mag_nameLabel" runat="server" Text='<%# Eval("mag_name") %>' />
                <br />mag_id:
                <asp:Label ID="mag_idLabel" runat="server" Text='<%# Eval("mag_id") %>' />
                <br />mag_img:
                <asp:Label ID="mag_imgLabel" runat="server" Text='<%# Eval("mag_img") %>' />
                <br />
                mag_path:
                <asp:Label ID="mag_pathLabel" runat="server" Text='<%# Eval("mag_path") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [E_Magazine]"></asp:SqlDataSource>
        
</div>
</asp:Content>

