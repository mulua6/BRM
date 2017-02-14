<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎使用安东尼图书借阅系统</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/css/demo.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/css/brm.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/datagrid-filter.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/brm.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/locale/easyui-lang-zh_CN.js"></script>


	<script type="text/javascript" >

		function addOrSelectTab(tabName,url) {


			if ($("#mainTab").tabs("exists",tabName)){

				$("#mainTab").tabs('select',tabName);
			}else {

				$("#mainTab").tabs("add",{

					id:tabName,
					title:tabName,
					href:url,
					closable:true
				});

			}


			$("#dd").dialog({
				title: '图书管理',
				width: 900,
				height: 600
			});

		}

	</script>



</head>
<body class="easyui-layout" style="">
	<div style="margin:20px 0;"></div>

		<!--顶部-->
		<div data-options="region:'north'" style="height:50px;background-image: url(/res/img/header_bg.png)  ;    border:1px solid #def;  background-size: cover;   -webkit-background-size: cover;   -moz-background-size: cover;   -o-background-size: cover;">
			<h2 style="text-align: center;margin-top: 8px">安东尼绘本馆-水岸鑫城</h2>
		</div>

		<!--底部-->
		<%--<div data-options="region:'south',split:true" style="height:50px;">--%>
			<%--<h2 style="text-align: center">***版权所有</h2>--%>
		<%--</div>--%>


		<!--<div data-options="region:'east',split:true" title="East" style="width:180px;">-->
			<!--<ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true"></ul>-->
		<!--</div>-->


		<div data-options="region:'west',split:true" title="欢迎使用" style="width:150px;">
			<div class="easyui-accordion" data-options="fit:false,border:false,multiple:true">


				<div title="借阅管理"  data-option="collapsed:false,collapsible:false,height:auto" style="padding:10px;overflow:auto;">
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('借还图书','${pageContext.request.contextPath}/go.action?to=borrow')">借还图书</a><br/>
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('查询记录','${pageContext.request.contextPath}/go.action?to=borrowHistory')">查询记录</a>
				</div>


				<div title="基础模块"  data-option="collapsed:false,collapsible:false,height:auto,selected:true" style="padding:5px">
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('图书管理','${pageContext.request.contextPath}/go.action?to=book')">图书管理</a><br/>
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('读者管理','${pageContext.request.contextPath}/go.action?to=customer')">读者管理</a><br/>
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('套餐管理','${pageContext.request.contextPath}/go.action?to=card')">套餐管理</a><br/>
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('书架管理','${pageContext.request.contextPath}/go.action?to=shelf')">书架管理</a>
				</div>
				<div title="财务模块"  data-option="collapsed:false,collapsible:false,height:auto" style="padding:5px">
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('缴费查询','${pageContext.request.contextPath}/go.action?to=payment')">缴费查询</a><br/>
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('扣费查询','${pageContext.request.contextPath}/go.action?to=deduction')">扣费查询</a><br/>
					<a class="easyui-linkbutton" data-options="" style="margin:5px;" onclick="addOrSelectTab('财务统计','${pageContext.request.contextPath}/go.action?to=count')">财务统计</a><br/>
				</div>
			</div>
		</div>
		<div data-options="region:'center'">

			<!--tabs页-->
			<div id="mainTab" class="easyui-tabs" data-options="fit:true,border:false,plain:true">


				<div id="main" title="图书借阅系统" data-options="" style="padding:10px">
					欢迎使用安东尼图书借阅系统

				</div>


				<!--<div title="DataGrid" style="padding:5px">-->
					<!--<table class="easyui-datagrid"-->
							<!--data-options="url:'datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">-->
						<!--<thead>-->
							<!--<tr>-->
								<!--<th data-options="field:'itemid'" width="80">Item ID</th>-->
								<!--<th data-options="field:'productid'" width="100">Product ID</th>-->
								<!--<th data-options="field:'listprice',align:'right'" width="80">List Price</th>-->
								<!--<th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>-->
								<!--<th data-options="field:'attr1'" width="150">Attribute</th>-->
								<!--<th data-options="field:'status',align:'center'" width="50">Status</th>-->
							<!--</tr>-->
						<!--</thead>-->
					<!--</table>-->
				<!--</div>-->
			</div>
		</div>
</body>
</html>