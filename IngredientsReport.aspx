<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IngredientsReport.aspx.cs" Inherits="IngredientsReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <% if (Session["uid"].ToString() != "undefined")
             {
                 Server.Execute("Top.aspx"); %>        
    <div class="submain" align="center">
       <h3 class="heading">Menu Wise Ingredients Report</h3><br />
       <% if (count == 0)
                 { %>
                            <div class="norecord">No Record Found!</div>
                            <%}
    else
    { %>
              
          <asp:DataList ID="dtlstreport" runat="server" RepeatColumns="2" CellPadding="5" CellSpacing="5" RepeatDirection="Horizontal">
             <ItemTemplate>
                 <div style="border:1px solid #ff6a00;">
                          <table id="rptTable" class="rptable">  
                           
                          <tr>     
                             <th>Category</th>  <td><%#Eval("ctg") %></td></tr>
                          <tr> <th>Menu Name</th>   <td><%#Eval("mname") %></td></tr>
                              <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("menuid") %>'></asp:Label>
                    <tr>    <td colspan="2">
                        <% if (count1 == 0)
                            { %>
                            <div class="norecord">Currently No Ingredients Register!</div>
                            <%}
    else
    { %>
                         <asp:Repeater ID="Repeater1" runat="server">
                      <HeaderTemplate>
                          <table  class="rptable">  
                              <tr>   
                                  <th>Ingredients</th>
                                  <th>Quantity</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>     
                              
                             <td><%#Eval("ingredient") %></td>
                              <td><%#Eval("quantity") %></td>
                                   </tr>
                      </ItemTemplate>
                      <FooterTemplate>
                          </table>
                      </FooterTemplate>
                  </asp:Repeater>
                        <%} %>
                        </td>
                                   </tr>
                              </table></div>
                      </ItemTemplate>                                   
                </asp:DataList>
         
            <div id="pageNavPositions" style="padding-top: 10px" align="center"></div>
    <%} %>
             <script type="text/javascript">
        var pager = new Pager('rptTable',8);
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
