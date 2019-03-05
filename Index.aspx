<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="New_Design_Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/sidemenu.css" rel="stylesheet" type="text/css" />
    <link href="css/website.css" rel="stylesheet" type="text/css" />
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .rib
    {
        -moz-transform: rotate(30deg);
     -o-transform: rotate(30deg);
     -webkit-transform: rotate(30deg); 
        }
    </style>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.tinycircleslider.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#rotatescroll').tinycircleslider({ interval: true, snaptodots: true });
        });
	</script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:1366px;position:absolute;top:0px;left:0px;">
    <div class="rib" style="width:31px;height:31px;z-index:1;position:absolute;top:121px;left:160px;background-color:Black;"></div>
    <div id="left" style="background-image:url('images/abc_01.gif');background-repeat:repeat-y;width:179px;height:1000px;float:left;"></div>
    <div id="middle" style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:1000px;width:991px;position:absolute;top:0px;left:179px;z-index:5;">
        <img src="images/logo.png" />
        <div id='cssmenu' style="z-index:10;position:absolute;top:90px;left:-27px;">
            <ul>
               <li><a href='#'><span>Home</span></a></li>
               <li class='has-sub '><a href='#'><span>About Us</span></a>
                  <ul>
                     <li><a href='#'><span>Swaminarayan Sect</span></a>
                     <li><a href='#'><span>Vadtal Dham</span></a></li>
                     <li><a href='#'><span>Holy Places</span></a></li>      
                  </ul>
               </li>
               <li class='has-sub '><a href='#'><span>Daily Darshan</span></a>
                    <ul>
                        <li><a href='#'><span>Shangar Darshan</span></a></li>
                        <li><a href='#'><span>Shayan Darshan</span></a></li>
                        <li><a href='#'><span>Live Video Darshan</span></a></li>
                    </ul>
               </li>
               <li><a href='#'><span>Aacharya Tradition</span></a></li>
               <li class='has-sub '><a href='#'><span>Gallery</span></a>
                    <ul>
                        <li><a href='#'><span>Photo Gallery</span></a></li>
                        <li><a href='#'><span>Video Gallery</span></a></li>
                        <li><a href='#'><span>Divine Music Player</span></a></li>
                    </ul>
               </li>
               <li class='has-sub '><a href='#'><span>Download</span></a>
                    <ul>
                        <li><a href='#'><span>Desktop Wallpaper</span></a></li>
                        <li><a href='#'><span>Mobile Wallpaper</span></a></li>
                        <li><a href='#'><span>Mobile Ringtone</span></a></li>
                        <li><a href='#'><span>Videos</span></a></li>
                    </ul>
               </li>
               <li class='has-sub '><a href='#'><span>E-Literature</span></a>
                    <ul>
                        <li><a href='#'><span>E-Magazine</span></a></li>
                        <li><a href='#'><span>E-Books</span></a></li>
                        <li><a href='#'><span>Articles</span></a></li>
                    </ul>
               </li>
               <li class='has-sub '><a href='#'><span>Activities</span></a>
                    <ul>
                        <li><a href='#'><span>Current Projects</span></a></li>
                        <li><a href='#'><span>Future Projects</span></a></li>
                    </ul>
               </li>
               <li><a href='#'><span>Online Donation</span></a></li>
               <li><a href='#'><span>Contact Us</span></a></li>
            </ul>
        </div>
        <div id="maincontent" style="position:absolute;top:160px;left:0px;width:991px;">
            <img src="new/laxmidev.png" style="float:left;" />
            
            <div id="rotatescroll" style="float:left;position:absolute;top:0px;left:273px;">
		            <div class="viewport">
			        <ul class="overview">
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr3.jpg" /></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr2.jpg" /></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr1.jpg" /></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr4.jpg" /></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr5.jpg" /></a></li>															
			        </ul>
		        </div>
		
		        <div class="dot"></div>
		        <div class="overlay"></div>
		        <div class="thumb"></div>
                
            
	        </div>
               <img src="new/mharajshree.png" style="float:right;" />

        </div>

        
    </div>
    <div id="right" style="background-image:url('images/abc_03.gif');background-repeat:repeat-y;width:196px;height:1000px;float:right;"></div>
    </div>
    </form>
</body>
</html>
