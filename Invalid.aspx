<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invalid.aspx.cs" Inherits="Invalid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Hotel Management System</title>
</head>
<body>
       <%Server.Execute("DefaultTop.aspx"); %>
    <form id="form1" runat="server">
      <center>      <img src="images/home-banner.jpg" height="230"  width="80%" style="background-size: cover;" /></center>
    <div class="main"  >
         
      <table cellspacing="25" cellpadding="25" align="center" class="tablestyle"><tr><td>
        <img  src="images/error.png"  height="150" width="150"/>
      </td><td>
              <h2>Sorry...Session Expired!!</h2><br />
        <a href="Login.aspx">Login Again</a>
         </td> </tr></table>
    </div>
    </form>
      <%Server.Execute("Footer.aspx"); %>
</body>
</html>
