<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="New_Design_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('#rotatescroll').tinycircleslider({ interval: true, snaptodots: true });
         });
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-image:url('images/abc_02.gif');background-repeat:repeat-y;height:auto;width:991px;float:left;">
    <div style="float:left;width:100%;height:500px;margin-top:10px;">
 <img src="Prabhu/3.png" style="float:left;margin-left:15px;" alt="Laxmiji" />
            
            <div id="rotatescroll" style="float:left;position:absolute;top:0px;left:245px;">
		            <div class="viewport">
			        <ul class="overview">
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="Prabhu/1.png" alt="img1"/></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="Prabhu/2.png" alt="img2"/></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="Prabhu/1_2.png" alt="img3"/></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr4.jpg" alt="img1"/></a></li>
				        <li><a href="http://www.baijs.nl"><img class="sldimg" src="images/hdr5.jpg" alt="img1"/></a></li>															
			        </ul>
		        </div>
		
		        <div class="dot"></div>
		        <div class="overlay"></div>
		        <div class="thumb"></div>
                
            
	        </div>
               <img src="images/swami.png" style="float:right;margin-right:15px;" alt="swami" /></div>
          <div style="float:left;height:300px;width:600px;padding:10px;text-align:justify;text-justify:inter-word;color:#7d0f1e;">
                  <h2 style="color:#056a8f;">Welcome to Vadtaldham</h2><hr />
                  <span style="color:#7d0f1e;">Shri Swaminarayan Mandir Vadtal, the  head quarter of Shri LaxmiNarayan Dev Gadi. This temple contains three main shrines. Among which the central shrine is consecrated by installing the idols of Shri LaxmiNarayan Dev.  On the right of this, the idols of Shri Radha Krishna accompanied with Supreme Lord Shri Swaminarayan in the form of Shri HariKrishna Maharaj are installed and on the left of Shri LaxmiNarayan Dev the idols of Shri Vasudev, Shri Dhamapita and Bhaktimata are installed. These idols in the temple were installed by Bhagwan Swaminarayan on 3rd November 1824, amidst the holy chants of Vedic hymns and devotional fervor of the installation ceremony. 
                  The temple in Vadtal, also known as Vadtal Swaminarayan. This temple having lotus shaped plinth is a rare architectural specimen. The nine domes on the temple adores the elevation of the temple.</span>
          </div>
          <div style="float:left;height:300px;width:300px;padding:10px;text-align:justify;text-justify:inter-word;color:#058f2c;">
            <h2 style="color:#056a8f;">Latest News</h2><hr />
          </div>
          </div>
</asp:Content>

