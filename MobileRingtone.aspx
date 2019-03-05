<%@ Page Title="" Language="C#" MasterPageFile="~/Database.master" AutoEventWireup="true" CodeFile="MobileRingtone.aspx.cs" Inherits="MobileRingtone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;padding:10px;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="id" DataSourceID="GridviewMR">
                            <Columns>
                                <asp:BoundField DataField="r_name" HeaderText="Ringtone Name" 
                                    SortExpression="r_name" />
                                    <asp:TemplateField HeaderText="Play Online">
                                            <ItemTemplate>
                                        <audio runat="server" id="ad1" controls>
                                            <source src='<%# Eval("r_path") %>' type="audio/mpeg">
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
                        <asp:SqlDataSource ID="GridviewMR" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [MobileRingtone]"></asp:SqlDataSource>
</div>
</asp:Content>

