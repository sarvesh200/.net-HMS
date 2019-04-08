<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Hotel Management System</title>
   
</head>
<body>
     <%Server.Execute("DefaultTop.aspx"); %>
    <form id="form1" runat="server">
       <center>    <img src="images/home-banner.jpg" height="230"  width="80%" style="background-size: cover;" /></center>
    <div class="main">
   
         <table cellspacing="20" cellpadding="20" align="center" class="tablestyle"><tr><td>
        <img  src="images/forgot-password-icon-18353.png" width="200" height="200" />
      </td><td>
        <h2> You are Logged out Successfully!!</h2><br />
          <h4>
<a href="Default.aspx">Home</a></h4>
      </td></tr></table>
    </div>
  
    </form>
     <%Server.Execute("Footer.aspx"); %>
</body>
</html>
