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
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href="${pageContext.request.contextPath}/bookAction/findAllBooks.action">书刊管理</a></span>
			<ul>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>书刊信息维护</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>添加图书</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>图书</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>添加图书</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>添加图书</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
			</ul>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href="${pageContext.request.contextPath}/customerAction/findAllCustomers.action">读者管理</a></span>
			<ul>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
			</ul>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=borrow/add'>借阅图书</a></span>
			<%--<ul>--%>

				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=borrow/add'>借阅图书</a></li>--%>
				<%--&lt;%&ndash;<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>归还图书</a></li>&ndash;%&gt;--%>
			<%--</ul>--%>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=borrow/query'>归还图书</a></span>
			<%--<ul>--%>

			<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=borrow/add'>借阅图书</a></li>--%>
			<%--&lt;%&ndash;<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>归还图书</a></li>&ndash;%&gt;--%>
			<%--</ul>--%>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=statistical/queryButtons'>查询统计</a></span>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=payment/query'>缴费管理</a></span>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/cardAction/findAllCards.action'>套餐管理</a></span>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/roomAction/findAllRooms.action'>书室管理</a></span>
		</li>
		<li>
			<span><a target="right" style="font-size:16px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/shelfAction/findAllShelfs.action'>书架管理</a></span>
		</li>

		<%--<li>--%>
			<%--<span><a target="right" style="font-size:16px;color:black;text-decoration : none" >查询管理</a></span>--%>
			<%--<ul>--%>
				<%--&lt;%&ndash;<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/go.action?to=borrow/query'>借阅查询</a></li>&ndash;%&gt;--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
			<%--</ul>--%>
		<%--</li>--%>
		<%--<li>--%>
			<%--<span><a target="right" style="font-size:16px;color:black;text-decoration : none" >系统管理</a></span>--%>
			<%--<ul>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/cardAction/findAllCards.action'>套餐管理</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/roomAction/findAllRooms.action'>书室管理</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='${pageContext.request.contextPath}/shelfAction/findAllShelfs.action'>书架管理</a></li>--%>
				<%--<li><a target="right" style="font-size:15px;color:black;text-decoration : none" href='userAction_showAllUsers'>人员管理</a></li>--%>
			<%--</ul>--%>
		<%--</li>--%>




	</ul>

</body>
</html>