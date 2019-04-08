<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Top.aspx.cs" Inherits="Top" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Hotel Management System</title>
    <link href="css/Custom-Style.css" rel="stylesheet" />
    <link href="css/Home.css" rel="stylesheet" />
     <link href="css/table.css" rel="stylesheet" type="text/css" />
    <script src="js/table.js" type="text/javascript"></script>
    <link rel="stylesheet" href="index_files/mbcsmbmcp.css" type="text/css" />
</head>
<body>
<div>
 <div class="headertop"></div> 
  <div class="clearfix"></div>
    
    <div class="col-left">
    <h1><a class="main-header" href="Default.aspx"><span><i>H</i>otel <i>M</i>anagement <i>S</i>ystem</span></a></h1>
   </div>
    <div class="col-right">
 
    <%try { string nm=Session["unm"].ToString();
            string ty=Session["utyp"].ToString();%>

     <div id="mbmcpebul_wrapper">
  <ul id="mbmcpebul_table" class="mbmcpebul_menulist css_menu">
        <% if (Session["utyp"].Equals("Admin"))
            { %>
  <li><div class="buttonbg gradient_button gradient42" style="width: 67px;"><a href="Admin.aspx">Home</a></div></li>  
          <li><div class="arrow buttonbg gradient_button gradient42" style="width:163px;"><a class="button_2">Manage Reports</a></div>
    <ul>
         <li class="gradient_menuitem gradient33"><a title=""  href="IngredientsReport.aspx">Ingredients Report</a></li>
    <li class="gradient_menuitem gradient33 first_item"><a title="" href="StockReport.aspx">Remaining Stock Report</a></li>
    <li class="gradient_menuitem gradient33"><a title=""  href="OrderDetailsReport.aspx">Order Details Report</a></li>
    </ul></li>
    
       <li><div class="buttonbg gradient_button gradient42" style="width: 135px;"><a href="ChangePassword.aspx">Change Password</a></div></li>
          <li><div class="buttonbg gradient_button gradient42" style="width: 80px;"><a href="Logout.aspx">Log Out</a></div></li>
   
        <%}
                 else if (Session["utyp"].Equals("Cook"))
    { %> 
        <li><div class="buttonbg gradient_button gradient42" style="width: 67px;"><a href="CookingManager.aspx">Home</a></div></li>  
                   <li><div class="buttonbg gradient_button gradient42" style="width: 135px;"><a href="ViewMenu.aspx">View Menu</a></div></li>     
      <li><div class="arrow buttonbg gradient_button gradient42" style="width:163px;"><a class="button_2">Orders</a></div>
    <ul>
         <li class="gradient_menuitem gradient33"><a title=""  href="ManageOrders.aspx">Manage Orders</a></li>
   <li class="gradient_menuitem gradient33"><a title=""  href="OrderProcessing.aspx">Order Processing</a></li>
     </ul></li>
             <li><div class="buttonbg gradient_button gradient42" style="width: 135px;"><a href="ChangePassword.aspx">Change Password</a></div></li>
          <li><div class="buttonbg gradient_button gradient42" style="width: 80px;"><a href="Logout.aspx">Log Out</a></div></li>
      <%}
    else if (Session["utyp"].Equals("Kitchen"))
    { %> 
        <li><div class="buttonbg gradient_button gradient42" style="width: 67px;"><a href="KitchenManager.aspx">Home</a></div></li>  
      <li><div class="buttonbg gradient_button gradient42" style="width: 130px;"><a href="MenuWiseIngredient.aspx">Add Ingredients</a></div></li>
        <li><div class="buttonbg gradient_button gradient42" style="width: 135px;"><a href="ViewMenu.aspx">View Menu</a></div></li>     
        <li><div class="arrow buttonbg gradient_button gradient42" style="width:163px;"><a class="button_2">Manage Reports</a></div>
    <ul>
    <li class="gradient_menuitem gradient33 first_item"><a title="" href="StockReport.aspx">Remaining Stock Report</a></li>
    <li class="gradient_menuitem gradient33 first_item"><a title=""  href="OrderDetailsReport.aspx">Order Details Report</a></li>
    </ul></li>
    
      <li><div class="buttonbg gradient_button gradient42" style="width: 135px;"><a href="ChangePassword.aspx">Change Password</a></div></li> 
      <li><div class="buttonbg gradient_button gradient42" style="width: 80px;"><a href="Logout.aspx">Log Out</a></div></li>
    
      <%}
           else if (Session["utyp"].Equals("Stock"))
    { %> 
     <li><div class="buttonbg gradient_button gradient42" style="width: 67px;"><a href="StockManager.aspx">Home</a></div></li>  
        <li><div class="arrow buttonbg gradient_button gradient42" style="width:163px;"><a class="button_2">Manage Reports</a></div>
    <ul>
    <li class="gradient_menuitem gradient33 first_item"><a title="" href="StockReport.aspx">Remaining Stock Report</a></li>
    <li class="gradient_menuitem gradient33 first_item"><a title=""  href="OrderDetailsReport.aspx">Order Details Report</a></li>
    </ul></li>
    
      <li><div class="buttonbg gradient_button gradient42" style="width: 135px;"><a href="ChangePassword.aspx">Change Password</a></div></li>  
      <li><div class="buttonbg gradient_button gradient42" style="width: 80px;"><a href="Logout.aspx">Log Out</a></div></li>
      <%}
         
          else
          {
              Response.Redirect("Invalid.aspx",false);
          }
          %>
  </ul>
</div>
         <script type="text/javascript" src="menu/mbjsmbmcp.js"></script>
   <div class="clearfix"></div>
         <% if (Session["utyp"].Equals("Admin") ||Session["utyp"].Equals("Kitchen") ||Session["utyp"].Equals("Stock") || Session["utyp"].ToString().Equals("Cook"))
                    { %>       <div align="right" class="loginlog-style">Welcome <%=nm%></div>
     </div>   <div align="center"><br /><img src="images/<%=ty %>.jpg" height="220"  width="75%" style="background-size: cover;"/></div>
         <% }else
          {
              Response.Redirect("Invalid.aspx",false);
          }
    
           }
           catch(Exception ex)
           {
               Response.Redirect("Invalid.aspx",false);
           }
%>
 
     <div class="clearfix"></div>
</div>
</body>
</html>
