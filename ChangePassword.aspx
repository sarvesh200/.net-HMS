<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Hotel Management System</title>
</head>
<body>
    <form id="form1" runat="server">
       <%
          if (Session["utyp"].ToString().Equals("Admin") || Session["utyp"].ToString().Equals("Kitchen") || Session["utyp"].ToString().Equals("Stock") || Session["utyp"].ToString().Equals("Cook"))
        {
               Server.Execute("Top.aspx"); %>
        
   <div class="submain">
        <h3 class="heading">Change Password</h3><br />

     <table class="tablestyle" align="center" cellpadding="10px" >
            <tr><td >    
      <img src="images/change-password-img.png"  height="150"/>
                     </td>
                <td valign="top">
                     <table cellspacing="5px" cellpadding="7px">
 
    <tr>
        <td>Current Password</td>
        <td><asp:TextBox ID="opass"  TextMode="Password" runat="server"  CssClass="textbox" ></asp:TextBox>&nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator2" runat="server" ControlToValidate="opass"  ForeColor="red" Display="Dynamic"
                ErrorMessage="*"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td>New Password</td>
        <td> <asp:TextBox ID="npass"   CssClass="textbox" runat="server" autocomplete="off" TextMode="Password"/>
            &nbsp;<asp:RequiredFieldValidator 
                ID="RequiredFieldValidator3" runat="server" ControlToValidate="npass" Display="Dynamic"
                ErrorMessage="*"  ForeColor="red"></asp:RequiredFieldValidator>
        </td></tr>
                         
    <tr>
        <td>Confirm Password</td> 
        <td><asp:TextBox ID="rpass"  TextMode="Password" runat="server" CssClass="textbox"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator   ForeColor="red"
                ID="RequiredFieldValidator4" runat="server" ControlToValidate="rpass" Display="Dynamic"
                ErrorMessage="*"></asp:RequiredFieldValidator><br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic"
                ControlToCompare="npass" ControlToValidate="rpass" ForeColor="Red"
                ErrorMessage="Passwords Mismatched" SetFocusOnError="true" ></asp:CompareValidator>
        </td>
    </tr>  <tr><td colspan="2">
     <asp:RegularExpressionValidator ID="RegExp1" runat="server" Display="Dynamic"   
ErrorMessage="Password must be 8 characters including 1 uppercase letter, 1 special character, 1 lowercase characters and 1 digit" ForeColor="Red"
ControlToValidate="npass"    
ValidationExpression="^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$"/>
                </td>
   </tr>
                          <tr>
        <td colspan="2" align="center">
            <asp:Button ID="btnchange" runat="server" Text="Submit"   CssClass="button" OnClick="btnchange_Click"
                /></td>
         
    </tr></table>
                </td>
            </tr></table>
    
    </div>
         <%}
                 else { 
                 Response.Redirect("Invalid.aspx", false);
             }Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
