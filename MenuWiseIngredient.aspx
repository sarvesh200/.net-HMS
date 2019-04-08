<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MenuWiseIngredient.aspx.cs" Inherits="MenuWiseIngredient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <% if (Session["uid"].ToString() != "undefined" && Session["utyp"].ToString().Equals("Kitchen"))
             {
                 Server.Execute("Top.aspx"); %>        
    <div class="submain" align="center" >
        <h3 class="heading">Add Menu Wise Ingredient</h3>
       <br /><a href="IngredientsReport.aspx" >View Ingredients</a>
        <div class="clearfix"></div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <table class="tblstyle"><tr><td>Select Menu</td> <td>
                     <asp:DropDownList CssClass="combo" ID="ddlmenu" runat="server"></asp:DropDownList>
                     <asp:RequiredFieldValidator ControlToValidate="ddlmenu" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                 </td></tr>
             <tr><td>Select No. of Ingredients</td>
                    <td>
                     <asp:TextBox ID="txtIngr" CssClass="textbox" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ControlToValidate="txtIngr" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtIngr" runat="server" ForeColor="Red" ValidationExpression="\d+" ErrorMessage="Only Integer are allowed"></asp:RegularExpressionValidator>
                 </td></tr>
              <tr>  <td colspan="2" align="center">
                                    <asp:Button ID="btngo" runat="server" Text="Go" CssClass="button" OnClick="btngo_Click"/>
                        <asp:Button ID="btncancel" runat="server" CausesValidation="false" Text="Cancel" CssClass="button" OnClick="btncancel_Click"/>
                                </td></tr>
            <tr><td colspan="2">
                <asp:Panel ID="dynamicPanel" runat="server" Visible="false">
                    <asp:Repeater ID="rptdetails" runat="server">
                                    <HeaderTemplate>
                                        <table class="rptable">
                                              <tr>
                                                  <th>Ingredients</th>
                                                <th>Quantity</th> 
                                                  <th>Units</th>
                                            </tr>
                                   </HeaderTemplate>
                                    <ItemTemplate>
                                         <tr>
                  <td>
                     <asp:DropDownList CssClass="combo" ID="ddlingre" runat="server"></asp:DropDownList>
                       <asp:RequiredFieldValidator InitialValue="<---Select--->" ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="ddlingre">*</asp:RequiredFieldValidator>
                  </td>
                  <td>                     
                <asp:TextBox ID="txtquantity" runat="server" CssClass="textbox" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtquantity">*</asp:RequiredFieldValidator>
             </td>
                                             <td>
            <asp:DropDownList CssClass="combo" ID="ddlunits" runat="server">
                <asp:ListItem><---Select---></asp:ListItem> <asp:ListItem>gram</asp:ListItem><asp:ListItem>kg</asp:ListItem><asp:ListItem>quintal</asp:ListItem>
                           <asp:ListItem>tones</asp:ListItem><asp:ListItem>liter</asp:ListItem><asp:ListItem>mililiter</asp:ListItem> </asp:DropDownList>
                     <asp:RequiredFieldValidator InitialValue="<---Select--->" ControlToValidate="ddlunits" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                               </td>
                  </tr>
                                        </ItemTemplate></asp:Repeater>
                    <br />
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnsubmit_Click" />
                </asp:Panel>
                </td></tr>
        </table>
            
            </ContentTemplate></asp:UpdatePanel>
        </div>
         <%}else{
            Response.Redirect("Invalid.aspx", false);
        }
             Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
