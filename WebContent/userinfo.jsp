<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
    
    /* setup navigation, content boxes, etc... */
    Administry.setup();

});


/* 修改密码，ajax */
function modifypwd(){
    var newpwd = $("#newpwd").val();
    var conpwd = $("#conpwd").val();

    $.ajax({
        url: 'modifypwd',
        type: 'post',
        data: {
        	newpwd : newpwd,
        	conpwd : conpwd,
        },
        success : function(str){
            $("#message").show(500);
            $("#message").html(str);
            $("#message").hide(3000);
        }
    });
}

/* 修改联系方式，ajax */
function modifycontact(){
    var email = $("#email").val();
    var telphone = $("#telphone").val();

    $.ajax({
        url: 'modifycontact',
        type: 'post',
        data: {
        	email : email,
        	telphone : telphone,
        },
        success : function(str){
            $("#message").show(500);
            $("#message").html(str);
            $("#message").hide(3000);
        }
    });
}

</script>

<body>
    <!-- Header -->
    <header id="top">
        <div class="wrapper">
            <!-- Title/Logo - can use text instead of image -->
            <div id="title"><span>毕业设计指导系统</span></div>
            <!-- Top navigation -->
            <div id="topnav">
                <a href="#"><img class="avatar" SRC="img/user_32.png" alt="" /></a>
                <b>
                    <s:if test='#session.loginUser.role=="sysadmin"'>
                        系统管理员
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        学生
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        导师
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        系管理员
                    </s:elseif>
                </b>界面
                <span>|</span> <a href="logout">注销</a><br />
            </div>
            <!-- End of Top navigation -->
            <!-- Main navigation -->
            <nav id="menu">
                <ul class="sf-menu">
                    <li><a HREF="main.jsp">首页</a></li>
                    <s:if test='#session.loginUser.role=="sysadmin"'>
                        <li><a HREF="college">管理学院</a></li>
                        <li><a HREF="dept">管理专业</a></li>
                        <li><a HREF="class">管理班级</a></li> 
                        <li><a HREF="adduser">注册用户</a></li>
                        <li><a HREF="notice.jsp">发布校级通知</a></li>
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        <li class="current"><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="subtask">选题信息</a></li>
                        <li><a HREF="viewreport">开题报告</a></li> 
                        <li><a HREF="viewinspect">中期检查</a></li>
                        <li><a HREF="mypaper">论文</a></li>
                        <li><a HREF="message">消息</a></li> 
                        </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        <li class="current"><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li><a HREF="tasksoftea">课题状态</a></li> 
                        <li><a HREF="message">消息</a></li>  
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        <li class="current"><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li><a HREF="notice.jsp">发布院级通知</a></li>
                    </s:elseif>
                </ul>
            </nav>
            <!-- End of Main navigation -->
            <!-- Aside links -->
            <aside>
                <b>欢迎您：</b> 
                <a href="#">
                    <s:if test="#session.loginUser.realname==null">
                        <s:property value="#session.loginUser.username" />
                    </s:if>
                    <s:else>
                        <s:property value="#session.loginUser.realname" />
                    </s:else>
                </a>&middot; 
                <b>身份：</b> 
                <a href="#">
                    <s:if test='#session.loginUser.role=="sysadmin"'>
                        系统管理员
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        学生
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        导师
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        系管理员
                    </s:elseif>
                </a>
            </aside>
            <!-- End of Aside links -->
        </div>
    </header>
    <!-- End of Header -->
    
    <!-- Page title -->
    <div id="pagetitle">
        <div class="wrapper">
            <h1>位置>>用户个人信息</h1>
            <!-- Quick search box -->
            <form action="notexist" method="post"><input class="" type="text" id="q" name="q" /></form>
        </div>
    </div>
    <!-- End of Page title -->
    
    <!-- Page content -->
    <div id="page">
        <!-- Wrapper -->
        <div class="wrapper">
        
            <section  class="column width6 first">
            
                <p id="message" class="box box-info half" hidden="true"></p>
                <div class="colgroup leading">
                    <div class="column width3 first">
                            <p>学院：${collegeName }&nbsp;&nbsp;
                                <b>
				                    <s:if test='#session.loginUser.role=="student"'>
				                        学生
				                    </s:if>
				                    <s:elseif test='#session.loginUser.role=="teacher"'>
				                        导师
				                    </s:elseif>
				                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
				                        系管理员
				                    </s:elseif>
                                </b>
                            </p>
                            <p>专业：${deptName }</p>
                            <p>班级：${className }</p>

                    </div>
                    <div class="column width3">
                        <p>姓名：<s:property value="#session.loginUser.realname" /></p>
                        <p>邮箱：<s:property value="#session.loginUser.email" /></p>
                        <p>手机：<s:property value="#session.loginUser.telphone" /></p>
                    </div>
                </div>
                <div class="colgroup leading">
                    <div class="column width3 first">
                    <form id="pwdform">
                    <!-- 
                        <p>
                            <label class="required" for="oldpwd">原密码：</label><br/>
                            <input type="password" id="oldpwd" class="full" name="oldpwd"/>
                        </p>
                     -->

                        <p>
                            <label class="required" for="newpwd">新密码：</label><br/>
                            <input type="password" id="newpwd" class="full" name="newpwd"/>
                        </p>
                        
                        <p>
                            <label class="required" for="conpwd">确认密码：</label><br/>
                            <input type="password" id="conpwd" class="full" name="conpwd"/>
                        </p>
                        
                        <p>
                            <input type="button" class="btn btn-green big" value="修改密码" onclick="modifypwd()"/>
                                 or 
                            <input type="reset" class="btn" value="重置"/>
                        </p>
                    </form>    
                    </div>
                    <div class="column width3">
                    <form id="contactform">
                        <p>
                            <label class="required" for="email">邮箱：</label><br/>
                            <input type="text" id="email" class="full" value="" name="email"/>
                        </p>
                        <p>
                            <label class="required" for="telphone">手机：</label><br/>
                            <input type="text" id="telphone" class="full" value="" name="telphone"/>
                        </p>
                        <p>
                            <input type="button" class="btn btn-green big" value="修改联系方式" onclick="modifycontact()"/>
                                 or 
                            <input type="reset" class="btn" value="重置"/>
                        </p>
                    </form>    
                    </div>
                </div>
                
                <div class="clear">&nbsp;</div>
            </section> 
            
                     
            <!-- Right column/section -->
            <aside class="column width2">
                <jsp:include page="aside.jsp"></jsp:include>
            </aside>
            <!-- End of Right column/section -->
                
        </div>
        <!-- End of Wrapper -->
    </div>
    <!-- End of Page content -->
    
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>