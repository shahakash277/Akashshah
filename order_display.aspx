<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_display.aspx.cs" Inherits="order_display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Order Id
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Name
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Quantity
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Price
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
</asp:Content>

