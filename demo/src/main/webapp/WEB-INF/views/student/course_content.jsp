<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%    
String path = request.getContextPath();    
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。

String username = (String)session.getAttribute("username");
	if(username==null){
		response.sendRedirect("login");
	}
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程详情页</title>
	<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/fontAwesome/font-awesome.min.css">
	<link rel="stylesheet" href="<%=path%>/static/css/base.css">
	<link rel="stylesheet" href="<%=path%>/static/css/index.css">

	<script src="<%=path%>/static/js/jquery.min.js"></script>
	<script src="<%=path%>/static/js/bootstrap.min.js"></script>
	<script src="<%=path%>/static/js/index.js"></script>
</head>
<body>

<!-- header-nav -->
<div class="header-nav">
	<div class="wrap-1200">
		<div class="welcome-title">欢迎来到study-online</div>
		<ul>
				<li class="udown-tip">
					<a href="javascript:void(0)">我的</a>
					<div class="udown-message">
						<!-- top -->
						<div class="udown-top">
							<div class="left">
								<a href="${pageContext.request.contextPath}/home.jsp"><img src="<%=path%>/static/images/user-img.jpg" alt=""></a>
							</div>
							<div class="right">
								<div class="head">
									<p><%=username%></p>
								</div>
								<p>好好学习，天天向上</p>
						</div>
						<!-- bottom -->
						<div class="udown-bottom">
							<a href="${pageContext.request.contextPath}/user/set.html" class="per-set"><i class="fa fa-gear"></i>个人设置</a>
							<a href="${pageContext.request.contextPath}/logout" class="login-out"><i class="fa fa-power-off"></i>退出系统</a>
						</div>
					</div>
				</li>
		</ul>
	</div>
</div>
<!-- /header-nav -->
<!-- header-content -->
<div class="header-content">
	<div class="wrap-1200">
		<div class="logo-field">
			<a href="#"><img src="<%=path%>/static/images/logo.png" alt=""></a>
		</div>
		<form action="">
			<div class="search-field">
				<input type="text" placeholder="搜索课程资源" value="" class="search-input">
				<a href="#"><i class="fa fa-search"></i></a>
			</div>
		</form>
	</div>
</div>
<!-- /header-content -->
<div class="main-botnav">
	<div class="wrap-1200">
		<ul>
            <li><a href="${pageContext.request.contextPath}/course/toIndex">首页</a> </li>
		</ul>
	</div>
	
</div>
<!-- class-header -->


<!-- /class-header -->

<!-- 课程介绍部分 -->
<div class="mc-intro-con">
	<div class="wrap-1200">
		<div class="mc-intro-part">
			<img src="<%=path%>/static/images/${course.picurl}" alt="课程图片">
			<div class="mc-message">
				<h3>${course.coursename}</h3>
				<div class="mes-detail">
					<p>课程介绍</p>
					<div>
						${course.description}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /课程介绍部分 -->

<!-- main-part -->
<div class="main-part">
	<div class="wrap-1200">
		
		
		<div class="main-partL">
			<ul class="c-list">
			    <li class="c-chanel">课程章节</li>
                    <c:forEach var="chapter" items="${cou_details_list}" varStatus="status">
						<div class="c-chapter">
							<h3>
								<i class="fa fa-reorder left"></i>
								<strong>第${status.count}章</strong>
								<span style="padding-left:600px;"><a href="${pageContext.request.contextPath}/courseDetail/studyChapter?classid=${chapter.classid}">学习</a></span>
							</h3>
							
						</div>
					</c:forEach>
			</ul>

		</div>
	</div>
</div>
<!-- /main-part -->


<!-- footer -->
<div class="footer">
 <div class="wrap-1200">
 	<ul>
		<li><a href="#">关于我们</a></li>
		<li><a href="#">意见反馈</a></li>
		<li><a href="#">友情链接</a></li>
		<li><a href="#">联系我们</a></li>
		<li><a href="#">讲师招聘</a></li>
		<li><a href="#">网站地图</a></li>

		<li class="pull-right"><a href="${pageContext.request.contextPath}/administrator/a-login.html">管理员登录</a></li>
	</ul>
	<p>备案号:1234567890123456789</p>
 </div>	
</div>	
<!-- /footer -->
</body>
</html>