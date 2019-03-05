<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="DivineMusic.aspx.cs" Inherits="DivineMusic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">

<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
        Visible="False">Back to the albums</asp:LinkButton>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" GroupItemCount="6">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' onCommand="showphoto_Command" />
                <br />
                Album Name : 
                <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                <br />
                Total Songs :
                <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_song") %>'></asp:Label>
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #FFCC66;color: #000080;">
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />a_name:
                <asp:TextBox ID="a_nameTextBox" runat="server" Text='<%# Bind("a_name") %>' />
                <br />a_image:
                <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                <br />des:
                <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                <br />date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                <br />total_song:
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
                <br />a_image:
                <asp:TextBox ID="a_imageTextBox" runat="server" Text='<%# Bind("a_image") %>' />
                <br />des:
                <asp:TextBox ID="desTextBox" runat="server" Text='<%# Bind("des") %>' />
                <br />date:
                <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                <br />total_song:
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
                <asp:ImageButton ID="ImageButton5" runat="server" Height ="150px" Width="150px" ImageUrl='<%#Eval("a_image") %>' CommandArgument='<%# Eval("id") %>' onCommand="showphoto_Command" />
                <br />
                Album Name : 
                <asp:Label ID="lblalbname" runat="server" Text='<%# Bind("a_name") %>'></asp:Label>
                <br />
                Total Songs :
                <asp:Label ID="lbltotal_img" runat="server" Text='<%# Eval("total_song") %>'></asp:Label>
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
                <br />a_name:
                <asp:Label ID="a_nameLabel" runat="server" Text='<%# Eval("a_name") %>' />
                <br />a_image:
                <asp:Label ID="a_imageLabel" runat="server" Text='<%# Eval("a_image") %>' />
                <br />des:
                <asp:Label ID="desLabel" runat="server" Text='<%# Eval("des") %>' />
                <br />date:
                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                <br />total_song:
                <asp:Label ID="total_songLabel" runat="server" 
                    Text='<%# Eval("total_song") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [DivineAlbum]"></asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id" DataSourceID="SqlDataSource2" 
            Visible="False">
         <Columns>
                                <asp:BoundField DataField="m_name" HeaderText="Ringtone Name" 
                                    SortExpression="m_name" />
                                    <asp:TemplateField HeaderText="Play Online">
                                            <ItemTemplate>
                                        <audio runat="server" id="ad1" controls>
                                            <source src='<%# Eval("m_path") %>' type="audio/mpeg">
                                            Your browser does not support the audio element.
                                        </audio>
                                    </ItemTemplate>
                                        </asp:TemplateField>
                                <asp:TemplateField HeaderText="Download">
                                    <ItemTemplate>
                                        
                                        <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" CommandArgument='<%# Eval("id") %>' >Download</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
        </asp:GridView>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [DivineMusic] WHERE ([alb_id] = @alb_id)">
        <SelectParameters>
            <asp:SessionParameter Name="alb_id" SessionField="albumid" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
</asp:Content>

