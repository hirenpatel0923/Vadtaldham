<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHomePage.aspx.cs" Inherits="AdminHomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Daily Darshan----------->>  "></asp:Label>
                &nbsp;</td>
                <td>
                &nbsp;
                    
                      <asp:Button ID="DailyInsert" runat="server" Height="25px" 
                          onclick="DailyInsert_Click" Text="DailyInsert" Width="110px" />
&nbsp;<asp:Button ID="DailyDelete" runat="server" Height="26px" onclick="DailyDelete_Click" 
                          Text="DailyDelete" Width="122px" />
                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Shayan Darshan-----------&gt;&gt;"></asp:Label>
                </td>
                <td>
                
                &nbsp;
                            <asp:Button ID="ShayanInsert" runat="server" Text="ShayanInsert" 
                        onclick="ShayanInsert_Click" />
&nbsp;<asp:Button ID="ShayanDelete" runat="server" Text="ShayanDelete" 
                        onclick="ShayanDelete_Click" />
                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" 
                        Text="Desktop Wallpaper-----------&gt;&gt;"></asp:Label>
                </td>
                <td>
                    &nbsp;&nbsp;
                            <asp:Button ID="DeskWallInsert" runat="server" 
                        Text="Desktop Wallpaper Insert" onclick="DeskWallInsert_Click" 
                         />
&nbsp;<asp:Button ID="Deskwalldelete" runat="server" Text="Desktop Wallpaper Delete" onclick="Deskwalldelete_Click" 
                       />
                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" 
                        Text="Mobile Wallpaper-----------&gt;&gt;"></asp:Label>
                </td>
                <td>
                    &nbsp;
                            <asp:Button ID="MobileWallInsert" runat="server" 
                        Text="Mobile Wallpaper Insert" onclick="MobileWallInsert_Click" 
                         />
                    &nbsp;<asp:Button ID="MobileWalldelete" runat="server" 
                        Text="Mobile Wallpaper Delete" onclick="MobileWalldelete_Click" 
                       />
                
                </td>
            </tr>
            <tr>
                 <td>
                    <asp:Label ID="Label5" runat="server" 
                        Text="PhotoGallery-----------&gt;&gt;"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Button ID="PhotoGallInsert" runat="server" Text="PhotoGalleryInsert" 
                        onclick="PhotoGallInsert_Click" />
                    &nbsp;
                    <asp:Button ID="PhotoGalleryDelete" runat="server" Text="PhotoGalleryDelete"  />
                
                </td>
    
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" 
                        Text="Get Feedback-----------&gt;&gt;"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:Button ID="Feedback" runat="server" Text="Click Here For Feedback" 
                        onclick="Feedback_Click"/>
                    &nbsp;
                                    
                </td>
    
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Logout</asp:LinkButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
