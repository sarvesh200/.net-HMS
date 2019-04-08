<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StockReport.aspx.cs" Inherits="StockReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%
          if (Session["utyp"].ToString().Equals("Admin") || Session["utyp"].ToString().Equals("Kitchen") || Session["utyp"].ToString().Equals("Stock"))
        {
               Server.Execute("Top.aspx"); %>
        
   <div class="submain" align="center">
        <h3 class="heading">Stock Available Report</h3><br />
       <% if (count == 0)
                 { %>
                            <div class="norecord">No Record Found!</div>
                            <%}
    else
    { %>
              
          <asp:Repeater ID="Repeater1" runat="server">
                      <HeaderTemplate>
                          <table id="rptTable" class="rptable">  
                              <tr>   
                                 
                                  <th>Item Name</th>
                                  <th>Quantity</th>
                                  <th>Price</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>     
                              <td><%#Eval("items") %></td>
                             <td><%#Eval("quantity") %></td>
                              <td><%#Eval("price") %></td>
                                   </tr>
                      </ItemTemplate>
                      <FooterTemplate>
                          </table>
                      </FooterTemplate>
                  </asp:Repeater>
         
            <div id="pageNavPositions" style="padding-top: 10px" align="center"></div>
    <%} %>
             <script type="text/javascript">
        var pager = new Pager('rptTable',7);
        pager.init();
        pager.showPageNav('pager', 'pageNavPositions');
        pager.showPage(1);
    </script>
        </div>
         <%}
                 else { 
                 Response.Redirect("Invalid.aspx", false);
             }Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
