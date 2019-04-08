<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Success" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Hotel Management System</title>
</head>
<body>
    <form id="form1" runat="server">
  <%try
             { %>
           <% if (Session["utyp"].Equals("undefined"))
    {
        Server.Execute("DefaultTop.aspx");
                   %>
     <center>     <img src="images/home-banner.jpg" height="230"  width="80%" style="background-size: cover;" /></center>
        <div class="main"> <%
    }
    else
    {%>
    <%Server.Execute("Top.aspx");%>
                   <div class="submain"> <%} %>   
           <% String home=Request.QueryString["home"]; %>
           <br />
               <table class="tablestyle" align="center"><tr><td><img src="images/success.png" width="120" height="120"/></td>
                  <td>
    <h2 ><%=Request.QueryString["msg"] %> ..!</h2>
                      <br />
                       <a href="<%=home%>">Home</a>
                      </td></tr></table>
               
   </div></div>
        <%     }
                  catch (Exception ex) { } %>
    </form>
     <%Server.Execute("Footer.aspx"); %>
</body>
</html>
