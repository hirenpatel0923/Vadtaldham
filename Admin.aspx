<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .calender
    {
        float:right;
        }
</style>
<meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0"> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
        <asp:LinkButton ID="Lnksignout" runat="server" 
            CssClass="calender" onclick="Lnksignout_Click">Sign Out</asp:LinkButton>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:TabContainer ID="TabContainer1" runat="server" Height="550" Width="990" 
            ActiveTabIndex="9" >
            <asp:TabPanel ID="DailyDarshan" HeaderText="Daily Darshan" ScrollBars="Auto" runat="server">
                <HeaderTemplate>Daily Darshan</HeaderTemplate>
                <ContentTemplate>
                    <asp:Button ID="BtnDDinsert" runat="server" Text="Insert into Daily Darshan" 
                        onclick="BtnDDinsert_Click" />&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Button ID="BtnDDdelete" runat="server" Text="Delete From Daily Darshan" 
                        onclick="BtnDDdelete_Click" />
                    <asp:Panel ID="PanelDDinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Enter Date</td>
                                <td>
                                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Choose Images For Upload
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnDDupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="DDinsert" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelDDdelete" runat="server" Visible="False">
                    <div style="float:left">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
                            GroupItemCount="4" >
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("image") %>' width="150" height="150" CommandArgument='<%# Eval("id") %>' />
                                    <br />
                                    Select :&nbsp&nbsp 
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" />
                                    <br />
                                </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
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
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
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
                                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("image") %>' width="150" height="150" CommandArgument='<%# Eval("id") %>' />
                                    <br />
                                    Select :&nbsp&nbsp 
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="false" />
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
                                    image:
                                    <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>

                        <asp:Label ID="Label1" runat="server"></asp:Label>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [DailyDarshan] WHERE ([date] = @date)">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="date" SessionField="seldate1" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:Button ID="DDdelete" runat="server" Text="Delelte Selected Items" 
                           OnCommand="Btndelete_Command" CommandArgument="DDdelete" Visible="false" />
                        </div>
                        <div style="float:right">
                        <asp:Calendar ID="Calendar5" runat="server" CssClass="calender" 
                            onselectionchanged="Calendar5_SelectionChanged"></asp:Calendar></div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="Shayan_Darshan" runat="server" HeaderText="Shayan Darshan">
                <ContentTemplate>
                    <asp:Button ID="BtnSDinsert" runat="server" 
                        Text="Insert into Shayan Darshan" onclick="BtnSDinsert_Click" />
                    <asp:Button ID="BtnSDdelete" runat="server" 
                        Text="Delete from Shayan Darshan" onclick="BtnSDdelete_Click" />
                    <asp:Panel ID="PanelSDinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Enter Date</td>
                                <td>
                                    <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Choose Images For Upload
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnSDupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="SDinsert" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelSDdelete" runat="server" Visible="False">
                    <div style="float:left">
                        <asp:ListView ID="ListView2" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlDataSource2" GroupItemCount="4">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                   <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("image") %>' width="150" height="150" CommandArgument='<%# Eval("id") %>' />
                                    <br />
                                    Select :&nbsp&nbsp 
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked="false"  />
                                    <br />
                                </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                    id:
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
                                    <br />
                                    date:
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
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
                                    <br />
                                    date:
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
                                     <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("image") %>' width="150" height="150" CommandArgument='<%# Eval("id") %>' />
                                    <br />
                                    Select :&nbsp&nbsp 
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked="false"  />
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
                                    <br />
                                    image:
                                    <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
                                    <br />
                                    date:
                                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>

                        <asp:Label ID="Label2" runat="server"></asp:Label>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [ShayanDarshan] WHERE ([date] = @date)">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="date" SessionField="seldate1" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:Button ID="SDdelete" runat="server" Text="Delelte Selected Items" 
                           OnCommand="Btndelete_Command" CommandArgument="SDdelete" Visible="false" />

                    </div>
                    <div style="float:right">
                        <asp:Calendar ID="Calendar6" runat="server" 
                            onselectionchanged="Calendar6_SelectionChanged"></asp:Calendar>
                    </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="Desktop_Wallpapers" runat="server" HeaderText="Desktop Wallpapers">
                <ContentTemplate>
                    <asp:Button ID="BtnDWinsert" runat="server" 
                        Text="Insert into Desktop Wallpapers" OnClick="BtnDWinsert_Click" />
                    <asp:Button ID="BtnDWdelete" runat="server" 
                        Text="Delete from Desktop Wallpapers" OnClick="BtnDWdelete_Click" />
                    <asp:Panel ID="PanelDWinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Enter Date</td>
                                <td>
                                    <asp:Calendar ID="Calendar3" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Choose Images For Upload
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload3" runat="server" AllowMultiple="true" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnDWupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="DWinsert" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelDWdelete" runat="server" Visible="False">
                        
                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" 
                            GroupItemCount="6">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                     <asp:ImageButton ID="ImageButton3" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("image") %>'/> <br />
                                     <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%#Eval("id") %>' OnCommand="lnkbtn_Command">Delete</asp:LinkButton>
            
                                    <br />
                                </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
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
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
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
                                     <asp:ImageButton ID="ImageButton3" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("image") %>'/> <br />
                                     <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%#Eval("id") %>' OnCommand="lnkbtn_Command">Delete</asp:LinkButton>
            
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
                                    image:
                                    <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [DeskWallpaper]"></asp:SqlDataSource>

                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="Mobile_Wallpapers" runat="server" HeaderText="Mobile Wallpapers">
                <ContentTemplate>
                    <asp:Button ID="BtnMWinsert" runat="server" 
                        Text="Insert into Mobile Wallpapers" onclick="BtnMWinsert_Click" />
                    <asp:Button ID="BtnMWdelete" runat="server" 
                        Text="Delete from Mobile Wallpapers" onclick="BtnMWdelete_Click" />
                    <asp:Panel ID="PanelMWinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Enter Date</td>
                                <td>
                                    <asp:Calendar ID="Calendar4" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Choose Images For Upload
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload4" runat="server" AllowMultiple="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnMWupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="MWinsert" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelMWdelete" runat="server" Visible="False">

                        <asp:ListView ID="ListView4" runat="server" DataKeyNames="id" 
                            DataSourceID="SqlDataSource4" GroupItemCount="6">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                   <asp:ImageButton ID="ImageButton4" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("image") %>'/> <br />
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%#Eval("id") %>' OnCommand="lnkbtn1_Command">Delete</asp:LinkButton>
                                </td>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                    id:
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                    <br />
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
                                    <br />
                                    date:
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
                                    image:
                                    <asp:TextBox ID="imageTextBox" runat="server" Text='<%# Bind("image") %>' />
                                    <br />
                                    date:
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
                                    <asp:ImageButton ID="ImageButton4" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("image") %>'/> <br />
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%#Eval("id") %>' OnCommand="lnkbtn1_Command">Delete</asp:LinkButton>
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
                                    <br />
                                    image:
                                    <asp:Label ID="imageLabel" runat="server" Text='<%# Eval("image") %>' />
                                    <br />
                                    date:
                                    <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [MobileWallpaper]"></asp:SqlDataSource>

                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="Photo_Gallary" runat="server" HeaderText="Photo Gallary">
                <ContentTemplate>
                    <asp:Button ID="BtnPGinsert" runat="server" 
                        Text="Insert album into Photo Gallary" onclick="BtnPGinsert_Click" />
                    <asp:Button ID="BtnPGdelete" runat="server" 
                        Text="Delete album from Photo Gallary" onclick="BtnPGdelete_Click" />
                    <asp:Panel ID="PanelPGinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Album Name</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="248px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td valign="top">Description about Album</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="248px" TextMode="MultiLine" 
                                        Height="82px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td valign="top">Date</td>
                                <td>
                                    <asp:Calendar ID="Calendar7" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Choose Images For Upload
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload5" runat="server"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnPGupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="PGinsert" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelPGdelete" runat="server" Visible="False">
                        <asp:Button ID="Btnalbdelete" runat="server" Text="Delete By Album" 
                            onclick="Btnalbdelete_Click" />&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:Button ID="Btnphotodelete" runat="server" 
                            Text="Delete By Photos in selected Album" onclick="Btnphotodelete_Click" />
                        <asp:Panel ID="SubPanelalbdelete" runat="server" Visible="False">
                            <asp:ListView ID="Alblist" runat="server" DataKeyNames="id" 
                                DataSourceID="albums" GroupItemCount="6">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' />
                                        <br />
                                        Album Name : 
                                        <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                                        <br />
                                        Total Images :
                                        <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_images") %>'></asp:Label>
                                        <br />
                                        Select :
                                        <asp:CheckBox ID="CheckBox3" runat="server" />
                                        <br />
                                    </td>
                                </AlternatingItemTemplate>
                                <EditItemTemplate>
                                    <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                        id:
                                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                        <br />
                                        a_name:
                                        <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                                        <br />
                                        a_image:
                                        <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                                        <br />
                                        des:
                                        <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                                        <br />
                                        date:
                                        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                        <br />
                                        total_images:
                                        <asp:TextBox ID="total_imagesTextBox" runat="server" 
                                            Text='<%# Bind("total_images") %>' />
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
                                        a_name:
                                        <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                                        <br />
                                        a_image:
                                        <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                                        <br />
                                        des:
                                        <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                                        <br />
                                        date:
                                        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                        <br />
                                        total_images:
                                        <asp:TextBox ID="total_imagesTextBox" runat="server" 
                                            Text='<%# Bind("total_images") %>' />
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
                                        <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' />
                                        <br />
                                        Album Name : 
                                        <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                                        <br />
                                        Total Images :
                                        <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_images") %>'></asp:Label>
                                        <br />
                                        Select :
                                        <asp:CheckBox ID="CheckBox3" runat="server" />
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
                                        <br />
                                        a_name:
                                        <asp:Label ID="a_nameLabel" runat="server" Text='<%# Eval("a_name") %>' />
                                        <br />
                                        a_image:
                                        <asp:Label ID="a_imageLabel" runat="server" Text='<%# Eval("a_image") %>' />
                                        <br />
                                        des:
                                        <asp:Label ID="desLabel" runat="server" Text='<%# Eval("des") %>' />
                                        <br />
                                        date:
                                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                        <br />
                                        total_images:
                                        <asp:Label ID="total_imagesLabel" runat="server" 
                                            Text='<%# Eval("total_images") %>' />
                                        <br />
                                    </td>
                                </SelectedItemTemplate>
                            </asp:ListView>  

                            <asp:Button ID="Btndeletealb" runat="server" Text="Delete Selected Album" 
                                onclick="Btndeletealb_Click" />

                            <asp:SqlDataSource ID="albums" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [Album1] ORDER BY [date] DESC">
                            </asp:SqlDataSource>
                        </asp:Panel>
                         <asp:Panel ID="SubPanelphotodelete" runat="server" Visible="False">

                             <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
                                 Visible="False">Back to the albums</asp:LinkButton>

                             <asp:ListView ID="Listofalbums" runat="server" DataKeyNames="id" 
                                 DataSourceID="listofalb" GroupItemCount="6">
                                 <AlternatingItemTemplate>
                                     <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                         <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' onCommand="showphoto_Command" />
                                        <br />
                                        Album Name : 
                                        <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                                        <br />
                                        Total Images :
                                        <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_images") %>'></asp:Label>
                                        <br />
                                     </td>
                                 </AlternatingItemTemplate>
                                 <EditItemTemplate>
                                     <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                         id:
                                         <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                         <br />
                                         a_name:
                                         <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                                         <br />
                                         a_image:
                                         <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                                         <br />
                                         des:
                                         <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                                         <br />
                                         date:
                                         <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                         <br />
                                         total_images:
                                         <asp:TextBox ID="total_imagesTextBox" runat="server" 
                                             Text='<%# Bind("total_images") %>' />
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
                                         a_name:
                                         <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                                         <br />
                                         a_image:
                                         <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                                         <br />
                                         des:
                                         <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                                         <br />
                                         date:
                                         <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                         <br />
                                         total_images:
                                         <asp:TextBox ID="total_imagesTextBox" runat="server" 
                                             Text='<%# Bind("total_images") %>' />
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
                                        <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' onCommand="showphoto_Command" />
                                        <br />
                                        Album Name : 
                                        <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                                        <br />
                                        Total Images :
                                        <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_images") %>'></asp:Label>
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
                                         <br />
                                         a_name:
                                         <asp:Label ID="a_nameLabel" runat="server" Text='<%# Eval("a_name") %>' />
                                         <br />
                                         a_image:
                                         <asp:Label ID="a_imageLabel" runat="server" Text='<%# Eval("a_image") %>' />
                                         <br />
                                         des:
                                         <asp:Label ID="desLabel" runat="server" Text='<%# Eval("des") %>' />
                                         <br />
                                         date:
                                         <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                         <br />
                                         total_images:
                                         <asp:Label ID="total_imagesLabel" runat="server" 
                                             Text='<%# Eval("total_images") %>' />
                                         <br />
                                     </td>
                                 </SelectedItemTemplate>
                             </asp:ListView>

                             <asp:SqlDataSource ID="listofalb" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                 SelectCommand="SELECT * FROM [Album1] ORDER BY [date] DESC">
                             </asp:SqlDataSource>


                             <asp:ListView ID="ListView5" runat="server" Visible="False" DataKeyNames="id" 
                                 DataSourceID="SqlDataSource7" GroupItemCount="6">
                                 <AlternatingItemTemplate>
                                     <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl='<%# Eval("image_name") %>' width="150" height="150" CommandArgument='<%# Eval("id") %>'
                                        CommandName='<%# Eval("alb_id") %>' />
                                    <br />
                                    Select :&nbsp&nbsp 
                                    <asp:CheckBox ID="CheckBox7" runat="server" Checked="false" />
                                    <br />
                                     </td>
                                 </AlternatingItemTemplate>
                                 <EditItemTemplate>
                                     <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                         id:
                                         <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                         <br />
                                         alb_id:
                                         <asp:TextBox ID="alb_idTextBox" runat="server" Text='<%# Bind("alb_id") %>' />
                                         <br />
                                         image_name:
                                         <asp:TextBox ID="image_nameTextBox" runat="server" 
                                             Text='<%# Bind("image_name") %>' />
                                         <br />
                                         date:
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
                                         alb_id:
                                         <asp:TextBox ID="alb_idTextBox" runat="server" Text='<%# Bind("alb_id") %>' />
                                         <br />
                                         image_name:
                                         <asp:TextBox ID="image_nameTextBox" runat="server" 
                                             Text='<%# Bind("image_name") %>' />
                                         <br />
                                         date:
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
                                    <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl='<%# Eval("image_name") %>' width="150" height="150" CommandArgument='<%# Eval("id") %>'
                                    CommandName='<%# Eval("alb_id") %>' />
                                    <br />
                                    Select :&nbsp&nbsp 
                                    <asp:CheckBox ID="CheckBox7" runat="server" Checked="false" />
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
                                         <br />
                                         alb_id:
                                         <asp:Label ID="alb_idLabel" runat="server" Text='<%# Eval("alb_id") %>' />
                                         <br />
                                         image_name:
                                         <asp:Label ID="image_nameLabel" runat="server" 
                                             Text='<%# Eval("image_name") %>' />
                                         <br />
                                         date:
                                         <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                         <br />
                                     </td>
                                 </SelectedItemTemplate>
                             </asp:ListView>

                             <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                 SelectCommand="SELECT * FROM [Alb_Photo1] WHERE ([alb_id] = @alb_id)">
                                 <SelectParameters>
                                     <asp:SessionParameter Name="alb_id" SessionField="albumid" Type="Int64" />
                                 </SelectParameters>
                             </asp:SqlDataSource>

                             <asp:Button ID="deletebutton" runat="server" Text="Delete Images" 
                                 Visible="False" onclick="deletebutton_Click" />

                        </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>

            <asp:TabPanel ID="Mobile_Ringtone" runat="server" HeaderText="Mobile Ringtone">
                <ContentTemplate>
                    <asp:Button ID="BtnMRinsert" runat="server" Text="Insert into Mobile Ringtone" 
                        OnClick="BtnMRinsert_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnMRdelete" runat="server" Text="Delete from Mobile Ringtone" 
                        OnClick="BtnMRdelete_Click" />
                    <asp:Panel ID="PanelMRinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Add Ringtones</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload6" runat="server" allowmultiple="true" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnMRupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="MRinsert" onclick="BtnMRupload_Click" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelMRdelete" runat="server" Visible="False">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id" DataSourceID="GridviewMR">
                            <Columns>
                                <asp:BoundField DataField="r_name" HeaderText="Ringtone Name" 
                                    SortExpression="r_name" />
                                    <asp:TemplateField HeaderText="Play Online">
                                            <ItemTemplate>
                                        <audio runat="server" id="ad1" controls>
                        <source src='<%# Eval("r_path") %>' type="audio/mpeg">
                            Your browser does not support the audio element.</audio>
                                    </ItemTemplate>
                                        </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        
                                        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" CommandArgument='<%# Eval("id") %>' >Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="GridviewMR" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [MobileRingtone]"></asp:SqlDataSource>
                    </asp:Panel>
                </ContentTemplate>
            
            </asp:TabPanel>

            <asp:TabPanel ID="Divine_MP" runat="server" HeaderText="Divine Music Player">
                
                <ContentTemplate>
                    <asp:Button ID="BtnDMPinsert" runat="server" 
                        Text="Insert into Divine Music Player" OnClick="BtnDMPinsert_Click" />
                    <asp:Button ID="BtnDMPdelete" runat="server" 
                        Text="Delete from Divine Music Player" OnClick="BtnDMPdelete_Click" />
                    <asp:Panel ID="PanelDMPinsert" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Music album Name</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="248px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td valign="top">Description about Album</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Width="248px" TextMode="MultiLine" 
                                        Height="82px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td valign="top">Date</td>
                                <td>
                                    <asp:Calendar ID="Calendar8" runat="server"></asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>Album Image</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload7" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>
                                    Choose Music For Upload
                                </td>
                                <td>
                                    <asp:FileUpload ID="FileUpload8" runat="server" AllowMultiple="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnDMPupload" runat="server" Text="Upload" OnCommand="Btnupload_Command"
                                        CommandArgument="DMPinsert" onclick="BtnDMPupload_Click" /></td>
                            </tr>
                        </table>
                    </asp:Panel>
                     <asp:Panel ID="PanelDMPdelete" runat="server" Visible="False">
                         <asp:Button ID="SubbtnDMPdelete1" runat="server" Text="Delete by Albums" 
                             onclick="SubbtnDMPdelete1_Click" style="height: 26px" />&nbsp&nbsp&nbsp&nbsp&nbsp
                         <asp:Panel ID="SubPanelDMPdelete1" runat="server" Visible="False">
                             <asp:ListView ID="ListView6" runat="server" DataKeyNames="id" 
                                 DataSourceID="dsdvmlv" GroupItemCount="3">
                                 <AlternatingItemTemplate>
                                     <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                                        <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' />
                                        <br />
                                        Album Name : 
                                        <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                                        <br />
                                        Total Images :
                                        <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_song") %>'></asp:Label>
                                        <br />
                                        Select :
                                        <asp:CheckBox ID="CheckBox3" runat="server" />
                                        <br />
                                     </td>
                                 </AlternatingItemTemplate>
                                 <EditItemTemplate>
                                     <td runat="server" style="background-color: #FFCC66;color: #000080;">
                                         id:
                                         <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                         <br />
                                         a_name:
                                         <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                                         <br />
                                         a_image:
                                         <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                                         <br />
                                         des:
                                         <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                                         <br />
                                         date:
                                         <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                         <br />
                                         total_song:
                                         <asp:TextBox ID="total_songTextBox" runat="server" 
                                             Text='<%# Bind("total_song") %>' />
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
                                         a_name:
                                         <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                                         <br />
                                         a_image:
                                         <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                                         <br />
                                         des:
                                         <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                                         <br />
                                         date:
                                         <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                         <br />
                                         total_song:
                                         <asp:TextBox ID="total_songTextBox" runat="server" 
                                             Text='<%# Bind("total_song") %>' />
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
                                        <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' />
                                        <br />
                                        Album Name : 
                                        <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                                        <br />
                                        Total Images :
                                        <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_song") %>'></asp:Label>
                                        <br />
                                        Select :
                                        <asp:CheckBox ID="CheckBox3" runat="server" />
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
                                         <br />
                                         a_name:
                                         <asp:Label ID="a_nameLabel" runat="server" Text='<%# Eval("a_name") %>' />
                                         <br />
                                         a_image:
                                         <asp:Label ID="a_imageLabel" runat="server" Text='<%# Eval("a_image") %>' />
                                         <br />
                                         des:
                                         <asp:Label ID="desLabel" runat="server" Text='<%# Eval("des") %>' />
                                         <br />
                                         date:
                                         <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                         <br />
                                         total_song:
                                         <asp:Label ID="total_songLabel" runat="server" 
                                             Text='<%# Eval("total_song") %>' />
                                         <br />
                                     </td>
                                 </SelectedItemTemplate>
                             </asp:ListView>

                             <asp:Button ID="BtndeleteDMPalb" runat="server" Text="Delete Album" 
                                 onclick="BtndeleteDMPalb_Click" />
                             <asp:SqlDataSource ID="dsdvmlv" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                 SelectCommand="SELECT * FROM [DivineAlbum] ORDER BY [date] DESC">
                             </asp:SqlDataSource>
                         </asp:Panel>
                         <asp:Panel ID="SubPanelDMPdelete2" runat="server" Visible="False">
                         </asp:Panel>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="E_Literature" runat="server" HeaderText="E-Literature">
                <HeaderTemplate>
                    E-Literature
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Button ID="Button1" runat="server" Text="E-Magazine" 
                        onclick="Button1_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="E-Books" 
                        onclick="Button2_Click" />
                    <asp:Panel ID="Panel1" runat="server" Visible="False">
                        <table>
                        <tr>
                            <td>Magazine Name</td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Width="248px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Id of Magazine</td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server" Width="248px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Image of Magazine</td>
                            <td>
                                <asp:FileUpload ID="FileUpload9" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>Select Magazine</td>
                            <td>
                                <asp:FileUpload ID="FileUpload10" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="BtnEMagupload" runat="server" Text="Upload Magazine" OnCommand="Btnupload_Command"
                                        CommandArgument="EMGinsert"/></td>
                        </tr>
                    </table>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <table>
                            <tr>
                                <td>Name of Book</td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" Width="248px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Author</td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server" Height="22px" Width="248px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Pages</td>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" Width="248px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Publisher</td>
                                <td>
                                    <asp:TextBox ID="TextBox10" runat="server" Width="248px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Language</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem>English</asp:ListItem>
                                        <asp:ListItem>Gujrati</asp:ListItem>
                                        <asp:ListItem>Hindi</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>  
                            <tr>
                                <td>Select Book image</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload11" runat="server" />
                                </td>
                            </tr>   
                            <tr>
                                <td>Select Book</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload12" runat="server" />
                                </td>
                            </tr>  
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="BtnEBKupload" runat="server" Text="Upload E-book" OnCommand="Btnupload_Command"
                                        CommandArgument="EBKinsert" /></td>
                            </tr>
                       </table>
                    </asp:Panel>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="videos" runat="server" HeaderText="Upload Videos">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>Video Name</td>
                            <td>
                                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Date</td>
                            <td>
                                <asp:Calendar ID="Calendar9" runat="server"></asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td>Image of video</td>
                            <td>
                                <asp:FileUpload ID="FileUpload13" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                YouTube URL</td>
                            <td>
                                <asp:TextBox ID="TextBox12" runat="server" Height="22px" Width="263px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="Upload" onclick="Button3_Click" /></td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="feedbackform" runat="server" HeaderText="Feedbacks">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="feedback">
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="email" HeaderText="Email Address" 
                                SortExpression="email" />
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            <asp:BoundField DataField="country" HeaderText="Country" 
                                SortExpression="country" />
                            <asp:BoundField DataField="message" HeaderText="Message" 
                                SortExpression="message" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="feedback" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Feedback1]"></asp:SqlDataSource>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>
</asp:Content>

