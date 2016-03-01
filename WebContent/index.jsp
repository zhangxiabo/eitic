<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>毕业设计指导系统</title>

<meta name="description" content="毕业设计指导系统" />
<meta name="keywords" content="毕业设计,指导系统" />
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
    
    // validate signup form on keyup and submit
    var validator = $("#loginform").validate({
        rules: {
            username: "required",
            password: "required"
        },
        messages: {
            username: "请输入您的帐号",
            password: "请输入您的密码"
        },
        // the errorPlacement has to take the layout into account
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent().find('label:first'));
        },
        // set new class to error-labels to indicate valid fields
        success: function(label) {
            // set &nbsp; as text for IE
            label.html("&nbsp;").addClass("ok");
        }
    });

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
                    <li class="current"><a href="#">登录</a></li>
                    <li><a href="about.jsp">关于</a></li>
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
                    
                    <h3>系统登录</h3>
                    
                    <c:choose>
                        <c:when test="${empty message}"></c:when>
                        <c:otherwise>
                            <p class="box box-error">${message}</p>
                        </c:otherwise>
                    </c:choose> 
                    
                    <form id="loginform" method="post" action="login">

                        <p>
                            <label class="required" for="username">帐号：</label><br/>
                            <input type="text" id="username" class="full" value="" name="username"/>
                        </p>
                        
                        <p>
                            <label class="required" for="password">密码：</label><br/>
                            <input type="password" id="password" class="full" value="" name="password"/>
                        </p>
                        
                        <p>
                            <input type="checkbox" id="remember" class="" value="1" name="remember"/>
                            <label class="choice" for="remember">记住我？</label>
                        </p>
                        
                        <p>
                            <input type="submit" class="btn btn-green big" value="登录"/> &nbsp; 
                            <input type="reset" class="btn btn-green big" value="取消"/>
                        </p>
                        <div class="clear">&nbsp;</div>

                    </form>
                    
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