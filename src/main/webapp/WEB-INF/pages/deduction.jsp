<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">


</head>
<body>

	<div id="deduction_tb" style="padding:5px;height:auto">
		<!--toolbar-->
		<div class="myButtonDiv">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="deductionDelete()">删除</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="reloadList('deductionList')">刷新</a>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterDeduction()">过滤</a>
		</div>
	</div>

	<div title="扣费列表" style="padding:10px">

		<table id="deductionList" class="easyui-datagrid" style="width:1280px;height:660px"
			   data-options="url:'/deductionAction/findAllDeductionsAsJson.action',rownumbers:true,fitColumns:true,singleSelect:true,pagination:false,toolbar:'#deduction_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="0">id</th>
				<th data-options="field:'customerName',align:'center'" width="100">姓名</th>
				<th data-options="field:'number',align:'center'" width="100">卡号</th>
				<th data-options="field:'bookName',align:'center'" width="200">书名</th>
				<th data-options="field:'isbn',align:'center'" width="100">ISBN</th>
				<th data-options="field:'money',align:'center'" width="60">扣款金额(元)</th>
				<th data-options="field:'createTime',align:'center',formatter:formatDate" width="80">时间</th>
                <th data-options="field:'reason',align:'center'" width="120">扣款原因</th>
            </tr>
			</thead>
		</table>


	</div>



<script type="application/javascript">


    function formatDate(value,row){
        exTime = value;
        var d = new Date(value);
        return $.fn.datebox.defaults.formatter(d);
    }


    function filterDeduction() {
        var dg = $("#deductionList").datagrid();

        dg.datagrid('enableFilter',
            [{
                field:'money',
                type:'numberbox',
                options:{precision:1},
                op:['equal','notequal','less','greater']
            }
            ]

        );
    }


    function deductionDelete() {


        var deduction = getSelected("deductionList");

        if (deduction!=undefined){

            $.messager.confirm("提示","确定删除吗？",function (dt) {

                if (dt){

                    $.post("/deductionAction/ajaxDeleteDeduction.action",{id:deduction.id},function (data) {

						reloadList("deductionList");
                        $.messager.alert("提示","删除成功","info");

                    })


                }else{
                }
            })

        }


    }




</script>

</body>
</html>