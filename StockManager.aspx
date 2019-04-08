<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StockManager.aspx.cs" Inherits="StockManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Management System</title>
   
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="scm" runat="server" ScriptMode="Release"></asp:ScriptManager>
     <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Stock"))
             {
                 Server.Execute("Top.aspx"); %>        
    <div class="submain" align="center" >
        <h3 class="heading">Manage Stock</h3>
        <br />
        <table class="tblestyle"><tr><td valign="top">
         <h4 class="tittle">Add New Stock</h4> <table>
            
             <tr>
                 <td>Items Name</td>
                 <td>
                     <asp:TextBox ID="txtitem" CssClass="textbox" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtitem" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr><td>Quantity</td> <td>                     
                <asp:TextBox ID="txtquantity" runat="server" CssClass="textbox" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtquantity">*</asp:RequiredFieldValidator>
                
                <br />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtquantity" runat="server" ForeColor="Red" ValidationExpression="\d+" Display="Dynamic" ErrorMessage="Only Nos. are allowed"></asp:RegularExpressionValidator>
            </td></tr>
             <tr><td>Units</td><td>
            <asp:DropDownList CssClass="combo" ID="ddlunits" runat="server">
                <asp:ListItem><---Select---></asp:ListItem> <asp:ListItem>gram</asp:ListItem><asp:ListItem>kg</asp:ListItem><asp:ListItem>quintal</asp:ListItem>
                           <asp:ListItem>tones</asp:ListItem><asp:ListItem>liter</asp:ListItem> </asp:DropDownList>
                     <asp:RequiredFieldValidator InitialValue="<---Select--->" ControlToValidate="ddlunits" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                               </td></tr>
            <tr>
                 <td>Total Price</td>
                 <td>
                     <asp:TextBox ID="txtPrice" CssClass="textbox" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtPrice" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtPrice" runat="server" ForeColor="Red" ValidationExpression="\d+" ErrorMessage="Invalid Price"></asp:RegularExpressionValidator>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Button ID="btnsubmit" CssClass="button" runat="server" Text="Add Item" OnClick="btnsubmit_Click"/>
                 </td>
             </tr>
         </table></td><td valign="top"> <h4 class="tittle">View Stock</h4> 
    
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
                                  <th>Name</th>
                                  <th>Quantity</th>
                                  <th>Price</th>
                                  <th>Action</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>
                              <td><%# Eval("items") %></td>
                             <td><%# Eval("quantity") %></td>
                              <td><%#Eval("price") %></td>
                                <td><asp:LinkButton ID="LinkButton1" runat="server"  CausesValidation="false" CommandName="edit" CommandArgument='<%# Eval("id")+"|"+ Eval("items")+"|"+ Eval("quantity")+"|"+ Eval("price")  %>'>Edit</asp:LinkButton>&nbsp;
                                    <asp:LinkButton ID="lnkbtn" runat="server" CausesValidation="false" CommandName="delete" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('are you sure to delete...?')">Delete</asp:LinkButton></td>
                          </tr>
                      </ItemTemplate>
                      <FooterTemplate>
                          </table>
                      </FooterTemplate>
                  </asp:Repeater>
            <%} %>
       <div id="pageNavPositions" style="padding-top: 20px" align="center"></div>
             </td></tr></table>
         
            <asp:ModalPopupExtender ID="MPE1"  runat="server" CancelControlID="lnkcancel" 
    TargetControlID="HiddenField1" PopupControlID="mdiv1" BackgroundCssClass="modalpopupBg"></asp:ModalPopupExtender>
 <asp:HiddenField ID="HiddenField1" runat="server" />
       
<div  runat="server" id="mdiv1" style="min-width: 350px; display: none;background-color:whitesmoke">
     
        <table style="width: 100%; border: 1px groove #808080;background-color:white" cellpadding="6" cellspacing="0" align="center">
         <tr><th colspan="2" style="background-color:#d35a04;color:#fff;padding:10px">Manage Stock</th></tr>
            <tr>
                 <td>Items Name</td>
                 <td>
                     <asp:TextBox ID="txtitmnm" CssClass="textbox" runat="server" ValidationGroup="edit"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtitmnm" ValidationGroup="edit" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr><td>Quantity</td> <td>                     
                <asp:TextBox ID="txtqua" runat="server" CssClass="textbox" ValidationGroup="edit"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="edit" ControlToValidate="txtqua">*</asp:RequiredFieldValidator>
                
                <br />
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtqua" runat="server" ForeColor="Red" ValidationExpression="\d+" ValidationGroup="edit" Display="Dynamic" ErrorMessage="Only Nos. are allowed"></asp:RegularExpressionValidator>
            </td></tr>
             <tr><td>Units</td><td>
            <asp:DropDownList CssClass="combo" ID="ddluni" runat="server" ValidationGroup="edit">
                <asp:ListItem><---Select---></asp:ListItem> <asp:ListItem>gram</asp:ListItem><asp:ListItem>kg</asp:ListItem><asp:ListItem>quintal</asp:ListItem>
                           <asp:ListItem>tones</asp:ListItem><asp:ListItem>liter</asp:ListItem> </asp:DropDownList>
                     <asp:RequiredFieldValidator InitialValue="<---Select--->" ValidationGroup="edit" ControlToValidate="ddluni" ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                               </td></tr>
            <tr>
                 <td>Total Price</td>
                 <td>
                     <asp:TextBox ID="txtpri" CssClass="textbox" runat="server" ValidationGroup="edit"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtpri" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="edit"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtpri" runat="server" ForeColor="Red" ValidationExpression="\d+" ErrorMessage="Invalid Price" ValidationGroup="edit"></asp:RegularExpressionValidator>
                 </td>
             </tr>
            <tr><td colspan="2">
                <asp:Button ID="Btnctg" runat="server" Text="Submit" ValidationGroup="edit"  CssClass="button"  OnClick="Btnctg_Click"/>
                 <asp:Button ID="lnkcancel" runat="server" Text="Cancel"  ValidationGroup="edit"  CssClass="button"/>
                </td></tr>
            <tr><td>
                <asp:Label ID="Label1" runat="server"  Visible="false"></asp:Label>
                </td></tr>
            </table>
    </div>

                <script type="text/javascript">
        var pager = new Pager('rptTable',5);
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
