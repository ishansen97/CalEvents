

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
    <!-- Webmaker metas -->
	<meta content="holidayalbum" name="webmaker:tags">
  
    <title>Photo Album</title>

    <style>
        h1, h2, h3, h4 {
            /* The font-family style will apply our font 'Indie Flower' to the headings.*/
            font-family: 'Indie Flower', cursive;
        }
        
        body {
            font-family:Georgia;
            font-size:13px;
            line-height:1.5;
            color:#999999;
            background:url('http://farm2.staticflickr.com/1379/1347700125_671c3e035f_b.jpg') top center;
            background-size:cover;
        }
        header {

        }
        h1.logo {
            color:white;
            padding:4%;
            border-radius:50%;
            font-size:50px;
            font-style:italic;
            
            /* Shadow behind text */
            text-shadow: 1px 1px 2px #6f828f;
            filter: dropshadow(color=#6f828f, offx=1, offy=1);

        }
        
        
        h2.title {
            font-weight:normal;
            font-style:italic;
            color:white;
            line-height:26px;
            font-size:34px;
        }

        /* Intro */        
        .intro-block p {
            font-size:18px;
            font-style:italic;
            color:#595959;
            margin:40px 0;
        }
    
        /* Photo */
        .image {
            -webkit-box-shadow:  0px 0px 2px 4px rgba(0, 0, 0, 0.1);
                    box-shadow:  0px 0px 2px 4px rgba(0, 0, 0, 0.1);
        }
        .image h2 {
            font-size: 16px;
        }
        .image img {
            min-height:230px;
            max-height:230px;
            border-left:10px solid white;
            border-right:10px solid white;
            border-top:10px solid white;
            -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
            -moz-box-sizing: border-box; /* Firefox, other Gecko */
            box-sizing: border-box; /* Opera/IE 8+ */
        }
        
        .zoom-on-hover {
            transition: all 0.5s ease-in-out;
            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
        }
        .zoom-on-hover:hover {
            -moz-transform: scale(1.1);
            -webkit-transform: scale(1.1);
            -o-transform: scale(1.1);
            -ms-transform: scale(1.1);
            transform: scale(1.1);
        }
        
        /* Rotate the images */
        .rotate-right {
            -moz-transform:rotate(2deg);
            -webkit-transform: rotate(2deg);
            -o-transform:rotate(2deg);
            -ms-transform:rotate(2deg);
            transform:rotate(2deg);
       }
       .rotate-left {
            -moz-transform:rotate(-2deg);
            -webkit-transform: rotate(-2deg);
            -o-transform:rotate(-2deg);
            -ms-transform:rotate(-2deg);
            transform:rotate(-2deg);
       }
       
        .caption {
            color:#999999;
            background: white;
            font-style:italic;
        }
        .caption h2 {
            font-size:20px;
        }
            
        /* Footer */
        .footer-wrap {
            margin: 0 2%;
            padding: 30px 0 50px 0;
            border-top: 1px solid white;
            color: white;
            
            /* Shadow behind text */
            text-shadow: 1px 1px 1px #6f828f;
            filter: dropshadow(color=#6f828f, offx=1, offy=1);
        }
        footer a {
            color: white;
        }
        footer small {
            font-size: 12px;
        }
      
            body, html {
            margin: 0;
            padding: 0
        }
        a {
            color: #000000;
        }
        h1 {
            font-size: 24px;
        }
        h2 {
            font-size: 20px;
        }
        h3 {
            font-size: 18px;
        }
        h4 {
            font-size: 16px;
        }
        ul {
            margin-left: 0;
            padding-left: 1em;
            line-height: 1.5em;
        }
        hr {
            clear: both;
        }
    
        /* Layout */
        footer, .wrapper {
            width: 80%;
            max-width: 708px;
            min-width: 550px;
            margin: 0 auto;
        }
        section {
            width: 100%;
        }
    
        /* Header */
        header {
            padding: 30px 0;
            text-align: left;
        }
        header h1.logo {
            display: inline-block;
            margin: 0;
        }
        header h2.title {
            display: inline-block;
            float: right;
            padding: 4%;
        }
    
        /* Footer */
        footer {
            text-align: center;
        }
        .footer-wrap {
            margin: 0 2%;
            padding: 30px 0 50px 0;
        }
    
        /* Grids */
        ul.grid {
            margin: 20px 0;
            padding: 0;
            list-style: none;
        }
        ul.grid li {
            position: relative;
            margin: 3% 2%;
        }
        ul.grid li:last-child {
            margin: 0 2%;
        }
        ul.grid li a {
            display: block;
            cursor: pointer;
            text-decoration: none;
        }
        ul.grid.half-width li {
            width: 46%;
            margin: 2%;
            float: left;
        }
        ul.third-width li {
            width:29.3%;
            margin:0 2% 2%;
            float:left;
        }
        
        /* Photo */
        .image {
            z-index: 2;
            position: relative;
            overflow: hidden;
        }
        .image img {
            position: relative;
            display: block;
            width: 100%;
            height: auto;
        }
        .image h2 {
            margin: 0;
        }
        
        /* Caption */
        .caption {
            margin: 0;
            padding: 20px;
            width: 100%;
            display: block;
            -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
            -moz-box-sizing: border-box; /* Firefox, other Gecko */
            box-sizing: border-box; /* Opera/IE 8+ */
        }
        
        /* Column */
        .column {
            width:96%;
            margin:2%;
            float:none;
            clear:both;
        }
    
        /* Group / Clear floating */
        .group:after {
            visibility: hidden;
            display: block;
            content: "";
            clear: both;
            height: 0;
        }

    </style>
</head>
<body>
    
    <header>
        <div class="wrapper group">
            
            <h1 class="logo">GALLERY</h1>
            
            
           
            <h2 class="title">Photo album</h2>
        </div>
    </header>

    <div class="wrapper group">
        
        <section id="content">    
           
            <ul class="grid half-width group">
                
                <!-- 
                    The picture below is contained in a <li> which h
                -->
                <li class="zoom-on-hover">
                    <!--
                        <a> This is a link tag. It creates a link to another page on the internet.
                        If you want to change where the link goes just paste the new link between the "" below.
                    -->
                    <a href="http://www.flickr.com/photos/84923476@N00/309452844/">
                        <div class="image">
                            <!--
                               <img> This is the img tag. We are using images from flickr but you could use images
                               from nearly anywhere online. If you have your own Flickr or Instagram account then you can use those.
                               Just change the 'src' below to point to your image.
                            -->
                            <img src="http://farm1.staticflickr.com/111/309452844_365dd1a323_n.jpg">
                            <div class="caption">
                                <h2>Beach Gazebo</h2>
                            </div>
                        </div>
                    </a>
                </li>
              
                <!-- 
                    A picture 
                -->
                <li class="zoom-on-hover">
                    <a href="http://www.flickr.com/photos/john-baldeagle/8882967944/">
                        <div class="image">
                            <img src="http://farm4.staticflickr.com/3566/3768932483_962064e6d8_n.jpg">
                            <div class="caption">
                                <h2>Beach huts</h2>
                            </div>
                        </div>
                    </a>
                </li>
                
                <!-- 
                    A picture 
                -->
                <li class="zoom-on-hover">
                    <a href="http://www.flickr.com/photos/33887484@N08/3180227438/">
                        <div class="image">
                            <img src="http://farm4.staticflickr.com/3481/3180227438_983331494a_n.jpg">
                            <div class="caption">
                                <h2>Beach Cozumel</h2>
                            </div>
                        </div>
                    </a>
                </li>
                
                <!-- 
                    A picture 
                -->
                <li class="zoom-on-hover">
                    <a href="http://www.flickr.com/photos/46857557@N00/98545348/">
                        <div class="image">
                            <img src="http://farm1.staticflickr.com/37/98545348_a87b3ca842_n.jpg">
                            <div class="caption">
                                <h2>Beach Sunrise</h2>
                            </div>
                        </div>
                    </a>
                </li>
            </ul>

        </section>
    
    </div>
    
    <!--
        This is the footer of the page.
        We have used it to credit the sources of the content on this page
        if they haven't been credited elsewhere. To be a good net citizen
        you should do the same :)
    -->
    <footer>
        <div class="footer-wrap">
            <small>All images taken from <a href="http://www.flickr.com">Flickr</a></small> and linked to the source image.
        </div>
    </footer>


  
</body></html>