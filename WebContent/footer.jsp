<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>

<body>
<!-- Page footer -->
    <footer id="bottom">
        <div class="wrapper">
            <nav>
                <a HREF="main.jsp">首页</a> &middot;
                <s:if test='#session.loginUser.role=="sysadmin"'>
                    <a HREF="college">管理学院</a> &middot;
                    <a HREF="dept">管理专业</a> &middot;
                    <a HREF="class">管理班级</a> &middot;
                    <a HREF="adduser">注册用户</a> &middot;
                    <a HREF="notice.jsp">发布校级通知</a> &middot;
                </s:if>
                <s:elseif test='#session.loginUser.role=="student"'>
                    <a HREF="userinfo">个人信息</a> &middot;
                    <a HREF="subtask">选题信息</a> &middot;
                    <a HREF="viewreport">开题报告</a> &middot;
                    <a HREF="viewinspect">中期检查</a> &middot;
                    <a HREF="mypaper">论文</a> &middot;
                    <a HREF="message">消息</a> &middot;
                </s:elseif>
                <s:elseif test='#session.loginUser.role=="teacher"'>
                    <a HREF="userinfo">个人信息</a> &middot;
                    <a HREF="approval">待我审批</a> &middot;
                    <a HREF="tasksoftea">课题状态</a>  &middot;
                    <a HREF="message">消息</a>   &middot;
                </s:elseif>
                <s:elseif test='#session.loginUser.role=="deptadmin"'>
                    <a HREF="userinfo">个人信息</a> &middot;
                    <a HREF="approval">待我审批</a> &middot;
                    <a HREF="notice.jsp">发布院级通知</a> &middot;
                </s:elseif>
                <a href="logout">注销</a>
            </nav>
            <p>ZhangXiabo &copy; </p>
        </div>
    </footer>
    <!-- End of Page footer -->
    
    <!-- Animated footer -->
    <footer id="animated">
        <ul>
            <li class="current"><a HREF="main.jsp">首页</a></li>
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

            <li><a href="logout">注销</a></li>
        </ul>
    </footer>
    <!-- End of Animated footer -->
    
    <!-- Scroll to top link -->
    <a href="#" id="totop">^ 返回顶部</a>

<!-- Admin template javascript load -->
<script type="text/javascript" SRC="js/administry.js"></script>
</body>
</html>