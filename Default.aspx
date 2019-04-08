<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Hotel Management System</title>
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
 
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release"></asp:ScriptManager>
        <%Server.Execute("DefaultTop.aspx"); %>
        <div class="main">
            
          <div class="clearfix"></div>
<div id="wowslider-container1">
<div class="ws_images"><ul>
		<li><img src="data1/images/01.jpg" alt="" title="" id="wows1_0"/></li>
		<li><img src="data1/images/bannerindianrestaurants1.jpg" alt="" title="" id="wows1_1"/></li>
		<li><img src="data1/images/bannerindianrestaurants2.jpg" alt="" title="" id="wows1_2"/></li>
		<li><img src="data1/images/bannerindianrestaurants3.jpg" alt="" title="" id="wows1_3"/></li>
		<li><img src="data1/images/diningfoodbanner1920x750.jpg" alt="slider" title="" id="wows1_4"/></li>
		<li><img src="data1/images/jv4fgbmzjerul3.jpg" alt="" title="" id="wows1_5"/></li>
	</ul></div>
	<div class="ws_bullets"><div>
		<a href="#" title=""><span><img src="data1/tooltips/01.jpg" alt=""/>1</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/bannerindianrestaurants1.jpg" alt=""/>2</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/bannerindianrestaurants2.jpg" alt=""/>3</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/bannerindianrestaurants3.jpg" alt=""/>4</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/diningfoodbanner1920x750.jpg" alt=""/>5</span></a>
		<a href="#" title=""><span><img src="data1/tooltips/jv4fgbmzjerul3.jpg" alt=""/>6</span></a>
	</div></div>
<div class="ws_shadow"></div>
</div>	
<script type="text/javascript" src="engine1/wowslider.js"></script>
<script type="text/javascript" src="engine1/script.js"></script>

          <div class="clearfix"></div>
  </div>
        <%Server.Execute("Footer.aspx"); %>
    </form>
</body>
</html>
