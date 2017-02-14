<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">


	<script type="text/javascript" >

	</script>



</head>
<body>

<div id="customer_tb" style="padding:5px;height:auto">
	<!--toolbar-->
	<div id="payment_tb" class="myButtonDiv">
		<%--<a data-options="iconCls:'icon-add'" style="margin:3px;" onclick="paymentPreAdd()">添加</a>--%>
		<%--<a data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="paymentPreEdit()">修改</a>--%>
		<%--<a data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="">查看</a>--%>
		<a data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="paymentDelete()">删除</a>
		<a data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="reloadList('paymentList')">刷新</a>
		<a data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterPayment()">过滤</a>
	</div>
</div>

	<div title="缴费列表" style="padding:10px">

		<table id="paymentList" class="easyui-datagrid" style="width:1280px;height:670px"
			   data-options="url:'/paymentAction/ajaxFindAllPayments.action',rownumbers:true,fitColumns:true,singleSelect:true,pagination:false,toolbar:'#payment_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="0">id</th>
				<th data-options="field:'customerName',align:'center'" width="60">姓名</th>
				<th data-options="field:'number',align:'center'" width="60">卡号</th>
				<th data-options="field:'money',align:'center'" width="60">套餐费(元)</th>
				<th data-options="field:'deposit',align:'center'" width="60">押金(元)</th>
				<th data-options="field:'time',align:'center',formatter:formatDate" width="80">时间</th>
				<th data-options="field:'reason',align:'center'" width="200">原因</th>
				<th data-options="field:'other',align:'center',formatter:formatOther" width="200">备注</th>
			</tr>
			</thead>
		</table>


	</div>




<script type="application/javascript">


	$(function () {
        //init all buttons
        $(".myButtonDiv a").each(function (index,data) {

            $(this).linkbutton();

        })
        $(".myButton").each(function (index,data) {

            $(this).linkbutton();

        })
    });



    function formatDate(value,row){
        exTime = value;
        var d = new Date(value);
        return $.fn.datebox.defaults.formatter(d);
    }
    function formatOther(value,row){

		if(value == "千万不要删除！！！"){
            return '<span style="color:red;">千万不要删除！！！</span>';
        }else {
            return value;
        }


        exTime = value;
        var d = new Date(value);
        return $.fn.datebox.defaults.formatter(d);
    }


    function filterPayment() {
        var dg = $("#paymentList").datagrid();

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

    function paymentDelete() {


        var payment = getSelected("paymentList");

        if(payment!=undefined){
            $.messager.confirm("提示","确定删除吗？",function (dt) {

                if (dt){

                    $.post("/paymentAction/ajaxDeletePayment.action",{id:payment.id},function (data) {

                        reloadList("paymentList");
                		$.messager.alert("提示","删除成功","info");

                    })


                }else{
                }
            })
        }



    }


    function findPaymentByInput() {
        var input = $("#queryPaymentForm input[name='input']").val();

        $.post("/paymentAction/ajaxFindPaymentByInput.action",{"input":encodeURI(input,"UTF-8")},function (data)   {
            var payments = eval("("+JSON.stringify(data)+")");
            $("#paymentList").datagrid("loadData",payments);
        })


    }


</script>

</body>
</html>