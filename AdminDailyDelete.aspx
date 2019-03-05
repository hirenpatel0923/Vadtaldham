<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminDailyDelete.aspx.cs" Inherits="AdminDailyDelete" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
                    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <table>   
         <form id="form1" runat="server">
        <div>
            
        
                
             <tr>
                    
                  <td>  
                        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </asp:ToolkitScriptManager>
                 </td>
             </tr>   
             <tr>
                <td>

                    <asp:Label ID="Label1" runat="server" 
                        Text="Enter Date For which You Want to Delete"></asp:Label>

                </td>

                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="TextBox1" runat="server" >
                    </asp:CalendarExtender>
                </td>
             </tr>   
             <tr>
                <td>
                 
                    <asp:Button ID="Button1" runat="server" Height="35px" onclick="Button1_Click" 
                        Text="Delete" Width="109px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
