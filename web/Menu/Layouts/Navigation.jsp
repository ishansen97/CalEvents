<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
  <span class="w3-bar-item w3-right">Logo</span>
</div>
<!--End of Top container -->

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left bg-light" style="z-index:3;width:300px;" id="mySidebar"><br>
<div class="w3-container w3-row">
    <div class="w3-col s4">
        <a href="Profile"><img src="${p_avatar}" class="w3-circle w3-margin-right" style="width:46px"></a>
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>${p_first_name}</strong></span><br>
      <div class='w3-dropdown-hover'>
        <button class='w3-button'><i class='fa fa-cog'></i></button>
        <div class='w3-dropdown-content w3-bar-block w3-border'>
        <a href='/CalEventsMerge01/Logout' class='w3-bar-item w3-button' style='text-decoration: none;'>Logout</a>
	</div>
      </div>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
    </div>
  </div>
  <hr>
  <div class="w3-container bg-light">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    <a href="../Menu/menu.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Menu</a>
   <a href="../Menu/add_item.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-plus-circle fa-fw"></i>&nbsp;Add Menu Item</a> 
   <a href="../Menu/create_menu.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-plus-circle fa-fw"></i>&nbsp;Create Menu</a>
   <a href="../Menu/createdMenus.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-eye fa-fw"></i>&nbsp;Show Created Menu</a>
   <a href="../Menu/Menu_Overview.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-eye fa-fw"></i>&nbsp; Overview</a>
   <a href="../Menu/menuReport.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-eye fa-fw"></i>&nbsp; Report</a>
   
<!--    <div class="w3-dropdown-hover"> 
        <button class="w3-button" style="text-decoration: none"><i class="fa fa-envelope fa-fw"></i>&nbsp; Generate Report <i class="fa fa-caret-down"></i> </button>
        <div class="w3-dropdown-content w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding " style="text-decoration: none"><i class="fa fa-eye fa-fw"></i>&nbsp;Menu Item </a>
<button><a href="#" class="w3-bar-item w3-button w3-padding " style="text-decoration: none">&nbsp; Parameterize </a></button>
<button><a href="#" class="w3-bar-item w3-button w3-padding " style="text-decoration: none">&nbsp; Parameterize </a></button>
<button><a href="#" class="w3-bar-item w3-button w3-padding " style="text-decoration: none">&nbsp; Non - Parameterize </a></button>
<button><a href="#" class="w3-bar-item w3-button w3-padding " style="text-decoration: none">&nbsp; Non - Parameterize </a></button>
        </div> 
    </div>    -->
    <br><br>
  </div>
</nav>
<!-- End of Sidebar/menu -->


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>