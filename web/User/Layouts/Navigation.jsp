<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> &nbsp;Menu</button>
  <span class="w3-bar-item w3-right">Logo</span>
</div>
<!--End of Top container -->

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="" class="w3-circle w3-margin-right" style="width:46px">
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>Mike</strong></span><br>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
    </div>
  </div>
  <hr>
  <div class="w3-container text-center py-3">
      <h5><a href='Dashboard' style='text-decoration: none;' class="${nav00}">Dashboard</a></h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    
    <a href="New-Employee" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav01}" style="text-decoration: none"><i class="fa fa-user-tie fa-fw"></i>&nbsp; New Employee</a>
    <a href="Employees" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav02}" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Employees</a>
    <a href="Tasks" class="w3-bar-item w3-button w3-padding w3-hover-blue-gray ${nav03}" style="text-decoration: none"><i class="fa fa-calendar-alt fa-fw"></i>&nbsp; Events</a>
<!--    <div class="w3-dropdown-hover">
    <button class="w3-button" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Employees <i class="fa fa-caret-down"></i></button>
    <div class="w3-dropdown-content w3-bar-block">
      <a href="#" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Managers</a>
      <a href="#" class="w3-bar-item w3-button bg-light" style="text-decoration: none">Workers</a>
    </div>
    </div>-->

<!--    <div class="d-none d-md-block" style="margin-top: 66vh">
        <footer class="w3-container w3-light-grey text-center pt-4 pb-2">
            <p>Copyright © CalEvents 2018</p>
        </footer>
    </div>-->
  </div>
</nav>
<!-- End of Sidebar/menu -->


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>