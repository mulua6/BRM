<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎使用安东尼图书借阅系统</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/css/demo.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.easyui.min.js"></script>


	<script type="text/javascript" >

	</script>



</head>
<body>

<div data-options="region:'south',split:true" title="欢迎使用" style="height: 100px">

    <div title="借阅列表" style="padding:10px;border-style: solid;border-color: #a2b5d6;border-width: 1px;margin: 10px">

        <form id="borrowConditionForm" action="/borrowAction/ajaxAddBorrow.action" method="post" style="margin: 20px" class="easyui-form">

            <div>
                <div>
                    <label for="cardNumber">读者卡号:</label>
                    <input type="text" name="cardNumber"  onblur="queryBorrowByCustomerNumber()" />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


                    <label for="isbn">I&nbsp;S&nbsp;B&nbsp;N:</label>
                    <input type="text" name="isbn" id="borrowBookIsbn" onkeypress="if(event.keyCode==13) {queryIfBorrowedAndBorrow()}" />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin:3px;" onclick="queryIfBorrowedAndBorrow()">借阅</a>

                </div>

            </div>
        </form>

    </div>


</div>
<div data-options="region:'north',split:true" title="欢迎使用" style="">
	<div title="借阅列表" style="padding:10px">

		<table id="borrowPageBookList" class="easyui-datagrid" style="width:1280px;height:555px"
               data-options="url:'/borrowAction/queryBorrowAsJson.action?history=0',fitColumns:true,singleSelect:true,pagination:false,toolbar:'#borrow_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="0">id</th>
				<th data-options="field:'customerName',align:'center'" width="60">姓名</th>
				<th data-options="field:'cardNumber',align:'center'" width="60">卡号</th>
				<th data-options="field:'bookName',align:'center'" width="250">书名</th>
				<th data-options="field:'isbn',align:'center'" width="100">ISBN</th>
				<th data-options="field:'publisher',align:'center'" width="100">出版社</th>
				<th data-options="field:'borrowTime',align:'center',formatter:formatDate" width="100">借书时间</th>
				<th data-options="field:'expireTime',align:'center',formatter:formatDate" width="100">到期时间</th>
				<th data-options="field:'backTime',align:'center',formatter:statusFormater" width="100">状态</th>
				<%--<th data-options="field:'status',align:'center',formatter:statusFormater" width="100">状态</th>--%>
				<th data-options="field:'status',align:'center',hidden:true" width="0">状态id</th>
			</tr>
			</thead>
		</table>


		<script type="application/javascript">

			var exTime;


            function formatDate(value,row){
                exTime = value;
                var d = new Date(value);
                return $.fn.datebox.defaults.formatter(d);
            }


			function statusFormater(a,b,c) {

			    //获取当前的时间
                var timestamp = Date.parse(new Date());

			    if(a == undefined){

                    if(timestamp - exTime > 0){
                        return '<span style="color:red;">已经逾期</span>';
                    }else {
                        return "未归还";
                    }

				}else{
                    var d = new Date(a);
                    return $.fn.datebox.defaults.formatter(d);
				}
            }
            
            
            
            function renewBook() {
                var borrow = $("#borrowPageBookList").datagrid("getSelected");

                if(borrow==null){
                    $.messager.alert("提示","请选择要编辑的选项","error");
                    return false;
                }

                //renew book
                $.post("/borrowAction/ajaxRenewBorrow.action",{'id':borrow.id},function (data) {

                    queryBorrowByCustomerNumber();
                    $.messager.alert("提示",data.msg,"info");

                })


            }




            function returnBook() {
                var borrow = $("#borrowPageBookList").datagrid("getSelected");

                if(borrow==null){
                    $.messager.alert("提示","请选择要编辑的选项","error");
                    return false;
                }

				//return book
                $.post("/borrowAction/ajaxBackBorrow.action",{'id':borrow.id},function (data) {

                    queryBorrowByCustomerNumber();
                    $.messager.alert("提示",data.msg,"info");

                })


            }
		</script>
	</div>

</div>






	<!--borrow toolbar-->
	<div id="borrow_tb">
		<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="margin:3px;" onclick="returnBook()">还书</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="renewBook()">续借</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="toLostBook(0)">丢失</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-no'" style="margin:3px;" onclick="toLostBook(1)">破损</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterBorrow()">过滤</a>
	</div>

<!--borrow toolbar-->
<div id="lostOrBroekn_tb" style="display: none">
	<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="margin:3px;" onclick="doLostOrBrokenBook()">保存</a>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('lostOrBroken')">取消</a>
</div>


	<!--lost/broken-->
	<div id="lostOrBroken" style="display: none;text-align: center" >

		<form id="lostOrBrokenForm" action="/borrowAction/ajaxDeduction.action" method="post" style="margin: 20px">

			<div>
				<input class="easyui-validatebox" type="hidden" name="op" data-options="required:true" />
				<input class="easyui-validatebox" type="hidden" name="id" data-options="required:true" />
			</div>

			<div>
				<label for="customerName">姓名:</label>
				<input class="easyui-validatebox" type="text" name="customerName" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="cardNumber">卡号:</label>
				<input class="easyui-validatebox" type="text" name="cardNumber" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="bookName">书名:</label>
				<input class="easyui-validatebox" type="text" name="bookName" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="isbn">isbn:</label>
				<input class="easyui-validatebox" type="text" name="isbn" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="reason">原因:</label>
				<input class="easyui-validatebox" type="text" name="reason" data-options="required:true" /><br/><br/>
			</div>


			<div>
				<label for="money">扣费:</label>
				<input class="easyui-validatebox" type="text" name="money" data-options="required:true" />
			</div>
		</form>
	</div>





<script type="application/javascript">

	function toLostBook(op) {

        $("#lostOrBrokenForm").form("clear");

        var borrow = $("#borrowPageBookList").datagrid("getSelected");

        if(borrow==null){
            $.messager.alert("提示","请选择要编辑的选项","error");
            return false;
        }


        $("#lostOrBroken").dialog({

            title: '图书丢损',
            width: 350,
            height: 400,
            closed: false,
            cache: false,
            modal: true,
            buttons:'#lostOrBroekn_tb'


        });

        //	op 1:破损 0：丢失
		if (op){
		    borrow.reason = "图书破损";
		}else{
            borrow.reason = "图书丢失";
		}
		borrow.op = op;
        $("#lostOrBrokenForm").form("load",borrow);


    }

    function doLostOrBrokenBook() {

		$("#lostOrBrokenForm").form("submit",{
		    success:function (data) {
                queryBorrowByCustomerNumber();
				$("#lostOrBroken").dialog("close");
            }
		    
		});
    }




$(function () {

    $("#borrowConditionForm").validate({
        rules : {
            bookIsbn: "required",
            number: "required"
        },
        messages: {
            bookIsbn: "请输入ISBN",
            number: "请输入读者卡号"
        }

    })
});

function borrowBook() {


    $("#borrowConditionForm").form("submit",{
		success: function (data) {
			var dt = $.parseJSON(data);
            queryBorrowByCustomerNumber();

//            如果借书失败，提示原因
            if(dt.success == undefined){
                $.messager.alert("提示", dt.msg, "info")
            }
        }
    });

    $("#borrowBookIsbn").val("");



}


	//根据读者卡号查询借书信息
	function queryBorrowByCustomerNumber() {
		var cardNumber = $("#borrowConditionForm input[name='cardNumber']").val();
		if (cardNumber != ""){

			$.post("/borrowAction/queryBorrowAsJson.action",{"cardNumber":cardNumber,'history':0},function (data) {
				if (data.msg == ""){
					$("#borrowPageBookList").datagrid("loadData",data);

				}else {
					$.messager.alert("错误",data.msg,"error");
				}
			})

		}else {
		    reloadList("borrowPageBookList");
//			$.messager.alert("提示","请输入读者的卡号","info");
		}

	}

function queryIfBorrowedAndBorrow() {
    var cardNumber = $("#borrowConditionForm input[name='cardNumber']").val();
    var isbn = $("#borrowConditionForm input[name='isbn']").val();


    $.post("/borrowAction/ajaxQueryBorrowed.action",{'cardNumber':cardNumber,'isbn':isbn},function (data) {

        if (data.msg != undefined){

            $.messager.alert("提示",data.msg,"info");
        }else {

            if (data.borrowed){
                $("#borrowHistoryList").datagrid("loadData",data);

                $.messager.confirm("提示","这本书已经借过了，是否要继续借这本书",function (run) {
					if (run){
                        borrowBook();
					}else{

					}
                });

            }else{
                borrowBook();
            }

        }


    })

}


    function filterBorrow() {
        var dg = $("#borrowPageBookList").datagrid();

        dg.datagrid('enableFilter',
            [{
                field:'price',
                type:'numberbox',
                options:{precision:1},
                op:['equal','notequal','less','greater']
            },
                {
                    field:'statusView',
                    type:'combobox',
                    options:{
                        panelHeight:'auto',
                        data:[{value:'',text:'所有'},{value:'正常',text:'正常'},{value:'损坏',text:'损坏'},{value:'丢失',text:'丢失'}],
                        onChange:function(value){
                            if (value == ''){
                                dg.datagrid('removeFilterRule', 'statusView');
                            } else {
                                dg.datagrid('addFilterRule', {
                                    field: 'statusView',
                                    op: 'equal',
                                    value: value
                                });
                            }
                            dg.datagrid('doFilter');
                        }
                    }
                }


            ]

        );
    }


</script>
</body>
</html>