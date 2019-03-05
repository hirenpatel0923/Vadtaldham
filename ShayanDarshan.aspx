<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="ShayanDarshan.aspx.cs" Inherits="ShayanDarshan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .calender
    {
    	float:right;
    	vertical-align:top;
    }
   
</style>

<script src="lightbox/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="lightbox/lightbox-2.6.min.js" type="text/javascript"></script>
    <link href="lightbox/lightbox.css" rel="stylesheet" type="text/css" />
    <script src="lightbox/modernizr.custom.js" type="text/javascript"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <div style="float:left;">
     <asp:ListView ID="ListView1" runat="server" GroupItemCount="4" 
        GroupPlaceholderID="gp1" ItemPlaceholderID="iph" 
            onselectedindexchanged="ListView1_SelectedIndexChanged" 
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
            <div class="wrapper">
	        <section id="examples" class="section examples-section">
				<a class="example-image-link" href='<%#Eval("image") %>' data-lightbox="example-set" title="Click on the right side of the image to move forward."><img class="example-image" src='<%#Eval("image") %>' alt="Plants: image 1 0f 4 thumb" width="150" height="150"></a>
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
    </div>
 <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%#Eval("image") %>' OnCommand="lnkbtn_Command">Download</asp:LinkButton>
             
        </td>
    </ItemTemplate>
    
    </asp:ListView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         SelectCommand="SELECT [image] FROM [ShayanDarshan] WHERE ([date] = @date)">
         <SelectParameters>
             <asp:SessionParameter Name="date" SessionField="seldate" Type="DateTime" />
         </SelectParameters>
     </asp:SqlDataSource>
    <div id="lightboxOverlay" class="lightboxOverlay" style="width: 1366px; height: 667px; display: none;"></div>
     <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> 
 </div>
       
         <div style="float:right;"><asp:Calendar ID="Calendar1" runat="server" CssClass="calender"
         onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar></div>
  </div>
</asp:Content>

