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
      <img class="w3-circle w3-margin-right" style="width:46px; height: 46px; background: gray">
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>Mike</strong></span><br>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block" id="w3-nav-buttons">
    <a href="./" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-bar-chart-o fa-fw"></i>&nbsp; Overview</a>
    <a href="./payments.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-users fa-fw"></i>&nbsp; Payments</a>
    <a href="./payment_test.jsp" class="w3-bar-item w3-button w3-padding" style="text-decoration: none"><i class="fa fa-users-cog fa-fw"></i>&nbsp; Expenses</a>
  </div>
</nav>
<!-- End of Sidebar/menu -->


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>