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
    
    /* datatable */
    $('#inbox').dataTable();
    
    $('#outbox').dataTable();
    
    /* expandable rows */
    Administry.expandableRows();

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
                        <li><a HREF="college">管理学院</a></li>
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
                        <li class="current"><a HREF="message">消息</a></li> 
                        </s:elseif>
                    <s:elseif test='#session.loginUser.role=="teacher"'>
                        <li><a HREF="userinfo">个人信息</a></li>
                        <li><a HREF="approval">待我审批</a></li>
                        <li><a HREF="tasksoftea">课题状态</a></li> 
                        <li class="current"><a HREF="message">消息</a></li>  
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
            <h1>位置>>消息管理</h1>
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
            
                <h2>要发送消息<a href="tosend">点这里</a></h2>
                
                <hr>
                
                <h4>收件箱</h4>
                <table class="display stylized" id="inbox">
                    <thead>
                        <tr>
                            <th>标题</th>
                            <th>发件人ID</th>
                            <th>时间</th>
                            <th>删除</th>
                            <th>查看</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="inbox" id="in">
                        <tr>
                            <td><a href="detailmess?messageid=<s:property value="messageid" />"><s:property value="title" /></a></td>
                            <td><s:property value="fromid" /></td>
                            <td><s:property value="subtime" /></td>
                            <td><a href="deletemess?messageid=<s:property value="messageid" />">删除</a></td>
                            <td><a href="detailmess?messageid=<s:property value="messageid" />">查看</a></td>
                        </tr>
                    </s:iterator>

                    </tbody>
                </table>
            
                <br><hr>
                
                <h4>发件箱</h4>
                <table class="display stylized" id="outbox">
                    <thead>
                        <tr>
                            <th>标题</th>
                            <th>收件人ID</th>
                            <th>时间</th>
                            <th>删除</th>
                            <th>查看</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="outbox" id="out">
                        <tr>
                            <td><a href="detailmess?messageid=<s:property value="messageid" />"><s:property value="title" /></a></td>
                            <td><s:property value="toid" /></td>
                            <td><s:property value="subtime" /></td>
                            <td><a href="deletemess?messageid=<s:property value="messageid" />">删除</a></td>
                            <td><a href="detailmess?messageid=<s:property value="messageid" />">查看</a></td>
                        </tr>
                    </s:iterator>

                    </tbody>
                </table>


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