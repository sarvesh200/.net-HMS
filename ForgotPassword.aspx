<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Management System</title>
</head>
<body>
    <form id="form1" runat="server">
        <%Server.Execute("DefaultTop.aspx"); %>
        <center>  <img src="images/home-banner.jpg" height="230"  width="90%" style="background-size: cover;" /></center>
    <div class="main"><br />
           <h3 class="heading">Password Recovery</h3><br />
         <table class="tablestyle" align="center" >
            <tr><td > <img src="images/forgot_pass.png"  height="150"/>  </td> <td valign="top">
    <table style="border-left:1px groove darkblue;padding-left:5px" cellpadding="5" >
   
    <tr>
    <td > User Id</td>
    <td>
        <asp:TextBox ID="txtuid" runat="server" CssClass="textbox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
            ControlToValidate="txtuid" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>   
        <tr>
            <td>
                Secutiy Question</td>
            <td>
                <asp:DropDownList ID="cmbsques" runat="server" CssClass="combo">
                    <asp:ListItem>&lt;--Select--&gt;</asp:ListItem>
                    <asp:ListItem>What is your pet name?</asp:ListItem>
                    <asp:ListItem>What is your favorite  teachers name?</asp:ListItem>
                    <asp:ListItem>What is your hobby?</asp:ListItem>
                    <asp:ListItem>What is your favorite color?</asp:ListItem>
                    <asp:ListItem>What is your mothers name?</asp:ListItem>
                    <asp:ListItem>What is your fathers middle name?</asp:ListItem>
                    <asp:ListItem>What is your favorite food to eat?</asp:ListItem>
                    <asp:ListItem>What is your primary school name?</asp:ListItem>
                    <asp:ListItem>What is your favorite place to visit?</asp:ListItem>
                    <asp:ListItem>What is your favorite animal?</asp:ListItem>
                    <asp:ListItem>What is your zodiac sign?</asp:ListItem>
                    <asp:ListItem>What is your high school name?</asp:ListItem>
                    <asp:ListItem>What is your junior college name?</asp:ListItem>
                    <asp:ListItem>What is your college name?</asp:ListItem>
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="cmbsques" ErrorMessage="*" Font-Bold="True" 
                    ForeColor="Red" Operator="NotEqual" Type="String"  Display="Dynamic"
                    ValueToCompare="&lt;--Select--&gt;"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                Answer</td>
            <td>
                <asp:TextBox ID="txtans" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                    ControlToValidate="txtans" ErrorMessage="*" Font-Bold="True"   
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
       <tr>
    <td colspan="2" align="center">
        <asp:Button ID="btnReg" runat="server" Text="Submit" OnClick="Register" CssClass="button" />
    </td>
           </tr></table></td></tr></table>
    </div>
         <%Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
