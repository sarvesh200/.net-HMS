<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Footer.aspx.cs" Inherits="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Hotel Management System</title>
    <link href="css/Custom-Style.css" rel="stylesheet" />
    <link href="css/Home.css" rel="stylesheet" />

</head>
<body>
   <div class="footer">
       <div class="footer-bg" align="center" >
           <%try { %>
           <% if (Session["utyp"].Equals("undefined"))
               {%>
           <ul class="footer_nav">
					<li><a href="Default.aspx" class="active">Home</a></li>
					<li><a href="Login.aspx">Login</a></li>
				
			</ul>
				<h2><a href="Default.aspx" >Hotel Management System</a></h2>
		<%}
            else
            {
            %><h2>Hotel Management System</h2>
           <%}
               }catch(Exception ex) { } %>
           	</div>
			
       </div>
      
</body>
</html>
