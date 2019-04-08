<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Failure.aspx.cs" Inherits="Failure" %>

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
               {  Server.Execute("DefaultTop.aspx");
                   %>
       <center><img src="images/home-banner.jpg" height="230"  width="80%" style="background-size: cover;"/></center>
        <div class="main">      <%  }
               else
               {%>
    <%Server.Execute("Top.aspx");
                %>
                   <div class="submain">    <%
                      }%>
                  
          <% String home=Request.QueryString["home"]; %>
              <center>
              <table class="tablestyle" align="center"><tr><td><img src="images/TzeenieWheenie_red_green_OK_not_OK_Icons_1.png" width="150" height="150"/></td>
                  <td>
                          <h2  style="color:red"><%=Request.QueryString["err"] %>!!</h2>
                        <a href="<%=home%>">Home</a>
              </td>    </tr></table>
                  </center>
    </div></div>
      <%  }
                  catch (Exception ex) { } %>
    </form>
     <%Server.Execute("Footer.aspx"); %>
</body>
</html>
