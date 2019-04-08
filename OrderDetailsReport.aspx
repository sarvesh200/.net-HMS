<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetailsReport.aspx.cs" Inherits="OrderDetailsReport" %>

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
        <h3 class="heading">Orders Transaction Report</h3><br />

       <b>Select Month</b> <asp:DropDownList ID="ddlmon" runat="server" CssClass="combo" ></asp:DropDownList>
        <b>Select Year</b> <asp:DropDownList ID="ddlyr" runat="server" CssClass="combo" ></asp:DropDownList>
       <br /><asp:Button ID="Btngo" runat="server" Text="Go" OnClick="Btngo_Click" CssClass="button" />
                <br />

       <% if (count == 0)
                 { %>
                            <div class="norecord">No Record Found!</div>
                            <%}
    else
    { %><br />
         <asp:DataList ID="rptbill" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10">
             
           <ItemTemplate>  <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("orderId") %>'></asp:Label>            
                <table   class="rptable">
                 <tr><th colspan="5"><%#Eval("userNm")%></th></tr>
                    <tr><td colspan="5">
                      <asp:Repeater ID="rpttotal" runat="server" >
                         <HeaderTemplate><tr style="font-weight:bold;color:black"><td>Menu name</td>
                             <td>Date</td><td>No. of dish</td>
                       <td>Price</td></tr>
                             <tr><td colspan="5" ><hr /></td></tr>
                         </HeaderTemplate>
                    <ItemTemplate>
                       
                    
                          <tr><td><%#Eval("mname") %></td>
                                <td><%#Eval("dayy") %>/<%#Eval("mont") %>/<%#Eval("yr") %></td>
                       <td><%#Eval("noofdish") %></td>
                       <td><%#Eval("totalPrice") %></td>
                                          
                   </tr>         
            
                </ItemTemplate></asp:Repeater>
                        </td></tr>
                    <tr><td colspan="5" ><hr /></td></tr>
                    <tr><td colspan="5" style="font-weight:bold;color:black">
            
                    <tr><td colspan="3"><b>Total Bill</b></td><td><b><%#Eval("totalBill") %></b></td>                      
                   </tr> 
                     <tr><td colspan="3"><b>Payment Status</b></td><td><b><%#Eval("sts") %></b></td>   </tr>
                </td></tr>

                   </table>
                </ItemTemplate>   
             
         </asp:DataList>
     
           
       <div id="pageNavPositions" style="padding-top: 10px" align="center"></div>
  <%} %>
         
            
   
             <script type="text/javascript">
        var pager = new Pager('rptTable',1);
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
