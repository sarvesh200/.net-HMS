<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CookingManager.aspx.cs" Inherits="CookingManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Cook"))
             {
                 Server.Execute("Top.aspx"); %>        
    <div class="submain" align="center">
       <h3 class="heading">Order <span>Food/Dish</span></h3> <br />
         <h4 class="tittle">Add New Order</h4>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
         <table>
             <tr>
                 <td>Customer Name</td>
                 <td>
                     <asp:TextBox ID="txtcustnm" CssClass="textbox" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtcustnm" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                   <br />   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="txtcustnm" ForeColor="Red" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$">Incorrect Name</asp:RegularExpressionValidator>
                 </td>
             </tr>
             <tr>
                 <td>Address</td>
                 <td>
                      <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" CssClass="textarea" Height="40" Width="200"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtaddress" ForeColor="Red"></asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                 <td>Mobile No.</td>
                 <td>
                   <asp:TextBox ID="txtmob" runat="server" MaxLength="10" CssClass="textbox" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtmob" ForeColor="Red"></asp:RequiredFieldValidator><br />
           <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" Display="Dynamic" ControlToValidate="txtmob" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$">Invalid Number</asp:RegularExpressionValidator> </td>
             </tr>
            <tr><td><asp:Button ID="btngo" runat="server" CssClass="button" Text="Go" OnClick="btngo_Click" /> </td>
                <td><asp:Button ID="btncan" runat="server" CssClass="button" Text="Cancel" OnClick="btncan_Click" /> </td>
            </tr>
        </table><br /><br />
         <% if (count == 0)
                { %>
                            <div class="norecord">No Record Found!</div>
                            <%}
    else
    { %>
            <asp:Panel ID="pnl" runat="server" Visible="false">
        <table><tr><td>
            <asp:Repeater ID="Repeater1" runat="server" >
                      <HeaderTemplate>
                          <table id="rptTable" class="rptable">  
                              <tr>
                                  <th>Action</th>
                                  <th>Name</th>
                                  <th>No. Of Dish</th>
                                  <th>Original Price</th>
                                  <th>Price</th>
                                  
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>
                              <td><asp:CheckBox ID="cbRows" runat="server" /></td>
                              <td><asp:Label ID="lblmenu" runat="server" Text='<%# Eval("mname") %>'></asp:Label>
                                   <asp:Label ID="lblmid" runat="server" Text='<%#Eval("menuid") %>' Visible="false"></asp:Label>
                              </td>
                             <td>  
                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                <asp:TextBox ID="txtquantity" runat="server" CssClass="textbox" AutoPostBack="true" OnTextChanged="txtquantity_TextChanged" ></asp:TextBox>
                        
            <br />   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtquantity" runat="server" ForeColor="Red" ValidationExpression="\d+" ErrorMessage="Invalid quantity"></asp:RegularExpressionValidator>
            </ContentTemplate></asp:UpdatePanel>     </td>
                              <td> <asp:Label ID="lblprice" runat="server" Text='<%#Eval("price") %>'></asp:Label></td>
                         <td>                                  
                     <asp:TextBox ID="txtPrice" CssClass="textbox" runat="server" ReadOnly="true"></asp:TextBox>
                       </td>   
                          </tr>
                      </ItemTemplate>
                      <FooterTemplate>
                          </table>
                      </FooterTemplate>
                  </asp:Repeater>
            <div id="pageNavPositions" style="padding-top: 10px" align="center"></div>
            </td></tr>
            <tr><td>
                <asp:Button ID="btnsubmit" runat="server" CssClass="button" Text="Order" OnClick="btnsubmit_Click" />
                          </td></tr></table>
                </asp:Panel>
            <%} %>
     </ContentTemplate></asp:UpdatePanel>
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
