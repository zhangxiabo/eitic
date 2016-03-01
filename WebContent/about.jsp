<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业设计指导系统</title>

<meta name="description" content="毕业设计指导系统" />
<meta name="keywords" content="毕业设计,管理系统" />
<!-- Favicons --> 
<link rel="shortcut icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="icon" type="image/png" HREF="img/favicons/favicon.png"/>
<link rel="apple-touch-icon" HREF="img/favicons/apple.png" />
<!-- Main Stylesheet --> 
<link rel="stylesheet" href="css/style.css" type="text/css" />
<!-- Colour Schemes
Default colour scheme is blue. Uncomment prefered stylesheet to use it.
<link rel="stylesheet" href="css/brown.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/gray.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/green.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/pink.css" type="text/css" media="screen" />  
<link rel="stylesheet" href="css/red.css" type="text/css" media="screen" />
-->
<!-- Your Custom Stylesheet --> 
<link rel="stylesheet" href="css/custom.css" type="text/css" />
<!--swfobject - needed only if you require <video> tag support for older browsers -->
<script type="text/javascript" SRC="js/swfobject.js"></script>
<!-- jQuery with plugins -->
<script type="text/javascript" SRC="js/jquery-1.4.2.min.js"></script>
<!-- Could be loaded remotely from Google CDN : <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script> -->
<script type="text/javascript" SRC="js/jquery.ui.core.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" SRC="js/jquery.ui.tabs.min.js"></script>
<!-- jQuery tooltips -->
<script type="text/javascript" SRC="js/jquery.tipTip.min.js"></script>
<!-- Superfish navigation -->
<script type="text/javascript" SRC="js/jquery.superfish.min.js"></script>
<script type="text/javascript" SRC="js/jquery.supersubs.min.js"></script>
<!-- jQuery form validation -->
<script type="text/javascript" SRC="js/jquery.validate_pack.js"></script>
<!-- jQuery popup box -->
<script type="text/javascript" SRC="js/jquery.nyroModal.pack.js"></script>
<!-- Internet Explorer Fixes --> 
<!--[if IE]>
<link rel="stylesheet" type="text/css" media="all" href="css/ie.css"/>
<script src="js/html5.js"></script>
<![endif]-->
<!--Upgrade MSIE5.5-7 to be compatible with MSIE8: http://ie7-js.googlecode.com/svn/version/2.1(beta3)/IE8.js -->
<!--[if lt IE 8]>
<script src="js/IE8.js"></script>
<![endif]-->
<script type="text/javascript">

$(document).ready(function(){
    
    /* setup navigation, content boxes, etc... */
    Administry.setup();
    

});
</script>
</head>
<body>
    <!-- Header -->
    <header id="top">
        <div class="wrapper-login">
            <!-- Title/Logo - can use text instead of image -->
            <div id="title"><span>毕业设计指导系统</span></div>
            <!-- Main navigation -->
            <nav id="menu">
                <ul class="sf-menu">
                    <li><a href="index.jsp">登录</a></li>
                    <li class="current"><a href="about.jsp">关于</a></li>
                </ul>
            </nav>
            <!-- End of Main navigation -->

        </div>
    </header>
    <!-- End of Header -->
    <!-- Page title -->
    <div id="pagetitle">
        <div class="wrapper-login"></div>
    </div>
    <!-- End of Page title -->
    
    <!-- Page content -->
    <div id="page">
        <!-- Wrapper -->
        <div class="wrapper-login">
                <!-- Login form -->
                <section class="full">                  
                    
                    <div class="box box-info">作者：张夏博</div>
                    <div class="box box-info">学校：北京交通大学海滨学院</div>
                    <div class="box box-info">学院：计算机科学系</div>
                    <div class="box box-info">班级：软件1102</div>
                    <div class="box box-info">导师：陈寒梅</div>
                    <div class="box box-info">时间：2015年</div>
                    <div class="box box-info">项目：毕业设计指导系统</div>
                    
                </section>
                <!-- End of login form -->
                
        </div>
        <!-- End of Wrapper -->
    </div>
    <!-- End of Page content -->
    
    <!-- Page footer -->
    <footer id="bottom">
        <div class="wrapper-login">
            <p>ZhangXiabo &copy; </p>
        </div>
    </footer>
    <!-- End of Page footer -->

<!-- User interface javascript load -->

<script type="text/javascript" SRC="js/administry.js"></script>

</body>
</html>