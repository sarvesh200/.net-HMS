<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageOrders.aspx.cs" Inherits="ManageOrders" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="scm" runat="server" ScriptMode="Release"></asp:ToolkitScriptManager>
        <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Cook"))
             {
                 Server.Execute("Top.aspx"); %>  
        <div class="submain" align="center">
       <h3 class="heading">Manage <span>Orders</span></h3> <br />
            <asp:UpdatePanel ID="upd" runat="server" ><ContentTemplate>
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
                                  <th>No. Of Dish</th>
                                  <th>Price</th>
                                  <th>Action</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>     
                              <td><%#Eval("userNm") %></td>
                             <td><%#Eval("mname") %></td>
                              <td><%#Eval("noofdish") %></td>
                              <td><%#Eval("totalPrice ") %></td>
                              <td><asp:LinkButton ID="lnk" runat="server" CommandArgument='<%#Eval("orderId")+"|"+Eval("menuid")+"|"+Eval("noofdish")%>' CausesValidation="false">Manage</asp:LinkButton> </td>
                          </tr>
                      </ItemTemplate>
                      <FooterTemplate>
                          </table>
                      </FooterTemplate>
                  </asp:Repeater>
         
            <div id="pageNavPositions" style="padding-top: 10px" align="center"></div>
    <%} %>
          
             <asp:ModalPopupExtender ID="MPE1"  runat="server" CancelControlID="lnkcancel" 
    TargetControlID="HiddenField1" PopupControlID="mdiv1" BackgroundCssClass="modalpopupBg"></asp:ModalPopupExtender>
 <asp:HiddenField ID="HiddenField1" runat="server" />
       
<div  runat="server" id="mdiv1" style="min-width: 350px; display: none;background-color:whitesmoke">
     
        <table style="width: 100%; border: 1px groove #808080;background-color:white" cellpadding="6" cellspacing="0" align="center">
         <tr><th colspan="2" style="background-color:#ff6a00;padding:10px"></th></tr>
            <tr><td>No. Of Dish</td><td> <asp:TextBox ID="txtnoofdish" runat="server" CssClass="textbox" ReadOnly="true"></asp:TextBox></td></tr>
           <tr><td>No. of Dish Cooked</td><td><asp:TextBox ID="txtdishcook" runat="server" CssClass="textbox" AutoPostBack="true" OnTextChanged="txtdishcook_TextChanged"></asp:TextBox></td></tr>
            <tr><td>No. of Remains</td><td><asp:TextBox ID="txtremains" runat="server" CssClass="textbox" ReadOnly="true"></asp:TextBox></td></tr>
            <tr><td colspan="2">
                <asp:Button ID="btn" runat="server" Text="Submit"  CssClass="button" OnClick="btn_Click"/>
                 <asp:Button ID="lnkcancel" runat="server" Text="Cancel"  CssClass="button"/>
                </td></tr>
            <tr><td>
                <asp:Label ID="Label1" runat="server"  Visible="false"></asp:Label>
                <asp:Label ID="Label2" runat="server"  Visible="false"></asp:Label>
                </td></tr>
            </table>
    </div>
                  
                  <script type="text/javascript">
        var pager = new Pager('rptTable',7);
        pager.init();
        pager.showPageNav('pager', 'pageNavPositions');
        pager.showPage(1);
    </script>
                </ContentTemplate></asp:UpdatePanel>
        </div>
             <%}else{
            Response.Redirect("Invalid.aspx", false);
        }
             Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
