﻿<%@ Page Title=""
  Language="C#"
  MasterPageFile="~/Admin Panel/Admin.master"
  AutoEventWireup="true"
  CodeFile="Profiles.aspx.cs"
  Inherits="Admin_Panel_Profiles" %>

<asp:Content ID="Content1"
  ContentPlaceHolderID="AdminPanelhead"
  runat="Server">
</asp:Content>
<asp:Content ID="Content2"
  ContentPlaceHolderID="AdminPanelMaster"
  runat="Server">
  <asp:GridView ID="GridView1"
    runat="server"
    CellPadding="4"
    EnableModelValidation="True"
    ForeColor="#333333"
    GridLines="None"
    AutoGenerateColumns="False"
    DataKeyNames="UserId"
    AutoGenerateDeleteButton="True"
    DataSourceID="SqlDataSource1"
    AllowPaging="True"
    AllowSorting="True">
    <AlternatingRowStyle
      BackColor="White" />
    <Columns>
      <asp:BoundField
        DataField="UserId"
        HeaderText="UserId"
        ReadOnly="True"
        SortExpression="UserId" />
      <asp:BoundField
        DataField="LastUpdatedDate"
        HeaderText="LastUpdatedDate"
        SortExpression="LastUpdatedDate" />
      <asp:BoundField
        DataField="DataSize"
        HeaderText="DataSize"
        ReadOnly="True"
        SortExpression="DataSize" />
      <asp:BoundField DataField="Email" 
        HeaderText="Email" 
        SortExpression="Email" />
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1"
      Font-Bold="True"
      ForeColor="White" />
    <HeaderStyle BackColor="#507CD1"
      Font-Bold="True"
      ForeColor="White" />
    <PagerStyle BackColor="#2461BF"
      ForeColor="White"
      HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle
      BackColor="#D1DDF1"
      Font-Bold="True"
      ForeColor="#333333" />
  </asp:GridView>
  <br />
  <asp:SqlDataSource
    ID="SqlDataSource1"
    runat="server"
    ConnectionString="<%$ ConnectionStrings:HomeConnectionString %>"
    SelectCommand="SELECT vw_aspnet_Profiles.UserId, LastUpdatedDate, DataSize, Email FROM vw_aspnet_Profiles LEFT OUTER JOIN vw_aspnet_MembershipUsers ON vw_aspnet_MembershipUsers.UserId = vw_aspnet_Profiles.UserId"
    DeleteCommand="DELETE FROM [vw_aspnet_Profiles] WHERE UserId = @UserId ">
  </asp:SqlDataSource>
  <br />
  
</asp:Content>