﻿<%@ Page Title=""
  Language="C#"
  MasterPageFile="~/Admin Panel/Admin.master"
  AutoEventWireup="true" %>

<%@ Register Assembly="AjaxControlToolkit"
  Namespace="AjaxControlToolkit"
  TagPrefix="asp" %>
<asp:Content ID="Content1"
  ContentPlaceHolderID="AdminPanelhead"
  runat="Server">
</asp:Content>
<asp:Content ID="Content2"
  ContentPlaceHolderID="AdminPanelMaster"
  runat="Server">
  <p>
    Confirm Order by
    changing status
    to shippingInProcess,
    when Order is confirmed</p>
  <%--LISTING 11.20 ShowCommandField.aspx--%>
  <asp:UpdatePanel
    ID="UpdatePanel1"
    runat="server">
    <ContentTemplate>
      <asp:GridView ID="GridView1"
        runat="server"
        AllowPaging="True"
        AllowSorting="True"
        AutoGenerateColumns="False"
        CellPadding="3"
        DataSourceID="SqlDataSource1"
        DataKeyNames="order_id"
        EnableModelValidation="True"
        ForeColor="Black"
        GridLines="Vertical"
        AutoGenerateEditButton="True"
        AutoGenerateDeleteButton="True"
        BackColor="White"
        BorderColor="#999999"
        BorderStyle="Solid"
        BorderWidth="1px">
        <AlternatingRowStyle
          BackColor="#CCCCCC" />
        <Columns>
          <asp:BoundField
            DataField="order_id"
            HeaderText="order_id"
            InsertVisible="False"
            ReadOnly="True"
            SortExpression="order_id" />
          <asp:BoundField
            DataField="products_title"
            HeaderText="products_title"
            SortExpression="products_title"
            ReadOnly="True" />
          <asp:BoundField
            DataField="O_price"
            HeaderText="O_price"
            SortExpression="O_price"
            ReadOnly="True" />
          <asp:BoundField
            DataField="order_date"
            HeaderText="order_date"
            SortExpression="order_date"
            ReadOnly="True" />
          <asp:BoundField
            DataField="o_status"
            HeaderText="o_status"
            SortExpression="o_status" />
          <asp:BoundField
            DataField="quantities"
            HeaderText="quantities"
            SortExpression="quantities"
            ShowHeader="True"
            ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black"
          Font-Bold="True"
          ForeColor="White" />
        <PagerStyle BackColor="#999999"
          ForeColor="Black"
          HorizontalAlign="Center"
          Font-Size="X-Large" />
        <SelectedRowStyle
          BackColor="#000099"
          Font-Bold="True"
          ForeColor="White" />
      </asp:GridView>
    </ContentTemplate>
  </asp:UpdatePanel>
  <asp:SqlDataSource
    ID="SqlDataSource1"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:HomeConnectionString %>"
    SelectCommand="SELECT [order_id], [products_title], [O_price], [order_date], [o_status], [quantities] FROM [Order_details] WHERE o_status=@o_status"
    UpdateCommand="UPDATE Order_details SET o_status=@o_status WHERE order_id=@order_id"
    DeleteCommand="DELETE FROM Order_details WHERE order_id=@order_id"
    EnableCaching="True">
    <SelectParameters>
      <asp:Parameter DefaultValue="processing"
        Name="o_status"
        Type="String" />
    </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>
