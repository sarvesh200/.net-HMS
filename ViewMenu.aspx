<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewMenu.aspx.cs" Inherits="ViewMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>Hotel Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

</head>
<body>
    <% Server.Execute("Top.aspx");%>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scr" runat="server" ScriptMode="Release"></asp:ScriptManager>
         <%if (uid != "NA")
             { %>
        <div class="submain" align="center">
        
      <h4 class="tittle">Menu Items</h4>
            <br />
                <asp:GridView ID="GridView1" CssClass="table" runat="server"  AutoGenerateColumns="False" DataKeyNames="menuid" Width="900px" CellPadding="4" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" 
                    OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333"
                     AllowPaging="true" PageIndex="0" PageSize="8">
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:BoundField DataField="menuid" HeaderText="ID" Visible="false" />
                <asp:BoundField DataField="mname" HeaderText="Menu Name" />
                <asp:BoundField DataField="ctg" HeaderText="Menu Category" />
                <asp:BoundField DataField="price" HeaderText="Price" />
              <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                </Columns>

                 <EditRowStyle BackColor="#2461BF" />

                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>
    
   </div>
   
     
     <div class="clearfix"></div>
     
            
            
        <%}
            else {
                Response.Redirect("Invalid.aspx");
            } %>     
        
    </form>
    <br />
      <% Server.Execute("Footer.aspx");%>
</body>
</html>