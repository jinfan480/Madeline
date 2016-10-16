<!DOCTYPE html>
<html>

<head>
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <title>Madeline_Admin</title>
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
function LoadLevel(message){
	var button = "<button class=\"btn btn-primary\" type=\"button\" onclick=\"addArtefact()\">Add Artefact</button>";
	document.getElementById("button").innerHTML = button;
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
				Level += "<option value=\""+floor[i].floornum+"\">"+floor[i].floordescript+"</option>";
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
				Room += "<option value=\""+room[i].roomnum+"\">"+room[i].roomname+"</option>";
			}
			document.getElementById("room").innerHTML = Room;
		}
	};
	xmlhttp.open("POST", "roomShow", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("level="+level);
}
function addArtefact(){
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
	document.artefactAction.action="artefactAdd";
	document.artefactAction.submit();
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
				Room += "<option value=\""+room[i].roomnum+"\">"+room[i].roomname+"</option>";
			}
			document.getElementById("roomFilter").innerHTML = Room;
			searchArt(1);
		}
	};
	xmlhttp.open("POST", "roomShow", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send(null);
}

function searchArt(page){
	var room = document.getElementById("roomFilter").value;
	var isOld = document.getElementById("categoryFilter").value;
	var size = document.getElementById("page").value;
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var Artefact ="";
			var json = xmlhttp.responseText;
// 			alert(json);
			var pages = json.split("||")[0];
			art = eval(json.split("||")[1]);
			for(var i=0; i<art.length; i++){
				var old;
				if(art[i].isold==true)
					old = "Old";
				else
					old = "New";
				var src = "";
				var href = "";
				if(art[i].picture!=null&&art[i].picture!=""){
					src="src="+art[i].picture+"";
					href="href="+art[i].picture;
				}
				Artefact += "<tr><td class=\"w100\"><a "+href+"><img class=\"img-responsive mw40 ib mr10\""+src+"></td>";
				Artefact += "<td>"+art[i].title+"</td><td>"+art[i].roomid+"</td><td>"+old+"</td>";
				Artefact += "<td><div class=\"btn-group text-right\">";
				Artefact +=	"<button type=\"button\" class=\"btn btn-success br2 btn-xs fs12 dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"> Action";
				Artefact += "<span class=\"caret ml5\"></span></button>";
				Artefact += "<ul class=\"dropdown-menu\" role=\"menu\"><li><a href=\"#\" onclick=\"edit("+art[i].artefactid+")\">Edit</a></li><li><a href=\"#\" onclick=\"Delete("+art[i].artefactid+")\">Delete</a></li><li><a href=\"#\">Archive</a></li></ul></div></td></tr>";
			}
			if(pages!=1){
				var next = parseInt(page) + 1;
				var pre = parseInt(page) - 1;
				if(page==1){
					Artefact += "<tr><td align=\"middle\" colspan=\"5\">First Page | <a href=\"javascript:void(0)\"onclick=\"searchArt("+next+")\">Next Page</a></td></tr>"
				}else if(page==pages){
					Artefact += "<tr><td align=\"middle\" colspan=\"5\"><a href=\"javascript:void(0)\"onclick=\"searchArt("+pre+")\">Previous Page</a> | Final Page</td></tr>"
				}else{
					Artefact += "<tr><td align=\"middle\" colspan=\"5\"><a href=\"javascript:void(0)\"onclick=\"searchArt("+pre+")\">Previous Page</a> | <a href=\"javascript:void(0)\"onclick=\"searchArt("+next+")\">Next Page</a></td></tr>"
				}
			}
			document.getElementById("artefact").innerHTML = Artefact;
		}
	};
	xmlhttp.open("POST", "artefactSearch", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("room="+room+"&isOld="+isOld+"&page="+page+"&size="+size);
}
function edit(artId){
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var json = xmlhttp.responseText;
			if(json==""||json==null)
				alert("No such Artefact");
			else{
				json = "[" + json + "]";
				var artefact = eval(json);
				document.getElementById("id").value = artefact[0].artefactid;
				document.getElementById("artefact.title").value = artefact[0].title;
				document.getElementById("artefact.content").value = artefact[0].content;
				document.getElementById("picture").value = artefact[0].picture;
				var select = document.getElementById("artefact.isold");  
				for(var i=0; i<select.options.length; i++){  
				    if(select.options[i].value == artefact[0].isold){  
				        select.options[i].selected = true;
				        break;  
				    }  
				}
				select = document.getElementById("level");
				var roomid = artefact[0].roomid.toString();
				for(var i=0; i<select.options.length; i++){  
				    if(select.options[i].value == roomid.substring(0,select.options[i].value.length)){  
				        select.options[i].selected = true;
				        break;
				    }  
				}
				if(artefact[0].picture==null||artefact[0].picture==""){
					document.getElementById("artefact.picture").innerHTML = "<img data-src=\"holder.js/100%x140\" alt=\"holder\" id=\"imageLoader\" src=\"data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNDk5IiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDQ5OSAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iNDk5IiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjE4OS44MjAzMTI1IiB5PSI3MCIgc3R5bGU9ImZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToyM3B0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjQ5OXgxNDA8L3RleHQ+PC9nPjwvc3ZnPg==\" data-holder-rendered=\"true\" style=\"height: 140px; width: 100%; display: block;\">";
				}
				else{
					document.getElementById("artefact.picture").innerHTML = "<img src="+artefact[0].picture+" alt=\"holder\" id=\"imageLoader\">";
				}	
				fillRoom(artefact[0].roomid);
				var button = "<button class=\"btn btn-primary\" type=\"button\" onclick=\"modifyArtefact()\">Modify Artefact</button>";
				document.getElementById("button").innerHTML = button;
			}
		}
	};
	xmlhttp.open("POST", "artefactView", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("artefactId="+artId);
}
function fillRoom(roomid){
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
			var select = document.getElementById("room");
			for(var i=0; i<select.options.length; i++){
			    if(select.options[i].value == roomid){  
			        select.options[i].selected = true;
			        break;  
			    }  
			}
		}
	};
	xmlhttp.open("POST", "roomShow", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("level="+level);
}
function modifyArtefact(){
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
	document.artefactAction.action="artefactModify";
	document.artefactAction.submit();
	document.getElementById("id").value = "";
	document.getElementById("artefact.title").value = "";
	document.getElementById("artefact.content").value = "";
	document.getElementById("picture").value = "";
}
function Delete(artId){
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			alert(xmlhttp.responseText);
			searchArt(1);
		}
	}
	xmlhttp.open("POST", "artefactDelete", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("artefactId="+artId);
	
}
</script>
<body class="ecom-products-page" onLoad="LoadLevel('${message}')">
<%-- 	<input type="hidden" id="message" value="${message}"> --%>

  <!-- Start: Theme Preview Pane -->
  
  <!-- End: Theme Preview Pane -->

  <div id="main">

    <!-- Start: Header -->
    <header class="navbar navbar-fixed-top navbar-shadow">
      <div class="navbar-branding">
        <a class="navbar-brand" href="Admin_DashBoard.html">
          <b>Madeline</b>Admin
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
                <b>Michael</b> added a new memory to Nurse Station:
                <a href="#">Memory</a>
              </div>
              <div class="timeline-date">1:25am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-dark light">
                <span class="fa fa-tags"></span>
              </div>
              <div class="timeline-desc">
                <b>Sara</b> added a new memory to Infirmary Department:
                <a href="#">Memory</a>
              </div>
              <div class="timeline-date">3:05am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-success">
                <span class="fa fa-user"></span>
              </div>
              <div class="timeline-desc">
                <b>Admin</b> added a new Artefact to Infirmary Department:
                <a href="#">Artefact</a>
              </div>
              <div class="timeline-date">4:15am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-warning">
                <span class="fa fa-pencil"></span>
              </div>
              <div class="timeline-desc">
                <b>Laura</b> edited her memory:
                <a href="#">Memory</a>
              <div class="timeline-date">5:25am</div>
            </li>
            <li class="timeline-item">
              <div class="timeline-icon bg-success">
                <span class="fa fa-user"></span>
              </div>
              <div class="timeline-desc">
                <b>Admin</b> edited an Artefact:
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
            <img src="assetsAd/img/avatars/1.jpg" alt="avatar" class="mw30 br64">
            <span class="hidden-xs pl15"> Michael .R </span>
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
                <img src="assetsAd/img/avatars/3.jpg" class="img-responsive">
              </a>
              <div class="media-body">
                <div class="media-links">
                   <a href="#" class="sidebar-menu-toggle">User Menu -</a> <a href="pages_login(alt).html">Logout</a>
                </div>
                <div class="media-author">Michael Richards</div>
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
              <span class="sidebar-title">Admin Menu</span>
              <span class="caret"></span>
            </a>
            <ul class="nav sub-nav">
              <li >
                <a href="Admin_DashBoard.html">
                  <span class="glyphicon glyphicon-dashboard"></span> Dashboard
                  <span class="label label-xs bg-primary"></span>
                </a>
              </li>
              <li class="active">
                <a href="Admin_Artefacts.html">
                  <span class="glyphicon glyphicon-book"></span> Artefacts </a>
              </li>
              <li>
                <a href="Admin_Memory.html">
                  <span class="fa fa-film"></span> Memories </a>
              </li>
              
              <li>
                <a href="Admin_Settings.html">
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
              <a href="Admin_DashBoard.html">Dashboard</a>
            </li>
            <li class="active">
              <a href="Admin_Artefacts.html">Artefacts</a>
            </li>
            <li>
              <a href="Admin_Memory.html">Memories</a>
            </li>
            
            <li>
              <a href="Admin_Settings.html">Settings</a>
            </li>
          </ul>
        </div>
        <div class="topbar-right hidden-xs hidden-sm">
          <a href="Admin_Memory.html" class="btn btn-default btn-sm fw600 ml10">
            <span class="fa fa-plus pr5"></span> Manage Memories</a>
          <a href="Admin_Artefacts.html" class="btn btn-default btn-sm fw600 ml10">
            <span class="fa fa-plus pr5"></span> Add Artefact</a>
         
        </div>
      </header>
      <!-- End: Topbar -->

      <!-- Begin: Content -->
      <section id="content" class="table-layout animated fadeIn">

        <!-- begin: .tray-center -->
        <div class="tray tray-center">

          <!-- create new order panel -->
          <form name="artefactAction" method="post" enctype="multipart/form-data">
          <input id="id" name="artefact.artefactid" type="hidden">
          <input id="picture" name="artefact.picture" type="hidden">
          <div class="panel mb25 mt5">
            <div class="panel-heading">
              <span class="panel-title hidden-xs"> Add Artefacts</span>
              <ul class="nav panel-tabs-border panel-tabs">
                <li class="active">
                  <a href="#tab1_1" data-toggle="tab">General</a>
                </li>
                <li>
                  <a href="#tab1_2" data-toggle="tab">Details</a>
                </li>
              </ul>
            </div>
            <div class="panel-body p20 pb10">
              <div class="tab-content pn br-n admin-form">
                <div id="tab1_1" class="tab-pane active">

                  <div class="section row mbn">
                    <div class="col-md-4">
                      <div class="fileupload fileupload-new admin-form" data-provides="fileupload">
                        <div class="fileupload-preview thumbnail mb20" id="artefact.picture">
                          <img data-src="holder.js/100%x140" alt="holder" id="imageLoader">
                        </div>
                        <div class="row">
<!--                           <div class="col-xs-7 pr5"> -->
<!--                             <input type="text" name="name2" id="name2" class="text-center event-name gui-input br-light bg-light" placeholder="Img Keywords"> -->
<!--                             <label for="name2" class="field-icon"></label> -->
<!--                           </div> -->
                          <div class="col-xs-12">
                            <span class="button btn-system btn-file btn-block">
                              <span class="fileupload-new">Select</span>
                              <span class="fileupload-exists">Change</span>
                              <input id="image" name="image" type="file">
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-8 pl15">
                      <div class="section mb10">
                        <label for="name2" class="field prepend-icon">
                          <input type="text" name="artefact.title" id="artefact.title" class="event-name gui-input br-light light" placeholder="Artefacts Title">
                          <label for="name2" class="field-icon">
                            <i class="fa fa-tag"></i>
                          </label>
                        </label>
                      </div>
                      <div class="section mb10">
                        <label class="field prepend-icon">
                          <textarea style="height: 160px;" class="gui-textarea br-light bg-light" id="artefact.content" name="artefact.content" placeholder="Artefacts Description"></textarea>
                          <label for="comment" class="field-icon">
                            <i class="fa fa-comments"></i>
                          </label>
                          <span class="input-footer hidden">
                            <strong>Hint:</strong>Don't be negative or off topic! just be awesome...</span>
                        </label>
                      </div>
                    </div>
                  </div>


                </div>
                <div id="tab1_2" class="tab-pane">

                  <div class="section row">
                    <div class="col-md-6">
                      <label for="product-category" class="field select">
                        <select id="artefact.isold" name="artefact.isold">
                          <option selected="selected">Category</option>
                          <option value="1">Old</option>
                          <option value="0">New</option>
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
                    <!-- end section -->

					</div>
					<div class="section row">
                    <div class="col-md-6">
                      <label class="field select">
                        <select id="level" name="product-status" onChange="searchRoom()">
                          <option selected="selected">Floor</option>
<!--                           <option value="1">Basement</option> -->
<!--                           <option value="2">Ground Floor</option> -->
<!--                           <option value="3">Second Floor</option> -->
<!--                           <option value="4">Third Floor</option> -->
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
                    <!-- end section -->

                  </div>
                  <!-- end section row section -->

                  <div class="section row">
                    
                    <!-- end section -->

<!--                     <div class="col-md-4"> -->
<!--                       <label for="product-vendor" class="field prepend-icon"> -->
<!--                         <input type="text" name="product-vendor" id="product-vendor" class="gui-input" placeholder="Room Name..."> -->
<!--                         <label for="product-vendor" class="field-icon"> -->
<!--                           <i class="fa fa-map-marker"></i> -->
<!--                         </label> -->
<!--                       </label> -->
						<div class="col-md-6">
                      <label class="field select">
                        <select id="room" name="artefact.roomid">
                          <option selected="selected">Room</option>
<!--                           <option value="1">Basement</option> -->
<!--                           <option value="2">Ground Floor</option> -->
<!--                           <option value="3">Second Floor</option> -->
<!--                           <option value="4">Third Floor</option> -->
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
<!--                     </div> -->
                    <!-- end section -->
<!--                     <div class="col-md-4"> -->
<!--                       <label for="product-price" class="field prepend-icon"> -->
<!--                         <input type="text" name="product-price" id="product-price" class="gui-input" placeholder="Artefact Tags..."> -->
<!--                         <label for="product-price" class="field-icon"> -->
<!--                          <i class="fa fa-tags"></i> -->
<!--                          </label> -->
<!--                       </label> -->
<!--                     </div> -->

<!--                     <div class="col-md-4"> -->
<!--                       <label for="product-sku" class="field prepend-icon"> -->
<!--                         <input type="text" name="product-sku" id="product-sku" class="gui-input" placeholder="Artefact Date..."> -->
<!--                         <label for="product-sku" class="field-icon"> -->
<!--                           <i class="fa fa-barcode"></i> -->
<!--                         </label> -->
<!--                       </label> -->
<!--                     </div> -->
                    <!-- end section -->

                  </div>
                  <!-- end section row section -->

<!--                   <div class="section"> -->
<!--                     <input id="tagsinput" type="text" value="Book, Photo, Manuscript, Medical Tool"> -->
<!--                   </div> -->
                  <!-- end section row section -->

                  <hr class="short alt">

                  <div class="section row mbn">
<!--                     <div class="col-sm-8"> -->
<!--                       <label class="field option mt10"> -->
<!--                         <input type="checkbox" name="info" checked> -->
<!--                         <span class="checkbox"></span>Save Artefact -->
<!--                         <em class="small-text text-muted">- A Random Unique ID will be generated</em> -->
<!--                       </label> -->
<!--                     </div> -->
                    <div class="col-sm-12" align="right">
                      <p class="text-right" id="button">
                        <button class="btn btn-primary" type="button" onclick="addArtefact()">Add Artefact</button>
                      </p>
                    </div>
                  </div>
                  <!-- end section -->

                </div>
                <div id="tab1_3" class="tab-pane">

                  <div class="section">
                    <label for="lastaddr" class="field prepend-icon">
                      <input type="text" name="lastaddr" id="lastaddr" class="gui-input" placeholder="Street address 2">
                      <label for="lastaddr" class="field-icon">
                        <i class="fa fa-map-marker"></i>
                      </label>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="section">
                    <label class="field select">
                      <select id="location" name="location">
                        <option value="">Select country...</option>
                        <option value="AL">Albania</option>
                        <option value="DZ">Algeria</option>
                        <option value="AD">Andorra</option>
                        <option value="AO">Angola</option>
                        <option value="AI">Anguilla</option>
                        <option value="AG">Antigua and Barbuda</option>
                        <option value="AR">Argentina</option>
                        <option value="AM">Armenia</option>
                        <option value="AW">Aruba</option>
                        <option value="AU">Australia</option>
                        <option value="AT">Austria</option>
                        <option value="AZ">Azerbaijan Republic</option>
                        <option value="BS">Bahamas</option>
                        <option value="BH">Bahrain</option>
                        <option value="BB">Barbados</option>
                        <option value="BE">Belgium</option>
                        <option value="BZ">Belize</option>
                        <option value="BJ">Benin</option>
                        <option value="BM">Bermuda</option>
                        <option value="BT">Bhutan</option>
                        <option value="BO">Bolivia</option>
                        <option value="BA">Bosnia and Herzegovina</option>
                        <option value="BW">Botswana</option>
                        <option value="BR">Brazil</option>
                        <option value="BN">Brunei</option>
                        <option value="BG">Bulgaria</option>
                        <option value="BF">Burkina Faso</option>
                        <option value="BI">Burundi</option>
                        <option value="KH">Cambodia</option>
                        <option value="CA">Canada</option>
                        <option value="CV">Cape Verde</option>
                        <option value="KY">Cayman Islands</option>
                        <option value="TD">Chad</option>
                        <option value="CL">Chile</option>
                        <option value="C2">China Worldwide</option>
                        <option value="CO">Colombia</option>
                        <option value="KM">Comoros</option>
                        <option value="CK">Cook Islands</option>
                        <option value="CR">Costa Rica</option>
                        <option value="HR">Croatia</option>
                        <option value="CY">Cyprus</option>
                        <option value="CZ">Czech Republic</option>
                        <option value="CD">Democratic Republic of the Congo</option>
                        <option value="DK">Denmark</option>
                        <option value="DJ">Djibouti</option>
                        <option value="DM">Dominica</option>
                        <option value="DO">Dominican Republic</option>
                        <option value="EC">Ecuador</option>
                        <option value="EG">Egypt</option>
                        <option value="SV">El Salvador</option>
                        <option value="ER">Eritrea</option>
                        <option value="EE">Estonia</option>
                        <option value="ET">Ethiopia</option>
                        <option value="FK">Falkland Islands</option>
                        <option value="FO">Faroe Islands</option>
                        <option value="FJ">Fiji</option>
                        <option value="FI">Finland</option>
                        <option value="FR">France</option>
                        <option value="GF">French Guiana</option>
                        <option value="PF">French Polynesia</option>
                        <option value="GA">Gabon Republic</option>
                        <option value="GM">Gambia</option>
                        <option value="GE">Georgia</option>
                        <option value="DE">Germany</option>
                        <option value="GI">Gibraltar</option>
                        <option value="GR">Greece</option>
                        <option value="GL">Greenland</option>
                        <option value="GD">Grenada</option>
                        <option value="GP">Guadeloupe</option>
                        <option value="GT">Guatemala</option>
                        <option value="GN">Guinea</option>
                        <option value="GW">Guinea Bissau</option>
                        <option value="GY">Guyana</option>
                        <option value="HN">Honduras</option>
                        <option value="HK">Hong Kong</option>
                        <option value="HU">Hungary</option>
                        <option value="IS">Iceland</option>
                        <option value="IN">India</option>
                        <option value="ID">Indonesia</option>
                        <option value="IE">Ireland</option>
                        <option value="IL">Israel</option>
                        <option value="IT">Italy</option>
                        <option value="JM">Jamaica</option>
                        <option value="JP">Japan</option>
                        <option value="JO">Jordan</option>
                        <option value="KZ">Kazakhstan</option>
                        <option value="KE">Kenya</option>
                        <option value="KI">Kiribati</option>
                        <option value="KW">Kuwait</option>
                        <option value="KG">Kyrgyzstan</option>
                        <option value="LA">Laos</option>
                        <option value="LV">Latvia</option>
                        <option value="LS">Lesotho</option>
                        <option value="LI">Liechtenstein</option>
                        <option value="LT">Lithuania</option>
                        <option value="LU">Luxembourg</option>
                        <option value="MG">Madagascar</option>
                        <option value="MW">Malawi</option>
                        <option value="MY">Malaysia</option>
                        <option value="MV">Maldives</option>
                        <option value="ML">Mali</option>
                        <option value="MT">Malta</option>
                        <option value="MH">Marshall Islands</option>
                        <option value="MQ">Martinique</option>
                        <option value="MR">Mauritania</option>
                        <option value="MU">Mauritius</option>
                        <option value="YT">Mayotte</option>
                        <option value="MX">Mexico</option>
                        <option value="FM">Micronesia</option>
                        <option value="MN">Mongolia</option>
                        <option value="MS">Montserrat</option>
                        <option value="MA">Morocco</option>
                        <option value="MZ">Mozambique</option>
                        <option value="NA">Namibia</option>
                        <option value="NR">Nauru</option>
                        <option value="NP">Nepal</option>
                        <option value="NL">Netherlands</option>
                        <option value="AN">Netherlands Antilles</option>
                        <option value="NC">New Caledonia</option>
                        <option value="NZ">New Zealand</option>
                        <option value="NI">Nicaragua</option>
                        <option value="NE">Niger</option>
                        <option value="NU">Niue</option>
                        <option value="NF">Norfolk Island</option>
                        <option value="NO">Norway</option>
                        <option value="OM">Oman</option>
                        <option value="PW">Palau</option>
                        <option value="PA">Panama</option>
                        <option value="PG">Papua New Guinea</option>
                        <option value="PE">Peru</option>
                        <option value="PH">Philippines</option>
                        <option value="PN">Pitcairn Islands</option>
                        <option value="PL">Poland</option>
                        <option value="PT">Portugal</option>
                        <option value="QA">Qatar</option>
                        <option value="CG">Republic of the Congo</option>
                        <option value="RE">Reunion</option>
                        <option value="RO">Romania</option>
                        <option value="RU">Russia</option>
                        <option value="RW">Rwanda</option>
                        <option value="KN">Saint Kitts and Nevis Anguilla</option>
                        <option value="PM">Saint Pierre and Miquelon</option>
                        <option value="VC">Saint Vincent and Grenadines</option>
                        <option value="WS">Samoa</option>
                        <option value="SM">San Marino</option>
                        <option value="ST">São Tomé and Príncipe</option>
                        <option value="SA">Saudi Arabia</option>
                        <option value="SN">Senegal</option>
                        <option value="RS">Serbia</option>
                        <option value="SC">Seychelles</option>
                        <option value="SL">Sierra Leone</option>
                        <option value="SG">Singapore</option>
                        <option value="SK">Slovakia</option>
                        <option value="SI">Slovenia</option>
                        <option value="SB">Solomon Islands</option>
                        <option value="SO">Somalia</option>
                        <option value="ZA">South Africa</option>
                        <option value="KR">South Korea</option>
                        <option value="ES">Spain</option>
                        <option value="LK">Sri Lanka</option>
                        <option value="SH">St. Helena</option>
                        <option value="LC">St. Lucia</option>
                        <option value="SR">Suriname</option>
                        <option value="SJ">Svalbard and Jan Mayen Islands</option>
                        <option value="SZ">Swaziland</option>
                        <option value="SE">Sweden</option>
                        <option value="CH">Switzerland</option>
                        <option value="TW">Taiwan</option>
                        <option value="TJ">Tajikistan</option>
                        <option value="TZ">Tanzania</option>
                        <option value="TH">Thailand</option>
                        <option value="TG">Togo</option>
                        <option value="TO">Tonga</option>
                        <option value="TT">Trinidad and Tobago</option>
                        <option value="TN">Tunisia</option>
                        <option value="TR">Turkey</option>
                        <option value="TM">Turkmenistan</option>
                        <option value="TC">Turks and Caicos Islands</option>
                        <option value="TV">Tuvalu</option>
                        <option value="UG">Uganda</option>
                        <option value="UA">Ukraine</option>
                        <option value="AE">United Arab Emirates</option>
                        <option value="GB">United Kingdom</option>
                        <option value="US">United States</option>
                        <option value="UY">Uruguay</option>
                        <option value="VU">Vanuatu</option>
                        <option value="VA">Vatican City State</option>
                        <option value="VE">Venezuela</option>
                        <option value="VN">Vietnam</option>
                        <option value="VG">Virgin Islands (British)</option>
                        <option value="WF">Wallis and Futuna Islands</option>
                        <option value="YE">Yemen</option>
                        <option value="ZM">Zambia</option>
                      </select>
                      <i class="arrow double"></i>
                    </label>
                  </div>
                  <!-- end section -->

                  <div class="section row">
                    <div class="col-md-3">
                      <label for="zip" class="field prepend-icon">
                        <input type="text" name="zip" id="zip" class="gui-input" placeholder="Zip">
                        <label for="zip" class="field-icon">
                          <i class="fa fa-certificate"></i>
                        </label>
                      </label>
                    </div>
                    <!-- end section -->

                    <div class="col-md-4">
                      <label for="city" class="field prepend-icon">
                        <input type="text" name="city" id="city" class="gui-input" placeholder="City">
                        <label for="city" class="field-icon">
                          <i class="fa fa-building-o"></i>
                        </label>
                      </label>
                    </div>
                    <!-- end section -->

                    <div class="col-md-5">
                      <label for="states" class="field select">
                        <select id="states" name="states">
                          <option value="">Choose state</option>
                          <option value="AL">Alabama</option>
                          <option value="AK">Alaska</option>
                          <option value="AZ">Arizona</option>
                          <option value="AR">Arkansas</option>
                          <option value="CA">California</option>
                          <option value="CO">Colorado</option>
                          <option value="CT">Connecticut</option>
                          <option value="DE">Delaware</option>
                          <option value="DC">District Of Columbia</option>
                          <option value="FL">Florida</option>
                          <option value="GA">Georgia</option>
                          <option value="HI">Hawaii</option>
                          <option value="ID">Idaho</option>
                          <option value="IL">Illinois</option>
                          <option value="IN">Indiana</option>
                          <option value="IA">Iowa</option>
                          <option value="KS">Kansas</option>
                          <option value="KY">Kentucky</option>
                          <option value="LA">Louisiana</option>
                          <option value="ME">Maine</option>
                          <option value="MD">Maryland</option>
                          <option value="MA">Massachusetts</option>
                          <option value="MI">Michigan</option>
                          <option value="MN">Minnesota</option>
                          <option value="MS">Mississippi</option>
                          <option value="MO">Missouri</option>
                          <option value="MT">Montana</option>
                          <option value="NE">Nebraska</option>
                          <option value="NV">Nevada</option>
                          <option value="NH">New Hampshire</option>
                          <option value="NJ">New Jersey</option>
                          <option value="NM">New Mexico</option>
                          <option value="NY">New York</option>
                          <option value="NC">North Carolina</option>
                          <option value="ND">North Dakota</option>
                          <option value="OH">Ohio</option>
                          <option value="OK">Oklahoma</option>
                          <option value="OR">Oregon</option>
                          <option value="PA">Pennsylvania</option>
                          <option value="RI">Rhode Island</option>
                          <option value="SC">South Carolina</option>
                          <option value="SD">South Dakota</option>
                          <option value="TN">Tennessee</option>
                          <option value="TX">Texas</option>
                          <option value="UT">Utah</option>
                          <option value="VT">Vermont</option>
                          <option value="VA">Virginia</option>
                          <option value="WA">Washington</option>
                          <option value="WV">West Virginia</option>
                          <option value="WI">Wisconsin</option>
                          <option value="WY">Wyoming</option>
                        </select>
                        <i class="arrow double"></i>
                      </label>
                    </div>
                    <!-- end .col8 section -->

                  </div>
                  <!-- end section row section -->

                  <div class="section row mbn">
                    <div class="col-sm-8">
                      <label class="field option mt10">
                        <input type="checkbox" name="info" checked>
                        <span class="checkbox"></span>Save Customer
                        <em class="small-text text-muted">- A Random Unique ID will be generated</em>
                      </label>
                    </div>
                    <div class="col-sm-4">
                      <p class="text-right">
                        <button class="btn btn-primary" type="button">Save Order</button>
                      </p>
                    </div>
                  </div>
                  <!-- end section -->


                </div>
              </div>
            </div>
          </div>
          </form>

          <!-- recent orders table -->
          <div class="panel">
            <div class="panel-menu p12 admin-form theme-primary">
              <div class="row">
                <div class="col-md-5">
                  <label class="field select">
                    <select id="roomFilter" name="filter-category" onchange="searchArt()">
                      
                      
                    </select>
                    <i class="arrow"></i>
                  </label>
                </div>
                <div class="col-md-5">
                  <label class="field select">
                    <select id="categoryFilter" name="filter-status" onchange="searchArt()">
                     <option value="Both">Filter by Category</option>
                      <option value="Both">Both</option>
						<option value="New">New</option>
						<option value="Old">Old</option>
                    </select>
                    <i class="arrow"></i>
                  </label>
                </div>
                <div class="col-md-2">
                  <label class="field select">
                    <select id="page" name="bulk-action" onchange="searchArt()">
                      <option value="5">Page size</option>
                      <option value="5">5</option>
                      <option value="10">10</option>
                      <option value="20">20</option>
                    </select>
                    <i class="arrow double"></i>
                  </label>
                </div>
              </div>
            </div>
            <div class="panel-body pn">
              <div class="table-responsive">
                <table class="table admin-form theme-warning tc-checkbox-1 fs13">
                  <thead>
                    <tr class="bg-light">
                      <th class="">Image</th>
                      <th class="">Title</th>
                      <th class="">Room</th>
                      <th class="">Category</th>
                      <th class="">Operation</th>
                    </tr>
                  </thead>
                  <tbody id="artefact">
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- end: .tray-center -->

        <!-- begin: .tray-right -->
        
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

  <!-- Tagmanager JS -->
  <script src="vendor/plugins/tagsinput/tagsinput.min.js"></script>

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

    // select list dropdowns - placeholder like creation
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

    // Init TagsInput plugin
    $("input#tagsinput").tagsinput({
      tagClass: function(item) {
        return 'label bg-primary light';
      }
    });

  });
  </script>
  <!-- END: PAGE SCRIPTS -->

</body>

</html>
