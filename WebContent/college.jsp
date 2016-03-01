<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>

<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
    
    /* setup navigation, content boxes, etc... */
    Administry.setup();
    
    var validator = $("#addcollege").validate({
        rules: {
            collegeid: "required",
            collname: "required"
        },
        messages: {
        	collegeid: "请输入学院编号",
        	collname: "请输入学院名称"
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
                        <li class="current"><a HREF="college">管理学院</a></li>
                        <li><a HREF="dept">管理专业</a></li>
                        <li><a HREF="class">管理班级</a></li> 
                        <li><a HREF="adduser">注册用户</a></li>
                        <li><a HREF="notice.jsp">发布校级通知</a></li>
                    </s:if>
                    <s:elseif test='#session.loginUser.role=="student"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="subtask">选题信息</a></li>
                        <li><a HREF="viewreport">开题报告</a></li> 
                        <li><a HREF="viewinspect">中期检查</a></li>
                        <li><a HREF="mypaper">论文</a></li>
                        <li><a HREF="message">消息</a></li> 
                        </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li><a HREF="tasksoftea">课题状态</a></li> 
                        <li><a HREF="message">消息</a></li>  
                    </s:elseif>
                    <s:elseif test='#session.loginUser.role=="deptadmin"'>
                        <li><a HREF="userinfo">个人信息</a></li>
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
            <h1>位置>>管理学院</h1>
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
                <div class="colgroup leading">
                    <div class="column width3 first">
                    <form id="addcollege"  method="post" action="addcollege">

                        <fieldset>
                            <legend>添加学院</legend>
		                    <p>
                                <label class="required" for="collegeid">学院编号：</label><br/>
                                <input type="text" id="collegeid" class="full" value="" name="collegeid"/>
                            </p>
		                    
                            <p>
                                <label class="required" for="collname">学院名称：</label><br/>
                                <input type="text" id="collname" class="full" name="collname"/>
                            </p>		
                                                
	                        <p>
	                            <input type="submit" class="btn btn-green big" value="添加学院"/>
	                            or 
	                            <input type="reset" class="btn" value="重置"/>
	                        </p>		                    
		                    
		                </fieldset>
		            </form>
		            </div>
                </div>

                <div class="colgroup leading">
                    <div class="column width3 first">
                        <fieldset>
                            <legend>已有学院</legend>
                            <table>
	                            <s:iterator value="colleges">
	                               <tr>
	                                   <td>
	                                       <s:property value="collegeid" />-<s:property value="cname" />
	                                   </td>
	                                   <td>&nbsp;&nbsp;&nbsp;&nbsp;
	                                       <a href="deletecoll?collegeid=<s:property value="collegeid" />">删除</a>
	                                   </td>
                                   </tr>
                                </s:iterator>
                            </table>
                        </fieldset>
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
