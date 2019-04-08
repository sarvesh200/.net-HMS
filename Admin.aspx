<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Management System</title>
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Admin"))
             {
                 Server.Execute("Top.aspx"); %>        
    <div class="submain" align="center">
       <h3 class="heading">View Menu</h3><br />
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
                                  <th>Category</th>
                                  <th>Menu Name</th>                                 
                                  <th>Price</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>     
                              
                             <td><%#Eval("ctg") %></td>
                              <td><%#Eval("mname") %></td>
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
