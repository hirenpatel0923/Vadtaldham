<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="PhotoGallery.aspx.cs" Inherits="PhotoGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="lightbox/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="lightbox/lightbox-2.6.min.js" type="text/javascript"></script>
    <link href="lightbox/lightbox.css" rel="stylesheet" type="text/css" />
    <script src="lightbox/modernizr.custom.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
  
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
        Visible="False">Back to the albums</asp:LinkButton>

       <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
           GroupItemCount="6">
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
                                       ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                   <asp:NumericPagerField />
                                   <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                       ShowNextPageButton="False" ShowPreviousPageButton="False" />
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

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
           
           SelectCommand="SELECT [a_name], [a_image], [total_images], [id] FROM [Album1] ORDER BY [date] DESC"></asp:SqlDataSource>




    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" 
           GroupItemCount="6" Visible="false">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                 <div class="wrapper">
	        <section id="examples" class="section examples-section">
				<a class="example-image-link" href='<%#Eval("image_name") %>' data-lightbox="example-set" title="Click on the right side of the image to move forward."><img class="example-image" src='<%#Eval("image_name") %>' alt="Plants: image 1 0f 4 thumb" width="150" height="150"></a>
	        </section>
    <script>
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-2196019-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
	</script>
    </div> <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #FFCC66;color: #000080;">
                image_name:
                <asp:TextBox ID="image_nameTextBox" runat="server" 
                    Text='<%# Bind("image_name") %>' />
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
                image_name:
                <asp:TextBox ID="image_nameTextBox" runat="server" 
                    Text='<%# Bind("image_name") %>' />
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
                <div class="wrapper">
	        <section id="examples" class="section examples-section">
				<a class="example-image-link" href='<%#Eval("image_name") %>' data-lightbox="example-set" title="Click on the right side of the image to move forward."><img class="example-image" src='<%#Eval("image_name") %>' alt="Plants: image 1 0f 4 thumb" width="150" height="150"></a>
	        </section>
    <script>
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-2196019-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
	</script>
    </div> <br />
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
                image_name:
                <asp:Label ID="image_nameLabel" runat="server" 
                    Text='<%# Eval("image_name") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView> 






       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
           SelectCommand="SELECT [image_name] FROM [Alb_Photo1] WHERE ([alb_id] = @alb_id)">
           <SelectParameters>
               <asp:SessionParameter Name="alb_id" SessionField="albumid" Type="Int64" />
           </SelectParameters>
       </asp:SqlDataSource>






</div>
</asp:Content>

