<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>left</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tree/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/demo.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/blue/pageCommon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-1.4.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript">
	$().ready(function(){
		$("#tree").tree({
		"text":"Books", 
		"state":"open", 
		"attributes":{ 
		"url":"/demo/book/abc", 
		"price":100 
	})
	});
	
	$("#tree").tree({
		"text":"Books", 
		"state":"open", 
		"attributes":{ 
		"url":"/demo/book/abc", 
		"price":100 
		
	});
		
	
	</script>
</head>
<body>
	<div class="demo-info">
		<div class="demo-tip icon-tip"></div>
		<div>欢迎使用</div>
	</div>
	<div style="margin:10px 0;"></div>
	<ul id="tree"></ul> 
	<ul class="easyui-tree">
		<li>
			<span><a target="right" style="font-size:18px;color:black;text-decoration : none" >后台管理</a></span>
			<ul>
				<li data-options="state:'open'">
					<span ><a target="right" style="font-size:16px;color:black;text-decoration : none" >文档管理</a></span>
									<ul>
										<li>
											<span><a target="right" style="font-size:15px;color:black;text-decoration : none" href='businessAction_findCPs.action'>集团组成</a></span>
										</li>
									
										<li>
											<span><a target="right" style="font-size:15px;color:black;text-decoration : none" href='businessAction_findAllNews.action?page=1'>业界动态</a></span>
										</li>
										<li>
											<span><a target="right" style="font-size:15px;color:black;text-decoration : none" href='businessAction_findAllBusiness.action?page=1'>业务资源</a></span>
										</li>
										<li>
											<span><a target="right" style="font-size:15px;color:black;text-decoration : none" href='businessAction_getPicList.action?page=1'>图片展示</a></span>
										</li>
										<li>
											<span><a target="right" style="font-size:15px;color:black;text-decoration : none" href='businessAction_findAllUs.action'>关于我们</a></span>
										</li>
									</ul>
					</li>
				</ul>
			
				</li>
				
				<li>
					<span><a target="right" style="font-size:16px;color:black;text-decoration : none" >系统管理</a></span>
					
					<ul>
						<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>

</body>
</html>