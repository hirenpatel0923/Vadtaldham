<%@ Page Title="" Language="C#" MasterPageFile="Database.master" AutoEventWireup="true" CodeFile="Book.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Back to the E-magazines</asp:LinkButton>
<center>    <div runat="server" id="bookdiv" data-configid="8920282/4363022" style="width: 525px; height: 525px;" class="issuuembed"></div><script type="text/javascript" src="//e.issuu.com/embed.js" async="true"></script>
</center>
</div>
</asp:Content>

