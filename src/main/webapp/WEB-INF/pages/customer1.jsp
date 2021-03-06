<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎使用***图书借阅系统</title>


	<script type="text/javascript" >

	</script>



</head>
<body>

	<div title="读者列表" style="padding:10px">

		<table id="bookList" class="easyui-datagrid"
			   data-options="url:'/customerAction/findAllCustomersAsJson.action',fitColumns:true,singleSelect:true,pagination:true,toolbar:'#reader_tb'">
			<thead>
			<tr>
				<th data-options="field:'number',align:'center'" width="80">读者ID</th>
				<th data-options="field:'customerName',align:'center'" width="100">姓名</th>
				<!--<th data-options="field:'listprice',align:'center'" width="80">图书价格</th>-->
				<!--<th data-options="field:'unitcost',align:'center'" width="80">数量</th>-->
				<!--<th data-options="field:'attr1',align:'center'" width="150">作者</th>-->
				<th data-options="field:'status',align:'center'" width="50">状态</th>
			</tr>
			</thead>
		</table>


	</div>


	<!--toolbar-->
	<div id="reader_tb">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin:3px;" onclick="readerAdd()">添加</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="readerEdit()">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="">查看</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="readerDelete()">删除</a>
	</div>

	<!--toolbar for add reader-->
	<div id="reader_add_bt" style="display: none">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin:3px;">添加</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('readerAdd')">取消</a>
	</div>

	<!--toolbar for edit reader-->
	<div id="reader_edit_bt" style="display: none">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin:3px;">修改</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('readerEdit')">取消</a>
	</div>


	<!--add-->
	<div id="readerAdd" style="display: none;text-align: center" >

		<form id="readerAddForm" method="post" style="margin: 20px">
			<div>
				<label for="name">书名:</label>
				<input class="easyui-validatebox" type="text" name="readerName" data-options="required:true" />
			</div>
			<div>
				<label for="email">作者:</label>
				<input class="easyui-validatebox" type="text" name="author" data-options="required:true" />
			</div>
			<div>
				<label for="email">价格:</label>
				<input class="easyui-validatebox" type="text" name="price" data-options="required:true" />
			</div>
		</form>
	</div>


	<!--edit-->
	<div id="readerEdit" style="display: none;text-align: center" >

		<form id="readerEditForm" method="post" style="margin: 20px" class="easyui-form">
			<div>
				<label for="name">书名:</label>
				<input class="easyui-validatebox" type="text" name="itemid" data-options="required:true" />
			</div>
			<div>
				<label for="email">作者:</label>
				<input class="easyui-validatebox" type="text" name="attr1" data-options="required:true" />
			</div>
			<div>
				<label for="email">价格:</label>
				<input class="easyui-validatebox" type="text" name="status" data-options="required:true" />
			</div>
		</form>
	</div>


</body>
</html>