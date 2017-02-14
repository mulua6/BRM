<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">


	<script type="text/javascript" >

	</script>



</head>
<body>

	<div title="财务统计" style="padding:10px">

		<table id="countList" class="easyui-datagrid"
			   data-options="url:'/paymentAction/ajaxCountAllPayments.action',rownumbers:true,fitColumns:true,singleSelect:true,pagination:false,toolbar:'#count_tb'">
			<thead>
			<tr>
				<th data-options="field:'totalSum',align:'center'" width="100">总收入(元)</th>
				<th data-options="field:'moneySum',align:'center'" width="100">套餐费总收入(元)</th>
				<th data-options="field:'depositSum',align:'center'" width="200">押金总和(元)</th>
				<th data-options="field:'customerDepositSum',align:'center'" width="100">押金剩余总和(元)</th>
				<th data-options="field:'deductionMoenySum',align:'center'" width="60">扣除押金总和(元)</th>
            </tr>
			</thead>
		</table>


	</div>


	<!--toolbar-->
	<div id="count_tb">
		<%--<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin:3px;" onclick="countPreAdd()">添加</a>--%>
		<%--<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="countPreEdit()">修改</a>--%>
		<%--<a class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="">查看</a>--%>
		<%--<a class="easyui-linkbutton" data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="countDelete()">删除</a>--%>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="reloadList('countList')">刷新</a>
		<%--<a class="easyui-linkbutton" data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterCount()">过滤</a>--%>
	</div>
<script type="application/javascript">


    function formatDate(value,row){
        exTime = value;
        var d = new Date(value);
        return $.fn.datebox.defaults.formatter(d);
    }


    function filterCount() {
        var dg = $("#countList").datagrid();

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

</script>





<script type="application/javascript">
    



    function countDelete() {


        var count = $("#countList").datagrid("getSelected");

        if(count==null){
            $.messager.alert("提示","请选择要删除的选项","error");
            return false;
        }

        $.messager.confirm("提示","确定删除吗？",function (dt) {

            if (dt){

                $.post("/countAction/ajaxDeleteCount.action",{id:count.id},function (data) {

                    $("#countList").datagrid("reload");
//                $.messager.alert("提示","删除成功","info");

                })


            }else{
            }
        })

    }


    function findCountByInput() {
        var input = $("#queryCountForm input[name='input']").val();

        $.post("/countAction/ajaxFindCountByInput.action",{"input":encodeURI(input,"UTF-8")},function (data)   {
            var counts = eval("("+JSON.stringify(data)+")");
            $("#countList").datagrid("loadData",counts);
        })


    }


</script>

</body>
</html>