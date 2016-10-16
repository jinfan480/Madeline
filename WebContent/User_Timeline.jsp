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

  <!-- Plugin CSS -->
  <link rel="stylesheet" type="text/css" href="vendor/plugins/magnific/magnific-popup.css">

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="assetsAd/skin/default_skin/css/theme.css">

  <!-- Admin Forms CSS -->
  <link rel="stylesheet" type="text/css" href="assetsAd/admin-tools/admin-forms/css/admin-forms.css">

  <!-- Favicon -->
  <link rel="shortcut icon" href="assetsAd/img/favicon.ico">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

</head>

<script type="text/javascript">

function LoadLevel(message){
	var button = "<button class=\"btn btn-primary\" type=\"button\" onclick=\"addMemory()\">Add Memory</button>";
	document.getElementById("button").innerHTML =  button;
	document.getElementById("image").value="";
	
// 	var message = '${message}';
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
			var Level = "<option selected=\"selected\">Floor</option>";
			var json = xmlhttp.responseText;
// 			alert(json);
			floor = eval(json);
			for(var i=0; i<floor.length; i++){
				Level += "<option value=\""+floor[i].floornum+"\">"+floor[i].floornum+"</option>";
			}
			document.getElementById("level").innerHTML = Level;
			LoadRoom();
		}
	};
	
	xmlhttp.open("POST", "floorShow", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
}

function searchRoom(){
	var level = document.getElementById("level").value;
	if(level=="Floor")
		return;
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var Room = "<option selected=\"selected\" value=\"Room\">Room</option>";
			var json = xmlhttp.responseText;
// 			alert(json);
			room = eval(json);
			for(var i=0; i<room.length; i++){
				Room += "<option value=\""+room[i].roomnum+"\">"+room[i].roomnum+":"+room[i].roomname+"</option>";
			}
			document.getElementById("room").innerHTML = Room;
		}
	};
	xmlhttp.open("POST", "roomShow", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("level="+level);
}
function addMemory(){
	if(document.getElementById("image").value!=""){
		var type = document.getElementById("image").value.substr(document.getElementById("image").value.lastIndexOf(".")).toLowerCase();
		if(type==".gif"||type==".png"||type==".jpeg"||type==".jpg"||type==".bmp"){
			
		}else{
			alert("Must upload a image file");
			return;
		}
	}
	if(document.getElementById("room").value=="Room"){
		alert("Choose a Room");
		return;
	}
	//document.memoryAction.action="memoryAdd";
	document.memoryAction.submit();
}

function LoadRoom(){
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var Room = "<option value=\"All\">Filter by Room</option>";
			Room += "<option value=\"All\">All</option>";
			var json = xmlhttp.responseText;
// 			alert(json);
			room = eval(json);
			for(var i=0; i<room.length; i++){
				Room += "<option value=\""+room[i].roomnum+"\">"+room[i].roomnum+":"+room[i].roomname+"</option>";
			}
			//document.getElementById("roomFilter").innerHTML = Room;
		}
	};
	xmlhttp.open("POST", "roomShow", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
}

</script>



<body class="timeline-page" onLoad="LoadLevel('${message}')">

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
            <span class="hidden-xs pl15"> Anna </span>
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
    <!-- End: Header -->

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
                <div class="media-author">Anna</div>
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
              <li class="active">
                <a href="User_Timeline.html">
                  <span class="glyphicon glyphicon-dashboard"></span> Timeline
                  <span class="label label-xs bg-primary"></span>
                </a>
              </li>
              
               <li >
                <a href="indexRoom.html">
                  <span class="fa fa-picture-o"></span> Explore </a>
              </li>
              <li >
                <a href="User_Settings.html">
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
      <header id="topbar" class="alt">
        <div class="topbar-left">
          <ol class="breadcrumb">
            <li class="crumb-active">
              <a href="#">User Timeline</a>
            </li>
            
           
          </ol>
        </div>
        
      </header>
      <!-- End: Topbar -->

      <!-- Begin: Content -->
      <section id="content" class="animated fadeIn">

        <!-- Timeline Wrapper -->
        <form name="memoryAction" method="post" enctype="multipart/form-data" action="memoryAdd">
        <div id="timeline" class="timeline-single mt30">

          <!-- Timeline Divider -->
          <div class="timeline-divider mtn">
            <div class="divider-label">2016</div>
            <div class="pull-right">
              <button id="timeline-toggle" class="btn btn-default btn-sm">
                <span class="ad ad-lines fs16 lh20"></span>
              </button>
            </div>
          </div>

          <div class="row">

            <!-- Timeline - Left Column -->
          
          <input id="id" name="memory.memoryid" type="hidden">
          <input id="uid" name="memory.userid" type="hidden">
          <input id="picture" name="memory.picture" type="hidden">
            
            
            <div class="col-sm-6 left-column">
              <div class="timeline-item">
                <div class="timeline-icon">
                  <span class="fa fa-edit text-warning"></span>
                </div>
                <div class="panel">
                  <div class="panel-heading">
                    <span class="panel-title hidden-xs">Your Memory</span>
                    <ul class="nav panel-tabs">
                      
                      <li >
                        <a href="#tab1" data-toggle="tab">Description</a>
                      </li>
                      <li class="active">
                        <a href="#tab2" data-toggle="tab">Image</a>
                      </li>
                      <li>
                        <a href="#tab3" data-toggle="tab">Video</a>
                      </li>
                      <li>
                        <a href="#tab4" data-toggle="tab">Location</a>
                      </li>
                    </ul>
                  </div>
                  <div class="panel-body">
                    <div class="admin-form theme-primary">
                      <div class="tab-content pn pt10 border-none">

                        <div id="tab2" class="tab-pane active">
                        <!--   <form id="timeline-image-form" role="form"> -->

                            <div class="fileupload fileupload-new" data-provides="fileupload">

                              <div class="tab-body">
                                <div class="fileupload-preview thumbnail">
                                  <img data-src="holder.js/100%x140" alt="holder">
                                </div>
                                <div class="row mv25">
                                  <div class="col-md-3">
                                    <span class="button btn-system btn-file btn-block">
                                      <span class="fileupload-new">Select image</span>
                                      <span class="fileupload-exists">Change File</span>
                                      <input id="image" name="image" type="file">
                                    </span>
                                  </div>
                                  <div class="col-md-4">
                                    <label for="name2" class="field prepend-icon">
<<<<<<< HEAD:WebContent/User_Timeline.jsp
                                      <!-- <input type="text" name="memory.title" id="memory.title" class="event-name gui-input" placeholder="Memory Title"> -->
=======
                                      <input type="text" name="name2" id="name2" class="event-name gui-input" placeholder="Tags">
>>>>>>> e578f7d79c7e1edf503be1e6390923e9e85c2218:WebContent/User_Timeline.html
                                      <label for="name2" class="field-icon">
                                        <i class="fa fa-pencil"></i>
                                      </label>
                                    </label>
                                  </div>
                                  <div class="col-md-5">
                      <label for="states" class="field select">
                        <select id="states" name="states">
                          <option value="">Can be rated or commented</option>
                          <option value="AL">Yes</option>
                          <option value="AK">No</option>
                          
                          
                         
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
                                </div>
                              </div>

                              <div class="panel-footer mhn15 mbn15">
                                <div class="row">
                                  <div class="col-md-3">
                                    <a href="#" class="button btn-danger btn-block fileupload-exists" data-dismiss="fileupload">Remove</a>
                                  </div>
                                  <!-- <div class="col-md-9 text-right">
                                    <button type="submit" class="button btn-primary submit-btn">Upload Memory</button>
                                  </div> -->
                                </div>

                              </div>
                              <!-- end .form-footer section -->

                            </div>

                          <!-- </form> -->
                        </div>

                        <div id="tab1" class="tab-pane">
                          <!-- <form id="timeline-basic-form" role="form"> -->

                            <div class="section row">

                              <div class="col-md-6">
                                <label for="name1" class="field prepend-icon">
                                  <input type="text" name="memory.title" id="memory.title" class="event-name gui-input" placeholder="Title">
                                  <label for="name1" class="field-icon">
                                    <i class="fa fa-pencil"></i>
                                  </label>
                                </label>
                              </div>
                              <!-- end section -->

                              <div class="col-md-6">
                                <label for="date1" class="field prepend-icon">
<<<<<<< HEAD:WebContent/User_Timeline.jsp
                                  <input type="text" name="memory.date" id="memory.date" class="datepicker gui-input" placeholder="Data">
=======
                                  <input type="text" name="date1" id="date1" class="datepicker gui-input" placeholder="Memory Data">
>>>>>>> e578f7d79c7e1edf503be1e6390923e9e85c2218:WebContent/User_Timeline.html
                                  <label for="date1" class="field-icon">
                                    <i class="fa fa-calendar"></i>
                                  </label>
                                </label>
                              </div>
                              <!-- end section -->

                            </div>
                            <!-- end section row section -->

                            <div class="section mb30">
                              <label class="field prepend-icon">
                                <textarea class="event-desc gui-textarea" id="memory.content" name="memory.content" placeholder="Type the description for the memory here..."></textarea>
                                <label for="desc1" class="field-icon">
                                  <i class="fa fa-comments"></i>
                                </label>
                                <span class="input-footer">
                                  <strong>Hint:</strong> Don't be negative or off topic! just be awesome...</span>
                              </label>
                            </div>
                            <!-- end section row section -->

                            <!-- <div class="panel-footer mhn15 mbn15 text-right">
                              <button type="submit" class="button btn-primary submit-btn">Upload Memory</button>
                            </div> -->
                            <!-- end .form-footer section -->

                          <!-- </form> -->
                        </div>

                        <div id="tab3" class="tab-pane">
                          <!-- <form id="timeline-video-form" role="form"> -->

                            
                            <!-- end section row section -->

                            <div class="section mb30">
                              <label class="field prepend-icon">
                                <textarea class="event-video gui-textarea" id="memory.video" name="memory.video" placeholder="<iframe></iframe>">
                                  <iframe class="embed-responsive-item" src="http://www.youtube.com/embed/q94n3eWOWXM?rel=0" allowfullscreen=""></iframe>
                                </textarea>
                                <label for="desc2" class="field-icon">
                                  <i class="fa fa-video-camera"></i>
                                </label>
                                <span class="input-footer">
                                  <strong>This field accepts youtube embed:</strong> An example has already been placed in the field</span>
                              </label>
                            </div>
                            <!-- end section row section -->

                            <!-- <div class="panel-footer mhn15 mbn15 text-right">
                              <button type="submit" class="button btn-primary submit-btn">Upload Memory</button>
                            </div> -->
                            <!-- end .form-footer section -->

                          <!-- </form> -->
                        </div>

                        <div id="tab4" class="tab-pane">

                          <!-- <form id="timeline-map-form" role="form"> -->

                            <div class="section row">
                                <div class="col-md-5">
                      <label for="states" class="field select">
                       <select id="level" name="product-status" onChange="searchRoom()">
                       <option selected="selected">Floor</option>
                         <!--  <option value="">Choose Floor</option>
                          <option value="AL">Basement</option>
                          <option value="AK">Ground Floor</option>
                          <option value="AZ">Second Floor</option>
                          <option value="AR">Third Floor</option> -->
                          
                         
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
                              <div class="col-md-5">
                      <label for="states" class="field select">
                        <select id="room" name="memory.roomid">
                        <option selected="selected">Room</option>
                          <!-- <option value="">Choose Room</option>
                          <option value="AL">Sample Room 1</option>
                          <option value="AK">Sample Room 2</option>
                          <option value="AZ">Sample Room 3</option> -->
                          
                         
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
                              
                            </div>
                            <!-- end section -->

                            
                            <!-- end section -->

                            <div class="panel-footer mhn15 mbn15 text-right">
                            <p class="text-right" id="button">
                              <button type="submit" class="button btn-primary submit-btn" onclick="addMemory()">Upload Memory</button>
                            </p>
                            </div>
                            <!-- end .form-footer section -->

                         <!--  </form> -->
							

                        </div>

                      </div>
                    </div>
                  </div>
                 
                </div>
              </div>
              
              <div class="timeline-item">
                <div class="timeline-icon">
                  <span class="glyphicon glyphicon-user text-primary"></span>
                </div>
                <div class="panel">
                  <div class="panel-heading">
                    <span class="panel-title">
                      <span class="glyphicon glyphicon-comment"></span>History Posting </span>
                    <div class="panel-header-menu pull-right mr10 text-muted fs12"> July 30, 2015 </div>
                  </div>
                  <div class="panel-body">
                    <div class="media">
                      <a class="pull-left" href="#"> <img class="media-object thumbnail mw50" src="assetsAd/img/avatars/2.jpg" alt="..."> </a>
                      <div class="media-body">
                        <h5 class="media-heading mb20">Anna Posted 
                          <small> - 3 hours ago</small>
                        </h5>
                        <img src="assetsAd/img/stock/1.jpg" class="mw140 mr25 mb20"> <img src="assetsAd/img/stock/2.jpg" class="mw140 mb20">
                        
                      </div>
                    </div>
                    <div class="media mt20">
                      <a class="pull-left" href="#"> <img class="media-object thumbnail thumbnail-sm rounded mw40" src="assetsAd/img/avatars/3.jpg" alt="..."> </a>
                      <div class="media-body mb5">
                        <h5 class="media-heading mbn">Simon Rivers commented
                          <small> - 2 hours ago</small>
                        </h5>
                        <p> That is so cute.</p>
                      </div>
                    </div>
                    <div class="media mt15">
                      <a class="pull-left" href="#"> <img class="media-object thumbnail thumbnail-sm rounded mw40" src="assetsAd/img/avatars/2.jpg" alt="..."> </a>
                      <div class="media-body mb5">
                        <h5 class="media-heading mbn">Anna
                          <small> - 1 hours ago</small>
                        </h5>
                        <p>Thank you so much</p>
                      </div>
                    </div>
                  </div>
                  <div class="panel-footer p15">
                    <div class="admin-form">
                      <label for="reply1" class="field prepend-icon">
                        <input type="text" name="reply1" id="reply1" class="event-name gui-input" placeholder="Respond with a comment.">
                        <label for="reply1" class="field-icon">
                          <i class="fa fa-pencil"></i>
                        </label>
                      </label>
                    </div>
                  </div>
                  <!-- end .form-footer section -->

                </div>
              </div>
              <div class="timeline-item">
                <div class="timeline-icon">
                  <span class="glyphicon glyphicons-picture text-info"></span>
                </div>
                <div class="panel">
                  <div class="panel-heading">
                    <span class="panel-title">
                      <span class="fa fa-picture-o"></span> Your Memory Collections </span>
                    <div class="panel-header-menu pull-right mr10 text-muted fs12"> August 7, 2016 </div>
                  </div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-xs-4">
                        <a class="gallery-item" href="assetsAd/img/stock/3.jpg"><img src="assetsAd/img/stock/3.jpg" class="img-responsive" alt="">
                        </a>
                      </div>
                      <div class="col-xs-4">
                        <a class="gallery-item" href="assetsAd/img/stock/4.jpg"><img src="assetsAd/img/stock/4.jpg" class="img-responsive" alt="">
                        </a>
                      </div>
                      <div class="col-xs-4">
                        <a class="gallery-item" href="assetsAd/img/stock/5.jpg"><img src="assetsAd/img/stock/5.jpg" class="img-responsive" alt="">
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Timeline - Right Column -->
            <div class="col-sm-6 right-column">
              <div class="timeline-item">
                <div class="timeline-icon">
                  <span class="fa fa-video-camera text-primary"></span>
                </div>
                <div class="panel">
                  <div class="panel-heading">
                    <span class="panel-title">
                      <span class="glyphicon glyphicon-facetime-video"></span> Video Memory</span>
                    <div class="panel-header-menu pull-right mr10 text-muted fs12"> November 27, 2015 </div>
                  </div>
                  <div class="panel-body">
                    <div class="embed-responsive embed-responsive-16by9">
                      <!-- <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tGlY7sXVYf0" frameborder="0" allowfullscreen></iframe> -->
                    </div>
                  </div>
                </div>
              </div>
              <div class="timeline-item">
                <div class="timeline-icon">
                  <span class="fa fa-compass text-success"></span>
                </div>
               
              </div>
              
              <div class="timeline-item">
                <div class="timeline-icon">
                  <span class="fa fa-paperclip text-danger"></span>
                </div>
                <div class="panel">
                  <div class="panel-body p10">
                    <blockquote class="mbn ml10">
                      <p> Textual Memory: "..............."  </p>
                      <small> Anna </small>
                    </blockquote>
                  </div>
                </div>
              </div>
            </div>

          </div>

          <!-- Timeline Divider -->
          <div class="timeline-divider">
            <div class="divider-label">2012</div>
          </div>

        </div>
</form>
        <!-- Timeline - Demo HTML -->
        <div class="timeline-item panel-clone" id="clone">
          <div class="panel">
            <div class="panel-heading">
              <span class="panel-title">
                <i class="fa fa-pencil"></i> A Title </span>
              <span class="panel-date pull-right mr10 text-muted fs12"> November 27, 2013 </span>
            </div>
            <div class="panel-body">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean felis sapien, vestibulum in dignissim vitae, condimentum eu nibh.</p>
            </div>
          </div>
        </div>

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

  <!-- Magnific Popup JS -->
  <script src="vendor/plugins/magnific/jquery.magnific-popup.js"></script>

  <!-- FileUpload JS -->
  <script src="vendor/plugins/fileupload/fileupload.js"></script>
  <script src="vendor/plugins/holder/holder.min.js"></script>

  <!-- Admin Forms JS -->
  <script src="assetsAd/admin-tools/admin-forms/js/jquery-ui-monthpicker.min.js"></script>

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

    // Toggle single item timeline style
    $('#timeline-toggle').on('click', function() {
      $('#timeline').toggleClass('timeline-single');
    });

    // All of the event creation forms attached to the timeline
    var forms = '#timeline-basic-form, #timeline-image-form, #timeline-video-form, #timeline-map-form';

    // Catch Form Submit and pass required variables 
    // to event creation function
    $(forms).submit(function(e) {
      var This = $(this);
      createEvent(e, This);
    });

    // unique ID counter for Panel Clones
    var counter = 0;

    function createEvent(e, This) {
      e.preventDefault();
      // shared event field data
      var eventTitle = This.find('.event-name').val(),
        eventDate = This.find('.datepicker').val();

      if (eventTitle == '') {
        var eventTitle = "Example Title";
      }
      if (eventDate == '') {
        var eventDate = "01/01/2014";
      }

      // The form creation panel simply collects data from the user
      // proccesses it and then creates a new panel to place it in.
      // That new panel is simply a clone of one which already exists.
      var clone = $('#clone').clone(true).attr('id', 'clone-' + counter).removeClass('panel-clone');
      clone.find('.panel-heading .panel-title').text(eventTitle);
      clone.find('.panel-heading .panel-date').text(eventDate)

      // append clone to container and display it
      var setClone = function setClone() {
        clone.insertAfter(This.parents('.timeline-item')).hide();
        clone.fadeIn();
        This[0].reset();
      }

      // unique event field data
      var id = This.attr('id');

      switch (id) {
        case 'timeline-basic-form':
          var eventDesc = This.find('.event-desc').val();
          clone.find('.panel-body p').text(eventDesc);
          setClone()
          break;
        case 'timeline-image-form':
          var eventImage = This.find('.fileupload-preview img').clone().addClass('img-responsive');
          clone.find('.panel-body p').html(eventImage);
          setClone()
          break;
        case 'timeline-video-form':
          // cache form value
          var eventVideo = This.find('.event-video').val();
          // Create responsive iframe wrapper
          var eventCont = clone.find('.panel-body').html('<div class="embed-responsive embed-responsive-16by9"></div>');
          // Fill container with iframe url from eventVideo Val
          eventCont.find('.embed-responsive').html(eventVideo);
          setClone()
          break;
        case 'timeline-map-form':
          // cache form value
          var eventMap = This.find('.event-map').val();
          // Create responsive iframe wrapper
          var eventCont = clone.find('.panel-body').html('<div class="embed-responsive embed-responsive-16by9"></div>');
          // Fill container with iframe url from eventVideo Val
          eventCont.find('.embed-responsive').html(eventMap);
          setClone()
          break;
      }
      // add to unique ID counter
      counter++;
    }

    // Init Admin plugins
    $(".datepicker").datepicker({
      numberOfMonths: 1,
      prevText: '<i class="fa fa-chevron-left"></i>',
      nextText: '<i class="fa fa-chevron-right"></i>',
      showButtonPanel: false,
      beforeShow: function(input, inst) {
        var newclass = 'admin-form';
        var themeClass = $(this).parents('.admin-form').attr('class');
        var smartpikr = inst.dpDiv.parent();
        if (!smartpikr.hasClass(themeClass)) {
          inst.dpDiv.wrap('<div class="' + themeClass + '"></div>');
        }
      }
    });

    // Init Misc plugins
    $('a.gallery-item').magnificPopup({
      type: 'image',
      gallery: {
        enabled: true
      }
    });

    // Demo purposes. Runs holder.js (temp images) after 
    // a tab has been clicked. Fixes content hidden bug
    $('a[data-toggle="tab"]').click(function() {
      var tabDelay = setTimeout(function() {
        Holder.run();
      }, 20);
    });

  });
  </script>
  <!-- END: PAGE SCRIPTS -->

</body>

</html>
