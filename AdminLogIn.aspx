<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <asp:Login ID="Login1" runat="server" Height="155px" 
        onauthenticate="Login1_Authenticate" Width="348px">
    </asp:Login>
</div>
</asp:Content>

