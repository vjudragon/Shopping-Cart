﻿<%@ Page Title="MobileShop1234.com One Way to Shopping Mobiles and Accessories."
  Language="C#"
  MasterPageFile="~/Shoping.master"
  AutoEventWireup="true" %>

<%@ Register Assembly="AjaxControlToolkit"
  Namespace="AjaxControlToolkit"
  TagPrefix="asp" %>
<asp:Content ID="HomeHead"
  ContentPlaceHolderID="ShoppingMasterHead"
  runat="Server">
</asp:Content>
<asp:Content ID="HomeBody"
  runat="server"
  ContentPlaceHolderID="ContentPlaceHolder1">
  <asp:UpdatePanel
    ID="UpdatePanel1"
    runat="server">
    <ContentTemplate>
      <asp:ListView ID="listviewHome"
        runat="server"
        DataKeyNames="prod_id"
        DataSourceID="homesql"
        EnableModelValidation="True"
        GroupItemCount="3">
        <AlternatingItemTemplate>
          <td id="Td1" runat="server"
            class="itemTemplate">
            <asp:ImageButton
              ID="ImageButton1"
              runat="server"
              ImageUrl='<%# Eval("prod_img1") %>'
              PostBackUrl='<%# Eval("prod_id","~/product-details.aspx?prod_id={0}" ) %>'
              Height="150" Width="80" />
            <br />
            <asp:Label ID="prod_idLabel"
              runat="server"
              Text='<%# Eval("prod_id") %>'
              Visible="False" />
            <asp:HyperLink ID="HyperLink1"
              runat="server"
              Text='<%# Eval("prod_title") %>'
              NavigateUrl='<%# Eval("prod_id","~/product-details.aspx?prod_id={0}" ) %>'
              Target="_self"
              Font-Underline="False"></asp:HyperLink>
            <asp:Label ID="Label1"
              runat="server"
              Text='<%# Eval("prod_features") %>' />
            Price: Rs.
            <asp:Label ID="O_priceLabel"
              runat="server"
              Text='<%# Eval("O_price", "{0:N0}") %>' />
            <br />
            <br />
          </td>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
          <table id="Table1"
            runat="server"
            style="">
            <tr>
              <td>
                No data was returned.
              </td>
            </tr>
          </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
          <td id="Td2" runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
          <tr id="itemPlaceholderContainer"
            runat="server">
            <td id="itemPlaceholder"
              runat="server">
            </td>
          </tr>
        </GroupTemplate>
        <ItemTemplate>
          <td id="Td1" runat="server"
            class="itemTemplate">
            <asp:ImageButton
              ID="ImageButton1"
              runat="server"
              ImageUrl='<%# Eval("prod_img1") %>'
              PostBackUrl='<%# Eval("prod_id","~/product-details.aspx?prod_id={0}" ) %>'
              Height="150" Width="80" />
            <br />
            <asp:Label ID="prod_idLabel"
              runat="server"
              Text='<%# Eval("prod_id") %>'
              Visible="False" />
            <asp:HyperLink ID="HyperLink1"
              runat="server"
              Text='<%# Eval("prod_title") %>'
              NavigateUrl='<%# Eval("prod_id","~/product-details.aspx?prod_id={0}" ) %>'
              Target="_self"
              Font-Underline="False"></asp:HyperLink>
            <asp:Label ID="Label1"
              runat="server"
              Text='<%# Eval("prod_features") %>' />
            Price: Rs.
            <asp:Label ID="O_priceLabel"
              runat="server"
              Text='<%# Eval("O_price", "{0:N0}") %>' />
            <br />
            <br />
          </td>
        </ItemTemplate>
        <LayoutTemplate>
          <table id="Table2"
            runat="server">
            <tr id="Tr1" runat="server">
              <td id="Td3" runat="server">
                <table id="groupPlaceholderContainer"
                  runat="server"
                  class="homeItems">
                  <tr id="groupPlaceholder"
                    runat="server"
                    class="homeItems">
                  </tr>
                </table>
              </td>
            </tr>
            <tr id="Tr2" runat="server">
              <td id="Td4" runat="server"
                style="">
                <asp:DataPager ID="DataPager1"
                  runat="server"
                  PageSize="6">
                  <Fields>
                    <asp:NextPreviousPagerField
                      ButtonType="Button"
                      ShowFirstPageButton="True"
                      ShowLastPageButton="True" />
                  </Fields>
                </asp:DataPager>
              </td>
            </tr>
          </table>
        </LayoutTemplate>
      </asp:ListView>
    </ContentTemplate>
  </asp:UpdatePanel>
  <asp:SqlDataSource
    ID="homesql" runat="server"
    ConnectionString="<%$ ConnectionStrings:HomeConnectionString %>"
    SelectCommand="SELECT TOP 50 [prod_id], [category], [prod_title], [prod_features], [O_price], [prod_img1] FROM [Product_Details]"
    FilterExpression="category LIKE '{0}%'"
    EnableCaching="True">
    <FilterParameters>
      <asp:QueryStringParameter
        Name="category"
        QueryStringField="category" />
    </FilterParameters>
  </asp:SqlDataSource>
</asp:Content>
