<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="E_Books.aspx.cs" Inherits="E_Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" GroupItemCount="6">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" ImageUrl='<%# Eval("b_img") %>' />
                <br />Book Name:
                <asp:Label ID="b_nameLabel" runat="server" Text='<%# Eval("b_name") %>' />
                <br />Author:
                <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                <br />Pages:
                <asp:Label ID="pagesLabel" runat="server" Text='<%# Eval("pages") %>' />
                <br />Publisher:
                <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />
                <br />Language:
                <asp:Label ID="langLabel" runat="server" Text='<%# Eval("lang") %>' />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="lnkbtn_Command" CommandName='<%# Bind("b_path") %>'>Download</asp:LinkButton>
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #FFCC66;color: #000080;">
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />b_name:
                <asp:TextBox ID="b_nameTextBox" runat="server" Text='<%# Bind("b_name") %>' />
                <br />author:
                <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                <br />pages:
                <asp:TextBox ID="pagesTextBox" runat="server" Text='<%# Bind("pages") %>' />
                <br />publisher:
                <asp:TextBox ID="publisherTextBox" runat="server" 
                    Text='<%# Bind("publisher") %>' />
                <br />lang:
                <asp:TextBox ID="langTextBox" runat="server" Text='<%# Bind("lang") %>' />
                <br />b_img:
                <asp:TextBox ID="b_imgTextBox" runat="server" Text='<%# Bind("b_img") %>' />
                <br />b_path:
                <asp:TextBox ID="b_pathTextBox" runat="server" Text='<%# Bind("b_path") %>' />
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
                b_name:
                <asp:TextBox ID="b_nameTextBox" runat="server" Text='<%# Bind("b_name") %>' />
                <br />author:
                <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                <br />pages:
                <asp:TextBox ID="pagesTextBox" runat="server" Text='<%# Bind("pages") %>' />
                <br />publisher:
                <asp:TextBox ID="publisherTextBox" runat="server" 
                    Text='<%# Bind("publisher") %>' />
                <br />lang:
                <asp:TextBox ID="langTextBox" runat="server" Text='<%# Bind("lang") %>' />
                <br />b_img:
                <asp:TextBox ID="b_imgTextBox" runat="server" Text='<%# Bind("b_img") %>' />
                <br />b_path:
                <asp:TextBox ID="b_pathTextBox" runat="server" Text='<%# Bind("b_path") %>' />
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
                <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" ImageUrl='<%# Eval("b_img") %>' />
                <br />Book Name:
                <asp:Label ID="b_nameLabel" runat="server" Text='<%# Eval("b_name") %>' />
                <br />Author:
                <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                <br />Pages:
                <asp:Label ID="pagesLabel" runat="server" Text='<%# Eval("pages") %>' />
                <br />Publisher:
                <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />
                <br />Language:
                <asp:Label ID="langLabel" runat="server" Text='<%# Eval("lang") %>' />
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="lnkbtn_Command" CommandName='<%# Bind("b_path") %>'>Download</asp:LinkButton>
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
                <br />b_name:
                <asp:Label ID="b_nameLabel" runat="server" Text='<%# Eval("b_name") %>' />
                <br />author:
                <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                <br />pages:
                <asp:Label ID="pagesLabel" runat="server" Text='<%# Eval("pages") %>' />
                <br />publisher:
                <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />
                <br />lang:
                <asp:Label ID="langLabel" runat="server" Text='<%# Eval("lang") %>' />
                <br />b_img:
                <asp:Label ID="b_imgLabel" runat="server" Text='<%# Eval("b_img") %>' />
                <br />b_path:
                <asp:Label ID="b_pathLabel" runat="server" Text='<%# Eval("b_path") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [E_Book]"></asp:SqlDataSource>

</div>
</asp:Content>

