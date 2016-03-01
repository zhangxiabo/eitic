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
    
    var validator = $("#adddept").validate({
        rules: {
            deptid: "required",
            dname: "required"
        },
        messages: {
            deptid: "请输入专业编号",
            dname: "请输入专业名称"
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

/* 点击选择学院后向右边页面列出学院的所有专业，ajax */
function getdeptlist(collegeid){
    
    $.get("getdeptlist?collegeid=" + collegeid, function(data){
        each = data.split("|");
            
        var table = document.getElementById("deptlist");
        table.innerHTML = "";
        var tbody = document.createElement("tbody");
        
        if(each == ""){
        	tr = document.createElement("tr");
        	td = document.createElement("td");
        	td.innerHTML = "暂时没有专业";
        	tr.appendChild(td);
        	tbody.appendChild(tr);
        } else {
            for(var i = 0; i < each.length; i++){
                strs = each[i].split(",");
                tr = document.createElement("tr");
                
                td1 = document.createElement("td");
                td1.innerHTML = strs[0] + "-" + strs[1];
                tr.appendChild(td1);
                
                td2 = document.createElement("td");
                a = document.createElement("a");
                a.href = "deletedept?deptid=" + strs[0];
                a.innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;删除";
                td2.appendChild(a);
                tr.appendChild(td2);
                tbody.appendChild(tr);
            }
        }
        table.appendChild(tbody);
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
                        <li class="current"><a HREF="dept">管理专业</a></li>
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
            <h1>位置>>管理专业</h1>
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
                    <form id="adddept"  method="post" action="adddept">

                        <fieldset>
                            <legend>添加专业</legend>
                            <p>
                                <label class="required" id="lab_colleges"  for="colleges">所属学院：</label><br/>
                                <select id="colleges" class="full" name="collegeid" onchange="getdeptlist(this.value)">
                                    <option value="0">--请选择所属学院--</option>
                                    <s:iterator value="colleges" id="college">
                                        <option value='<s:property value="collegeid" />'><s:property value="collegeid" />-<s:property value="cname" /></option>
                                    </s:iterator>
                                </select>
                            </p>
                            
                            <p>
                                <label class="required" for="deptid">专业编号：</label><br/>
                                <input type="text" id="deptid" class="full" value="" name="deptid"/>
                            </p>
                            
                            <p>
                                <label class="required" for="dname">专业名称：</label><br/>
                                <input type="text" id="dname" class="full" name="dname"/>
                            </p>        
                                                
                            <p>
                                <input type="submit" class="btn btn-green big" value="添加专业"/>
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
                            <legend>已有专业</legend>
                            <table id="deptlist">
                                
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
