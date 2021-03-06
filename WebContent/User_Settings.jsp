<!DOCTYPE html>
<html>

<head>
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <title>Madeline_User</title>
  <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
  <meta name="description" content="AdminDesigns - A Responsive HTML5 Admin UI Framework">
  <meta name="author" content="AdminDesigns">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font CSS (Via CDN) -->
  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

  <!-- Admin Forms CSS -->
  <link rel="stylesheet" type="text/css" href="assetsAd/admin-tools/admin-forms/css/admin-forms.css">

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="assetsAd/skin/default_skin/css/theme.css">

  <!-- Favicon -->
  <link rel="shortcut icon" href="assetsAd/img/favicon.ico">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

</head>
<script type="text/javascript">
function readUser(message){
	if(message!=null&&message!=""){
		alert(message);
	}
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var user;
			var json = xmlhttp.responseText;
// 			alert(json);
			json = "[" + json + "]";
			user = eval(json);
			document.getElementById("user.userid").value = user[0].userid;
			document.getElementById("user.username").value = user[0].username;
			document.getElementById("user.userpassword").value = user[0].userpassword;
			document.getElementById("user.username").value = user[0].username==undefined?"":user[0].username;
			document.getElementById("user.email").value = user[0].email==undefined?"":user[0].email;
			document.getElementById("user.phone").value = user[0].phone==undefined?"":user[0].phone;
			document.getElementById("user.firstname").value = user[0].firstname==undefined?"":user[0].firstname;
			document.getElementById("user.lastname").value = user[0].firstname==undefined?"":user[0].lastname;
			document.getElementById("user.description").value = user[0].description==undefined?"":user[0].description;
			document.getElementById("user.hobby").value = user[0].hobby==undefined?"":user[0].hobby;
		}
	};
	xmlhttp.open("POST", "userSearch", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	var userID = '${session.user.userid}';
	xmlhttp.send("userID="+userID);
}

function modify(){
	document.userModify.submit();
}
</script>

<body class="ecommerce-page" onLoad="readUser('${message}')">

  <!-- Start: Theme Preview Pane -->
  
  <!-- End: Theme Preview Pane -->

  <!-- Start: Main -->
  <div id="main">

    <!-- Start: Header -->
    
     <header class="navbar navbar-fixed-top navbar-shadow">
      <div class="navbar-branding">
        <a class="navbar-brand" href="index.html">
          <b>Madeline</b>User
        </a>
        <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
      </div>
      <ul class="nav navbar-nav navbar-left">
        <li class="dropdown menu-merge hidden-xs">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
            <span class="caret caret-tp"></span>
          </a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
        <li class="hidden-xs">
          <a class="request-fullscreen toggle-active" href="#">
            <span class="ad ad-screen-full fs18"></span>
          </a>
        </li>
      </ul>
      <form class="navbar-form navbar-left navbar-search alt" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search..." value="Search...">
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li>
        
        </li>
        <li class="dropdown menu-merge">
          <div class="navbar-btn btn-group">
            <button data-toggle="dropdown" class="btn btn-sm dropdown-toggle">
              <span class="fa fa-bell-o fs14 va-m"></span>
              <span class="badge badge-danger">9</span>
            </button>
            <div class="dropdown-menu dropdown-persist w350 animated animated-shorter fadeIn" role="menu">  
              <div class="panel mbn">
                  <div class="panel-menu">
                     <span class="panel-icon"><i class="fa fa-clock-o"></i></span>
                     <span class="panel-title fw600"> Recent Activies</span>
                     <button class="btn btn-default light btn-xs pull-right" type="button"><i class="fa fa-refresh"></i></button>
                  </div>
                  <div class="panel-body panel-scroller scroller-navbar scroller-overlay scroller-pn pn">
                      <ol class="timeline-list">
                        <li class="timeline-item">
              <div class="timeline-icon bg-dark light">
                <span class="fa fa-tags"></span>
              </div>
              <div class="timeline-desc">
                <b>Admin</b> approved your memory:
                <a href="#">Memory</a>
              </div>
              <div class="timeline-date">1:25am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-dark light">
                <span class="fa fa-tags"></span>
              </div>
              <div class="timeline-desc">
                <b>Sara</b> left a comment on your memory:
                <a href="#">Memory</a>
              </div>
              <div class="timeline-date">3:05am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-success">
                <span class="fa fa-user"></span>
              </div>
              <div class="timeline-desc">
                <b>Admin</b> discarded your memory:
                <a href="#">Artefact</a>
              </div>
              <div class="timeline-date">4:15am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-warning">
                <span class="fa fa-pencil"></span>
              </div>
              <div class="timeline-desc">
                <b>Laura</b> left a comment and rated your memory:
                <a href="#">Memory</a>
              <div class="timeline-date">5:25am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-success">
                <span class="fa fa-user"></span>
              </div>
              <div class="timeline-desc">
                <b>Admin</b> approved your memory:
                <a href="#">Artefact</a>
              </div>
              <div class="timeline-date">7:45am</div>
            </li>
                      </ol>
       
                  </div>
                  <div class="panel-footer text-center p7">
                    <a href="#" class="link-unstyled"> View All </a>
                  </div>
              </div>
            </div>
          </div>
        </li>
        
        <li class="dropdown menu-merge">
          <div class="navbar-btn btn-group">
            
          
          </div>
        </li>
        <li class="menu-divider hidden-xs">
          <i class="fa fa-circle"></i>
        </li>
        <li class="dropdown menu-merge">
          <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
            <img src="assetsAd/img/avatars/2.jpg" alt="avatar" class="mw30 br64">
            <span class="hidden-xs pl15"> ${session.user.username} </span>
            <span class="caret caret-tp hidden-xs"></span>
          </a>
          <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
            <li class="dropdown-header clearfix">
              <div class="pull-left ml10">
                <select id="user-status">
                  <optgroup label="Current Status:">
                    <option value="1-1">Away</option>
                    <option value="1-2">Offline</option>
                    <option value="1-3" selected="selected">Online</option>
                  </optgroup>
                </select>
              </div>

              <div class="pull-right mr10">
                <select id="user-role">
                  <optgroup label="Logged in As:">
                    <option value="1-1">Client</option>
                    <option value="1-2">Editor</option>
                    <option value="1-3" selected="selected">Admin</option>
                  </optgroup>
                </select>
              </div>
            </li>
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-envelope"></span> Messages
                <span class="label label-warning">2</span>
              </a>
            </li>
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-user"></span> Friends
                <span class="label label-warning">6</span>
              </a>
            </li>
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-bell"></span> Notifications </a>
            </li>
            <li class="list-group-item">
              <a href="#" class="animated animated-short fadeInUp">
                <span class="fa fa-gear"></span> Settings </a>
            </li>
            <li class="dropdown-footer">
              <a href="#" class="">
              <span class="fa fa-power-off pr5"></span> Logout </a>
            </li>
          </ul>
        </li>
      </ul>
    </header>

    <!-- Start: Sidebar -->
    <aside id="sidebar_left" class="nano nano-light affix">

      <!-- Start: Sidebar Left Content -->
      <div class="sidebar-left-content nano-content">

        <!-- Start: Sidebar Header -->
        <header class="sidebar-header">

          <!-- Sidebar Widget - Author -->
          <div class="sidebar-widget author-widget">
            <div class="media">
              <a class="media-left" href="#">
                <img src="assetsAd/img/avatars/2.jpg" class="img-responsive">
              </a>
              <div class="media-body">
                <div class="media-links">
                   <a href="#" class="sidebar-menu-toggle">User Menu -</a> <a href="User_Login.html">Logout</a>
                </div>
                <div class="media-author">${session.user.username}</div>
              </div>
            </div>
          </div>

          <!-- Sidebar Widget - Menu (slidedown) -->
        
          <!-- Sidebar Widget - Search (hidden) -->
          <div class="sidebar-widget search-widget hidden">
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
              <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
            </div>
          </div>

        </header>
        <!-- End: Sidebar Header -->

        <!-- Start: Sidebar Menu -->
        <ul class="nav sidebar-menu">
          

        
          <li>
            <a class="accordion menu-open" href="#">
              <span class="glyphicon glyphicon-user"></span>
              <span class="sidebar-title">User Menu</span>
              <span class="caret"></span>
            </a>
            <ul class="nav sub-nav">
              <li >
                <a href="User_Timeline.html">
                  <span class="glyphicon glyphicon-dashboard"></span> Timeline
                  <span class="label label-xs bg-primary"></span>
                </a>
              </li>
               <li >
                <a href="indexRoom.html">
                  <span class="fa fa-picture-o"></span> Explore </a>
              </li>
              
              <li class="active">
                <a href="User_Settings.jsp">
                  <span class="fa fa-gears"></span> Settings </a>
              </li>
            </ul>
          </li>
          

          <!-- sidebar resources -->
          

          <!-- sidebar bullets -->
         

          <!-- sidebar progress bars -->
     
        </ul>
        <!-- End: Sidebar Menu -->

        <!-- Start: Sidebar Collapse Button -->
        <div class="sidebar-toggle-mini">
          <a href="#">
            <span class="fa fa-sign-out"></span>
          </a>
        </div>
        <!-- End: Sidebar Collapse Button -->

      </div>
      <!-- End: Sidebar Left Content -->

    </aside>

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">

      <!-- Start: Topbar-Dropdown -->
      <div id="topbar-dropmenu" class="alt">
        <div class="topbar-menu row">
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile bg-primary light">
              <span class="glyphicon glyphicon-inbox text-muted"></span>
              <span class="metro-title">Messages</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile bg-info light">
              <span class="glyphicon glyphicon-user text-muted"></span>
              <span class="metro-title">Users</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile bg-success light">
              <span class="glyphicon glyphicon-headphones text-muted"></span>
              <span class="metro-title">Support</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile bg-system light">
              <span class="glyphicon glyphicon-facetime-video text-muted"></span>
              <span class="metro-title">Videos</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile bg-warning light">
              <span class="fa fa-gears text-muted"></span>
              <span class="metro-title">Settings</span>
            </a>
          </div>
          <div class="col-xs-4 col-sm-2">
            <a href="#" class="metro-tile bg-alert light">
              <span class="glyphicon glyphicon-picture text-muted"></span>
              <span class="metro-title">Pictures</span>
            </a>
          </div>
        </div>
      </div>
      <!-- End: Topbar-Dropdown -->

      <!-- Start: Topbar -->
      <header id="topbar" class="ph10">
        <div class="topbar-left">
          <ul class="nav nav-list nav-list-topbar pull-left">
            <li>
              <a href="User_Timeline.html">Timeline</a>
            </li>
           
            
            <li class="active">
              <a href="User_Settings.html">Settings</a>
            </li>
          </ul>
        </div>
        <div class="topbar-right hidden-xs hidden-sm">
          <a href="Password_Reset.html" class="btn btn-default btn-sm fw600 ml10">
            <span class="fa fa-plus pr5"></span> Reset Password</a>
          
          
        </div>
      </header>
      <!-- End: Topbar -->

      <!-- Begin: Content -->
      <section id="content" class="table-layout animated fadeIn">

        <!-- begin: .tray-center -->
        <div class="tray tray-center">

          <div class="mw1000 center-block">

            <!-- Store Owner Details -->
            <div class="panel panel-warning panel-border top mt20 mb35">
              <div class="panel-heading">
                <span class="panel-title">User Basic Information</span>
              </div>
              <form name="userModify" action="userModify" method="post" autocomplete="on">
             	<input type = "hidden" id="user.userid" name="user.userid">
             	<input type = "hidden" id="user.username" name="user.username">
             	<input type = "hidden" id="user.userpassword" name="user.userpassword">
              <div class="panel-body bg-light dark">
                <div class="admin-form">
                  <div class="section row mb10">
                    <label for="account-name" class="field-label col-md-3 text-center">Name:</label>
                    <div class="col-md-9">
                      <label for="account-name" class="field prepend-icon">
                        <input type="text" name="user.username" id="user.username" disabled="true" class="gui-input" value="UserName">
                        <label for="account-name" class="field-icon">
                          <i class="fa fa-home"></i>
                        </label>
                      </label>
                    </div>
                  </div>
                  <div class="section row mb10">
                    <label for="account-email" class="field-label col-md-3 text-center">Email:</label>
                    <div class="col-md-9">
                      <label for="account-email" class="field prepend-icon">
                        <input type="email" name="user.email" id="user.email" required="true" class="gui-input">
                        <label for="account-email" class="field-icon">
                          <i class="fa fa-envelope-o"></i>
                        </label>
                      </label>
                    </div>
                  </div>
                  <div class="section row mb10">
                    <label for="account-phone" class="field-label col-md-3 text-center">Phone:</label>
                    <div class="col-md-9">
                      <label for="account-phone" class="field prepend-icon">
                        <input type="text" name="user.phone" id="user.phone" class="gui-input" placeholder="">
                        <label for="account-phone" class="field-icon">
                          <i class="fa fa-phone"></i>
                        </label>
                      </label>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>

            <!-- Store Information -->
            <div class="panel panel-info panel-border top mb35">
              <div class="panel-heading">
                <span class="panel-title">User Details</span>
              </div>
              <div class="panel-body bg-light dark">
                <div class="admin-form">
                  <div class="section row mb10">
                    <label for="business-name" class="field-label col-md-3 text-center">First Name:</label>
                    <div class="col-md-9">
                      <label for="business-name" class="field prepend-icon">
                        <input type="text" name="user.firstname" id="user.firstname" class="gui-input" value="">
                        <label for="business-name" class="field-icon">
                          <i class="fa fa-user"></i>
                        </label>
                      </label>
                    </div>
                  </div>
                  <div class="section row mb10">
                    <label for="business-phone" class="field-label col-md-3 text-center">Last Name:</label>
                    <div class="col-md-9">
                      <label for="business-phone" class="field prepend-icon">
                        <input type="text" name="user.lastname" id="user.lastname" class="gui-input" value="">
                        <label for="business-phone" class="field-icon">
                          <i class="fa fa-user"></i>
                        </label>
                      </label>
                    </div>
                  </div>


                  <hr class="short alt">

<!--                   <div class="section"> -->
<!--                     <label for="lastaddr" class="field prepend-icon"> -->
<!--                       <input type="text" name="lastaddr" id="lastaddr" class="gui-input" placeholder="Street address "> -->
<!--                       <label for="lastaddr" class="field-icon"> -->
<!--                         <i class="fa fa-map-marker"></i> -->
<!--                       </label> -->
<!--                     </label> -->
<!--                   </div> -->
                  <!-- end section -->

                 
                  <!-- end section -->

<!--                   <div class="section row mbn"> -->
<!--                     <div class="col-md-3"> -->
<!--                       <label for="zip" class="field prepend-icon"> -->
<!--                         <input type="text" name="zip" id="zip" class="gui-input" placeholder="Zip"> -->
<!--                         <label for="zip" class="field-icon"> -->
<!--                           <i class="fa fa-certificate"></i> -->
<!--                         </label> -->
<!--                       </label> -->
<!--                     </div> -->
<!--                     end section -->

<!--                     <div class="col-md-4"> -->
<!--                       <label for="city" class="field prepend-icon"> -->
<!--                         <input type="text" name="city" id="city" class="gui-input" placeholder="City"> -->
<!--                         <label for="city" class="field-icon"> -->
<!--                           <i class="fa fa-building-o"></i> -->
<!--                         </label> -->
<!--                       </label> -->
<!--                     </div> -->
<!--                     end section -->

<!--                     <div class="col-md-5"> -->
<!--                       <label for="states" class="field select"> -->
<!--                         <select id="states" name="states"> -->
<!--                           <option value="">Choose State</option> -->
<!--                           <option value="AL">New South Wales</option> -->
<!--                           <option value="AK">Victoria</option> -->
<!--                           <option value="AZ">Queensland</option> -->
<!--                           <option value="AR">South Australia</option> -->
<!--                           <option value="CA">Western Australia</option> -->
<!--                           <option value="CO">Tasmania</option> -->
<!--                           <option value="CT">Australian Capital Territory</option> -->
                         
<!--                         </select> -->
<!--                         <i class="arrow double"></i> -->
<!--                       </label> -->
<!--                     </div> -->
                    <!-- end section -->

                  </div>
                  <!-- end section row -->

                </div>
              </div>
            </div>

            <!-- Store Settings -->
           

            <!-- Store Policies -->
            <div class="panel panel-success panel-border top mb35">
              <div class="panel-heading">
                <span class="panel-title">Biography</span>
              </div>
              <div class="panel-body bg-light dark">
                <div class="admin-form">


                  <div class="section row mb25">
                    <label for="refund-policy" class="field-label col-md-3 text-center">Biref Introduction:</label>
                    <div class="col-md-9">
                      <label class="field prepend-icon">
                        <textarea class="gui-textarea" id="user.description" name="user.description" placeholder="Introduce yourself briefly here..."></textarea>
                        <label for="refund-policy" class="field-icon">
                          <i class="fa fa-user"></i>
                        </label>
                      </label>
                    </div>
                  </div>

                  <div class="section row mb25">
                    <label for="privacy-policy" class="field-label col-md-3 text-center">Hobbies</label>
                    <div class="col-md-9">
                      <label class="field prepend-icon">
                        <textarea class="gui-textarea" id="user.hobby" name="user.hobby" placeholder="Describe what you are interested in here..."></textarea>
                        <label for="privacy-policy" class="field-icon">
                          <i class="fa fa-edit"></i>
                        </label>
                      </label>
                    </div>
                  </div>

                 
                  <div class="col">
                      <p class="text-right">
                        <button class="btn btn-primary" onclick="modify()" type="button">Save</button>
                      </p>
                    </div>

                </div>
              </div>
			</div>

			</form>
            <!-- Request Google Analytics -->
           
        <!-- end: .tray-center -->

       
        <!-- end: .tray-right -->

      </section>
      <!-- End: Content -->

    </section>


    <!-- Start: Right Sidebar -->
    <aside id="sidebar_right" class="nano affix">

      <!-- Start: Sidebar Right Content -->
      <div class="sidebar-right-content nano-content">

        <div class="tab-block sidebar-block br-n">
          <ul class="nav nav-tabs tabs-border nav-justified hidden">
            <li class="active">
              <a href="#sidebar-right-tab1" data-toggle="tab">Tab 1</a>
            </li>
            <li>
              <a href="#sidebar-right-tab2" data-toggle="tab">Tab 2</a>
            </li>
            <li>
              <a href="#sidebar-right-tab3" data-toggle="tab">Tab 3</a>
            </li>
          </ul>
          <div class="tab-content br-n">
            <div id="sidebar-right-tab1" class="tab-pane active">

              <h5 class="title-divider text-muted mb20"> Server Statistics
                <span class="pull-right"> 2013
                  <i class="fa fa-caret-down ml5"></i>
                </span>
              </h5>
              <div class="progress mh5">
                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 44%">
                  <span class="fs11">DB Request</span>
                </div>
              </div>
              <div class="progress mh5">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 84%">
                  <span class="fs11 text-left">Server Load</span>
                </div>
              </div>
              <div class="progress mh5">
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 61%">
                  <span class="fs11 text-left">Server Connections</span>
                </div>
              </div>

              <h5 class="title-divider text-muted mt30 mb10">Traffic Margins</h5>
              <div class="row">
                <div class="col-xs-5">
                  <h3 class="text-primary mn pl5">132</h3>
                </div>
                <div class="col-xs-7 text-right">
                  <h3 class="text-success-dark mn">
                    <i class="fa fa-caret-up"></i> 13.2% </h3>
                </div>
              </div>

              <h5 class="title-divider text-muted mt25 mb10">Database Request</h5>
              <div class="row">
                <div class="col-xs-5">
                  <h3 class="text-primary mn pl5">212</h3>
                </div>
                <div class="col-xs-7 text-right">
                  <h3 class="text-success-dark mn">
                    <i class="fa fa-caret-up"></i> 25.6% </h3>
                </div>
              </div>

              <h5 class="title-divider text-muted mt25 mb10">Server Response</h5>
              <div class="row">
                <div class="col-xs-5">
                  <h3 class="text-primary mn pl5">82.5</h3>
                </div>
                <div class="col-xs-7 text-right">
                  <h3 class="text-danger mn">
                    <i class="fa fa-caret-down"></i> 17.9% </h3>
                </div>
              </div>

              <h5 class="title-divider text-muted mt40 mb20"> Server Statistics
                <span class="pull-right text-primary fw600">USA</span>
              </h5>


            </div>
            <div id="sidebar-right-tab2" class="tab-pane"></div>
            <div id="sidebar-right-tab3" class="tab-pane"></div>
          </div>
          <!-- end: .tab-content -->
        </div>
      </div>
    </aside>
    <!-- End: Right Sidebar -->

  </div>
  <!-- End: Main -->

  <!-- BEGIN: PAGE SCRIPTS -->

  <!-- jQuery -->
  <script src="vendor/jquery/jquery-1.11.1.min.js"></script>
  <script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

  <!-- FileUpload JS -->
  <script src="vendor/plugins/fileupload/fileupload.js"></script>
  <script src="vendor/plugins/holder/holder.min.js"></script>

  <!-- Theme Javascript -->
  <script src="assetsAd/js/utility/utility.js"></script>
  <script src="assetsAd/js/demo/demo.js"></script>
  <script src="assetsAd/js/main.js"></script>
  <script type="text/javascript">
  jQuery(document).ready(function() {

    "use strict";

    // Init Theme Core    
    Core.init();

    // Init Demo JS  
    Demo.init();

    // select dropdowns - placeholder like creation
    var selectList = $('.admin-form select');
    selectList.each(function(i, e) {
      $(e).on('change', function() {
        if ($(e).val() == "0") $(e).addClass("empty");
        else $(e).removeClass("empty")
      });
    });
    selectList.each(function(i, e) {
      $(e).change();
    });

  });
  </script>
  <!-- END: PAGE SCRIPTS -->

</body>

</html>
