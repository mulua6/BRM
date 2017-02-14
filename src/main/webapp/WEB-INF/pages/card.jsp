<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>欢迎使用***套餐借阅系统</title>


	<script type="text/javascript" >

	</script>



</head>
<body>

	<div title="套餐列表" style="padding:10px">

		<table id="cardList" class="easyui-datagrid"
			   data-options="url:'/cardAction/findAllCardsAsJson.action',rownumbers:true,fitColumns:false,singleSelect:true,pagination:false,toolbar:'#card_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="80">id</th>
				<th data-options="field:'cardName',align:'center'" width="80">套餐</th>
				<th data-options="field:'price',align:'center'" width="80">金额</th>
				<th data-options="field:'days',align:'center'" width="80">持书天数</th>
				<th data-options="field:'number',align:'center'" width="80">可借数量</th>
				<th data-options="field:'deposit',align:'center'" width="100">押金金额</th>
				<%--<th data-options="field:'lost',align:'center'" width="100">丢失罚金</th>--%>
				<%--<th data-options="field:'broken',align:'center'" width="100">损坏罚金</th>--%>
			</tr>
			</thead>
		</table>


	</div>


	<!--toolbar-->
	<div id="card_tb" class="myButtonDiv">
		<a data-options="iconCls:'icon-add'" style="margin:3px;" onclick="cardPreAdd()">添加</a>
		<a data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="cardPreEdit()">修改</a>
		<a data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="cardDelete()">删除</a>
	</div>

	<!--toolbar for add card-->
	<div id="card_add_bt" class="myButtonDiv">
		<a  data-options="iconCls:'icon-add'" style="margin:3px;" onclick="cardAdd()">保存</a>
		<a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('cardAdd')">取消</a>
	</div>

	<!--toolbar for edit card-->
	<div id="card_edit_bt" class="myButtonDiv">
		<a  data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="cardEdit()">修改</a>
		<a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('cardEdit')">取消</a>
	</div>


	<!--add-->
	<div id="cardAdd" style="display: none;text-align: right" >

		<form id="cardAddForm" action="/cardAction/ajaxAddCard.action" method="post" class="easyui-form">
			<div>
				<label for="cardName">套餐:</label>
				<input type="text" name="cardName" data-options="required:true,missingMessage:'不能为空'" /><br/><br/>
			</div>
			<div>
				<label for="price">金额:</label>
				<input type="text" name="price" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="days">持书天数:</label>
				<input type="text" name="days" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="number">可借书数量:</label>
				<input type="text" name="number" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="deposit">押金金额:</label>
				<input type="text" name="deposit" data-options="required:true" /><br/><br/>
			</div>
			<%--<div>--%>
				<%--<label for="lost">丢失罚金:</label>--%>
				<%--<input type="text" name="lost" data-options="required:true" /><br/><br/>--%>
			<%--</div>--%>
			<%--<div>--%>
				<%--<label for="broken">损坏罚金:</label>--%>
				<%--<input type="text" name="broken" data-options="required:true" />--%>
			<%--</div>--%>
		</form>
	</div>


	<!--edit-->
	<div id="cardEdit" style="display: none;text-align: right" >

		<form id="cardEditForm" action="/cardAction/ajaxEditCard.action" method="post"  class="easyui-form">

            <div style="display: none">
                <label for="id">id:</label>
                <input type="text" name="id"  />
            </div>
            <div>
				<label for="cardName">套餐:</label>
				<input type="text" name="cardName" class="easyui-validatebox" data-options="required:true,missingMessage:'不能为空'" /><br/><br/>
			</div>
			<div>
				<label for="price">金额:</label>
				<input type="text" name="price" class="easyui-validatebox" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="days">持书天数:</label>
				<input type="text" name="days" class="easyui-validatebox" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="number">可借书数量:</label>
				<input type="text" name="number" class="easyui-validatebox" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="deposit">押金金额:</label>
				<input type="text" name="deposit" class="easyui-validatebox" data-options="required:true" /><br/><br/>
			</div>
			<%--<div>--%>
				<%--<label for="lost">丢失罚金:</label>--%>
				<%--<input type="text" name="lost" class="easyui-validatebox" data-options="required:true" /><br/><br/>--%>
			<%--</div>--%>
			<%--<div>--%>
				<%--<label for="broken">损坏罚金:</label>--%>
				<%--<input type="text" name="broken" class="easyui-validatebox" data-options="required:true" />--%>
			<%--</div>--%>
		</form>
	</div>



<script type="application/javascript">

	$(function () {


        $("input").each(function () {

            $(this).validatebox({

                required: true,
                delay:200,
                missingMessage:'不能为空'


            });
        })


        //init all buttons
        $(".myButtonDiv a").each(function (index,data) {

            $(this).linkbutton();

        })
        $(".myButton").each(function (index,data) {

            $(this).linkbutton();

        })

        //初始化所有的form
        $("form").each(function () {
            $(this).addClass("myForm");
        })

		//初始化对话框
        $("#cardEdit").dialog({

            title: '编辑套餐',
            width: 400,
            height: 400,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#card_edit_bt'


        });

        $("#cardAdd").dialog({

            title: '添加套餐',
            width: 400,
            height: 400,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#card_add_bt'


        });



	});


	/*card*/
    function cardPreAdd() {
        $("#cardAdd").dialog("open");
    }

    function cardAdd() {

        var submit = $('#cardAddForm').form("validate");

        if (submit){

            $('#cardAddForm').form('submit', {
                success: function(data){

                    $("#cardAdd").dialog("close");
                    var data = eval('(' + data + ')');
                    $.messager.alert("提示",data.msg,"info")
                    $("#cardList").datagrid("reload");

                    $('#cardAddForm').form("clear");
                }
            });
        }else {
        }



    }

    function cardPreEdit() {

        var card = getSelected("cardList");

        if(card!=undefined){
            $("#cardEdit").dialog("open");
			$("#cardEditForm").form("load",card);
        }


    }
    
    function cardEdit() {
        var submit = $('#cardEditForm').form("validate");

        if (submit) {

            $("#cardEditForm").form("submit", {

                        success: function () {
//                $.messager.alert("提示","修改成功","info");
                            $("#cardEdit").dialog("close");
                            $("#cardList").datagrid("reload");
                        }
                    }
            );

        }
    }

    function cardDelete() {


        var card = getSelected("cardList");

        if(card!=undefined) {

            $.messager.confirm("提示", "确定删除吗？", function (dt) {

                if (dt) {

                    $.post("/shelfAction/ajaxDeleteCard.action", {id: card.id}, function (data) {

                    })

                    $("#cardList").datagrid("reload");
//                $.messager.alert("提示","删除成功","info");
                } else {
                }
            })
        }
    }

</script>

</body>
</html>