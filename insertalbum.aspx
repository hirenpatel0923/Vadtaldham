<%@ Page Language="C#" AutoEventWireup="true" CodeFile="insertalbum.aspx.cs" Inherits="insertalbum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 246px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <table class="style1">
            <tr>
                <td class="style2">
                    Album Name</td>
                <td>
                    <asp:TextBox ID="txtalbname" runat="server" Width="248px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" valign="top">
                    Description</td>
                <td>
                    <asp:TextBox ID="txtdesc" runat="server" Height="76px" TextMode="MultiLine" 
                        Width="248px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" valign="top">
                    Date</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                        BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                        ForeColor="Black" Height="194px" NextPrevFormat="FullMonth" Width="350px">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                            VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                            Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Select Photos</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Upload Album" Width="146px" />
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
