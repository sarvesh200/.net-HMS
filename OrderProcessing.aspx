<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderProcessing.aspx.cs" Inherits="OrderProcessing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Cook"))
             {
                 Server.Execute("Top.aspx"); %>  
        <div class="submain" align="center">
       <h3 class="heading">Order <span>Processing</span></h3> <br />
         <% if (count == 0)
                 { %>
                            <div class="norecord">No Record Found!</div>
                            <%}
    else
    { %>
              
          <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" >
                      <HeaderTemplate>
                          <table id="rptTable" class="rptable">  
                              <tr>   
                                  <th>Customer Name</th>
                                  <th>Item Name</th>
                                  <th>Price</th>
                                  <th>Status</th>
                                  <th>Action</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>     
                              <td><%#Eval("userNm") %></td>
                             <td><%#Eval("menuNm") %></td>
                              <td><%#Eval("totalBill") %></td>
                              <td><%#Eval("sts ") %></td>
                              <td><asp:LinkButton ID="lnk" runat="server" CommandArgument='<%#Eval("orderId")%>' CausesValidation="false">Paid</asp:LinkButton> </td>
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
             <%}else{
            Response.Redirect("Invalid.aspx", false);
        }
             Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
