<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminMobileInsert.aspx.cs" Inherits="AdminMobileInsert" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <table border=1>
    
    <form id="form1" runat="server">
    <div>
        <tr>
            <td>
            <asp:toolkitscriptmanager ID="Toolkitscriptmanager1" runat="server"></asp:toolkitscriptmanager>
            </td>
         </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Enter Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1">
                    </asp:CalendarExtender>
                
                </td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="161px" Width="227px" />
                </td>
            </tr>
            <tr>
                <td>
                       
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Upload" />
                       
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Finish" onclick="Button2_Click" />
                </td>

            </tr>
          <tr>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Logout</asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Home</asp:LinkButton>
            </td>

          </tr>

    </div>
    </form>

    </table>
</body>
</html>
