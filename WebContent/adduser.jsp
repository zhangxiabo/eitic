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
    
    var validator = $("#sampleform").validate({
        rules: {
            username: "required",
            realname: "required",
        },
        messages: {
            username: "请输入帐号",
            realname: "请输入姓名",
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

/* 点击选择学院后向专业列表写入对应专业，ajax */
function getdeptlist(collegeid){
	
    $.get("getdeptlist?collegeid=" + collegeid, function(data){
        each = data.split("|");
	        
        sel = document.getElementById("deptlist");
        sel.options.length = 0;
        
        if(each == ""){
        	sel.options[sel.options.length] = new Option("暂时没有专业","0");
        } else {
        	sel.options[sel.options.length] = new Option("--请选择所在专业--","0");
            for(var i = 0; i < each.length; i++){
                strs = each[i].split(",");
                sel.options[sel.options.length] = new Option(strs[0] + "-" + strs[1],strs[0]);
            }
        }
        
        selclass = document.getElementById("classlist");
        selclass.options.length = 0;
        selclass.options[selclass.options.length] = new Option("--请选择所在班级--","0");
        
    });
}

/* 点击选择专业后向班级列表写入对应班级，ajax */
function getclasslist(deptid){
    
    $.get("getclasslist?deptid=" + deptid, function(data){
        each = data.split("|");
            
        sel = document.getElementById("classlist");
        sel.options.length = 0;
        
        if(each == ""){
            sel.options[sel.options.length] = new Option("暂时没有班级","0");
        } else {
        	sel.options[sel.options.length] = new Option("--请选择所在班级--","0");
            for(var i = 0; i < each.length; i++){
                strs = each[i].split(",");
                sel.options[sel.options.length] = new Option(strs[0] + "-" + strs[1],strs[0]);
            }
        }
    });
}

    /* 提交注册表单，ajax */
	function sub(){
	    var username = $("#username").val();
	    var role = $("#role").val();
	    var realname = $("#realname").val();
	    var collegeid = $("#colleges").val();
	    var deptid = $("#deptlist").val();
	    var classid = $("#classlist").val();
	    
        $.ajax({
            url: 'register',
            type: 'post',
            data: {
                username : username,
                role : role,
                realname : realname,
                collegeid : collegeid,
                deptid : deptid,
                classid : classid
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
                        <li class="current"><a HREF="adduser">注册用户</a></li>
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
            <h1>位置>>注册新用户</h1>
            <!-- Quick search box -->
            <form action="notexist" method="post"><input class="" type="text" id="q" name="q" /></form>
        </div>
    </div>
    <!-- End of Page title -->
    
    <!-- Page content -->
    <div id="page">
        <!-- Wrapper -->
        <div class="wrapper">
        
                <!-- Left column/section -->
                <section class="column width6 first">                   

                    <form id="sampleform" name="sampleform">

                        <fieldset>
                            <legend>注册新用户</legend>
                             
                            <p id="message" class="box box-info half" hidden="true"></p>
                            
                            <p>
                                <label class="required" for="role">用户角色：</label><br/>
                                <select id="role" class="half" name="role">
                                    <option value="student">学生</option>
                                    <option value="teacher">教师</option>
                                    <option value="deptadmin">系管理员</option>
                                </select>
                                初始密码与帐号相同
                            </p>
                            
                            <p>
                                <label class="required" for="realname">真实姓名：</label><br/>
                                <input type="text" id="realname" class="half" value="" name="realname"/>
                            </p>
                        
                            <p>
                                <label class="required" id="lab_colleges"  for="colleges">所在学院：</label><br/>
                                <select id="colleges" class="half" name="collegeid" onchange="getdeptlist(this.value)">
                                    <option value="0">--请选择所在学院--</option>
                                    <s:iterator value="colleges" id="college">
                                        <option value='<s:property value="collegeid" />'><s:property value="collegeid" />-<s:property value="cname" /></option>
                                    </s:iterator>
                                </select>
                            </p>
                            
                            <p>
                                <label for="deptlist">所在专业：</label><br/>
                                <select id="deptlist" class="half" name="deptid" onchange="getclasslist(this.value)">
                                    <option value="0">--请选择所在专业--</option>
                                </select>
                                教师和系管理员可不选专业
                            </p>
                            
                            <p>
                                <label for="classlist">所在班级：</label><br/>
                                <select id="classlist" class="half" name="classid">
                                    <option value="0">--请选择所在班级--</option>
                                </select>
                                教师和系管理员可不选班级
                            </p>
                            
                            <p>
                                <label class="required" for="username">用户帐号：</label><br/>
                                <input type="text" id="username" class="half" value="" name="username"/>
                                （学号或工号）
                            </p>

                            <p>
                                <input type="button" class="btn btn-green big" value="提交" id="submit" onclick="sub()"/>
                                 or 
                                <input type="reset" class="btn" value="重置"/>
                            </p>

                        </fieldset>

                    </form>

                
                </section>
                <!-- End of Left column/section -->
                     
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