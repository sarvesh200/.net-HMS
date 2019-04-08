<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KitchenManager.aspx.cs" Inherits="KitchenManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="scm" runat="server" ScriptMode="Release"></asp:ScriptManager>
        <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Kitchen"))
             {
                 Server.Execute("Top.aspx"); %>        
    <div class="submain" align="center" >
        <h3 class="heading">Manage Category & Menu</h3>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <table class="tblstyle"><tr><td valign="top"> <h4 class="tittle">Add New Food Category</h4>
            <table> <tr>
                        <td>Category Name</td>
                        <td>
                            <asp:TextBox ValidationGroup="cat" ID="txtCategory" runat="server" CssClass="textbox"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="cat" ControlToValidate="txtCategory" ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1"  ValidationGroup="cat" runat="server" Text="submit" CssClass="button" OnClick="Button1_Click" />
                        </td>
                    </tr></table>
                   </td>
            <td valign="top"> <h4 class="tittle">View Category</h4>
                 <% if (count == 0)
                { %>
                            <div class="norecord">No Record Found!</div>
                            <%}
    else
    { %>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                      <HeaderTemplate>
                          <table id="rptTable" class="rptable">  
                              <tr>
                                  <th>Category Name</th>
                                  <th>Action</th>
                              </tr>
                      </HeaderTemplate>
                      <ItemTemplate>
                          <tr>
                              <td><%# Eval("ctg") %></td>
                              <td><asp:LinkButton ID="LinkButton1" runat="server"  CausesValidation="false" CommandName="edit" CommandArgument='<%# Eval("ctgid")+"|"+ Eval("ctg") %>'>Edit</asp:LinkButton>&nbsp;
                                  <asp:LinkButton ID="lnkbtn" runat="server" CausesValidation="false" CommandName="delete" CommandArgument='<%# Eval("ctgid") %>' OnClientClick="return confirm('are you sure to delete...?')">Delete</asp:LinkButton></td>
                          </tr>
                      </ItemTemplate>
                      <FooterTemplate>
                          </table>
                      </FooterTemplate>
                  </asp:Repeater>
                      <%} %>
       <div id="pageNavPositions" style="padding-top: 20px" align="center"></div>
            </td>
               </tr>
         <tr><td colspan="2"><br />
           <br />
             <h4 class="tittle">Add New Food Menu</h4> <table>
             
             <tr>
                 <td>Select Menu Category</td>
                 <td>
                     <asp:DropDownList CssClass="combo" ID="DDLMenuCat" runat="server"></asp:DropDownList>
                     <asp:RequiredFieldValidator InitialValue="<---Select--->" ControlToValidate="DDLMenuCat" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td>Menu Name</td>
                 <td>
                     <asp:TextBox ID="txtMenu" CssClass="textbox" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtMenu" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                 </td>
             </tr>
            <tr>
                 <td>Item Price</td>
                 <td>
                     <asp:TextBox ID="txtPrice" CssClass="textbox" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtPrice" ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtPrice" runat="server" ForeColor="Red" ValidationExpression="\d+" ErrorMessage="Invalid Price"></asp:RegularExpressionValidator>
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Button ID="Button2" CssClass="button" runat="server" Text="Add Item" OnClick="Button2_Click" />
                 </td>
             </tr>
         </table><br />
             <a href="ViewMenu.aspx">View Menu Details</a>
             </td>
         </tr>
        </table>
                <asp:ModalPopupExtender ID="MPE1"  runat="server" CancelControlID="lnkcancel" 
    TargetControlID="HiddenField1" PopupControlID="mdiv1" BackgroundCssClass="modalpopupBg"></asp:ModalPopupExtender>
 <asp:HiddenField ID="HiddenField1" runat="server" />
       
<div  runat="server" id="mdiv1" style="min-width: 350px; display: none;background-color:whitesmoke">
     
        <table style="width: 100%; border: 1px groove #808080;background-color:white" cellpadding="6" cellspacing="0" align="center">
         <tr><th colspan="2" style="background-color:#d35a04;color:#fff;padding:10px">Manage Category</th></tr>
            <tr><td>Category Name</td><td> <asp:TextBox ID="txtctg" runat="server" ValidationGroup="edit" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator  ControlToValidate="txtctg" ValidationGroup="edit" ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                      </td></tr>
            <tr><td colspan="2">
                <asp:Button ID="Btnctg" runat="server" Text="Submit" ValidationGroup="edit"  CssClass="button"  OnClick="Btnctg_Click"/>
                 <asp:Button ID="lnkcancel" runat="server" Text="Cancel"  CssClass="button"/>
                </td></tr>
            <tr><td>
                <asp:Label ID="Label1" runat="server"  Visible="false"></asp:Label>
                </td></tr>
            </table>
    </div>
        </ContentTemplate></asp:UpdatePanel>
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
