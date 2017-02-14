<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎使用***图书借阅系统</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/css/demo.css">

	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.easyui.min.js"></script>


	<script type="text/javascript" >

	</script>



</head>
<body>

<%--<div data-options="region:'south',split:true" title="欢迎使用" style="height: 100px">--%>

    <%--<div title="借阅列表" style="padding:10px;border-style: solid;border-color: #a2b5d6;border-width: 1px;margin: 10px">--%>

        <%--<form id="queryBorrowHistoryForm" action="/borrowAction/ajaxAddBorrow.action" method="post" style="margin: 20px" class="easyui-form">--%>

            <%--<div>--%>
                <%--<div>--%>
                    <%--<label for="cardNumber">读者卡号:</label>--%>
                    <%--<input type="text" name="cardNumber" value="66001" onblur="queryBorrowHistoryByCustomerNumber()" />--%>

                    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>


                    <%--<label for="bookIsbn">I&nbsp;S&nbsp;B&nbsp;N:</label>--%>
                    <%--<input type="text" name="isbn"  />--%>

                    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <%--<a class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin:3px;" onclick="queryIfBorrowed()">查询</a>--%>

                <%--</div>--%>

            <%--</div>--%>
        <%--</form>--%>

    <%--</div>--%>


<%--</div>--%>
<div data-options="region:'north',split:true" title="欢迎使用" style="">
	<div title="借阅历史列表" style="padding:10px">

		<table id="borrowHistoryList" class="easyui-datagrid" style="width:1280px;height:663px"
			   data-options="url:'/borrowAction/queryBorrowAsJson.action?history=1',fitColumns:true,singleSelect:true,pagination:false,toolbar:'#borrowHistory_tb'">
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
				<th data-options="field:'backTime',align:'center',formatter:statusFormater" width="100">归还日期</th>
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
                        return '<span style="color:red;">未归还</span>';
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
<div id="borrowHistory_tb">
	<a class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="reloadList('borrowHistoryList')">刷新</a>
	<a class="easyui-linkbutton" data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterBorrowHistory()">过滤</a>
</div>

<script type="application/javascript">

	//根据读者卡号查询借书信息
	function queryBorrowHistoryByCustomerNumber() {
		var cardNumber = $("#queryBorrowHistoryForm input[name='cardNumber']").val();
		if (cardNumber != ""){

			$.post("/borrowAction/queryBorrowAsJson.action",{"cardNumber":cardNumber,'history':1},function (data) {
				if (data.msg == ""){
					$("#borrowHistoryList").datagrid("loadData",data);

				}else {
					$.messager.alert("错误",data.msg,"error");
				}
			})

		}else {
			$.messager.alert("提示","请输入读者的卡号","info");
		}

	}


	function queryIfBorrowed() {
        var cardNumber = $("#queryBorrowHistoryForm input[name='cardNumber']").val();
        var isbn = $("#queryBorrowHistoryForm input[name='isbn']").val();


        $.post("/borrowAction/ajaxQueryBorrowed.action",{'cardNumber':cardNumber,'isbn':isbn},function (data) {

            if (data.msg != undefined){

                $.messager.alert("提示",data.msg,"info");
			}else {

                if (data.borrowed){
                    $("#borrowHistoryList").datagrid("loadData",data);
				}else{
                    $.messager.alert("提示","没有借过这本书","info");
				}

			}


        })

    }

    function filterBorrowHistory() {
        var dg = $("#borrowHistoryList").datagrid();

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