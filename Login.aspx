<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Hotel Management System</title>
</head>
<body>
    <form id="form1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release"></asp:ScriptManager>
          <%Server.Execute("DefaultTop.aspx"); %>
         <center><img src="images/home-banner.jpg" height="230"  width="80%" style="background-size: cover;" /></center>
   <div class="main">
       <h3 class="heading">User <span>Login</span></h3><br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
        <table class="tablestyle" width="700px"align="center">
            <tr><td valign="top" ><table cellspacing="7px" cellpadding="7px" style="border-right:1px groove darkblue">
        <tr>
            <td>
               <img src="images/use1.png" width="20" height="20" />
            </td>
            <td>
                <asp:TextBox ID="txtuserid" runat="server" CssClass="textbox"></asp:TextBox>
                
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtuserid">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
               <img src="images/pwd2.png" width="20" height="20" />
            </td>
            <td>
                <asp:TextBox ID="txtpswd" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtpswd">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="button" OnClick="btnsubmit_Click"/>
            </td>
        </tr>
              
                <tr><td colspan="2"><asp:Label ID="lblmsg" runat="server" CssClass="label"></asp:Label></td></tr>
                </table></td><td rowspan="2"  >
                <img src="images/login-round-rotate.png"  height="130"/>
                </td></tr>
            <tr>
                <td colspan="2"><a href="ForgotPassword.aspx">Forgotten Password? Recover</a></td>
            </tr>
    </table>
            </ContentTemplate></asp:UpdatePanel>
          <div class="clearfix"></div>
          </div>
                 <%Server.Execute("Footer.aspx"); %>
 
      
    </form>
</body>
</html>
