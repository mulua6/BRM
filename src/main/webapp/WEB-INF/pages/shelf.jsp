<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>

	<div title="书架列表" style="padding:10px">

		<table id="shelfList" class="easyui-datagrid"
			   data-options="url:'/shelfAction/findAllShelfsAsJson.action',rownumbers:true,fitColumns:false,singleSelect:true,pagination:false,toolbar:'#shelf_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="100">id</th>
				<th data-options="field:'shelfName',align:'center'" width="100">书架</th>
			</tr>
			</thead>
		</table>


	</div>


	<!--toolbar-->
	<div id="shelf_tb" class="myButtonDiv">
		<a  data-options="iconCls:'icon-add'" style="margin:3px;" onclick="shelfPreAdd()">添加</a>
		<a  data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="shelfPreEdit()">修改</a>
		<a  data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="shelfDelete()">删除</a>
	</div>

	<!--toolbar for add shelf-->
	<div id="shelf_add_bt" class="myButtonDiv">
		<a  data-options="iconCls:'icon-add'" style="margin:3px;" onclick="shelfAdd()">保存</a>
		<a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('shelfAdd')">取消</a>
	</div>

	<!--toolbar for edit shelf-->
	<div id="shelf_edit_bt" class="myButtonDiv">
		<a  data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="shelfEdit()">修改</a>
		<a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('shelfEdit')">取消</a>
	</div>


	<!--add-->
	<div id="shelfAdd" style="display: none;text-align: right" >

		<form id="shelfAddForm" action="/shelfAction/ajaxAddShelf.action" method="post"  class="easyui-form">
			<div>
				<label for="shelfName">书架:</label>
				<input  type="text" name="shelfName" data-options="required:true" />
			</div>
		</form>
	</div>


	<!--edit-->
	<div id="shelfEdit" style="text-align: right" >

		<form id="shelfEditForm" action="/shelfAction/ajaxEditShelf.action" method="post"  class="easyui-form">
			<div>
				<label for="shelfName">书架:</label>
				<input type="text" name="shelfName" data-options="required:true" />
			</div>
            <div style="display: none">
                <label for="id">id:</label>
                <input type="hidden" name="id" data-options="required:true" />
            </div>
		</form>
	</div>



<script type="application/javascript">


    /*shelf*/
    function shelfPreAdd() {

        $("#shelfAddForm").form("clear");

        $("#shelfAdd").dialog("open");
    }
    
    
    function shelfAdd() {

        var submit = $('#shelfAddForm').form("validate");

        if (submit) {

            $('#shelfAddForm').form('submit', {
                success: function (data) {

                    $("#shelfAdd").dialog("close");
                    var data = eval('(' + data + ')');
//                    $.messager.alert("提示", data.msg, "info")
                    $("#shelfList").datagrid("reload");
                }
            });

        }

    }


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


        $("#shelfAdd").dialog({

            title: '添加书架',
            width: 400,
            height: 200,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#shelf_add_bt'


        });

        $("#shelfEdit").dialog({

            title: '编辑书架',
            width: 500,
            height: 200,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#shelf_edit_bt'


        });
//        $("#shelfAddForm").validate({
//            rules : {
//                bookIsbn: "required",
//                number: "required"
//            },
//            messages: {
//                bookIsbn: "请输入ISBN",
//                number: "请输入读者卡号"
//            }
//
//        })


        //初始化所有的form
        $("form").each(function () {
            $(this).addClass("myForm");
        })


    });

    function shelfPreEdit() {

        var shelf = getSelected("shelfList");

        if(shelf!=undefined) {

            $("#shelfEdit").dialog("open");
            $("#shelfEditForm").form("load", shelf);
        }
    }

    
    function shelfEdit() {


        var submit = $('#shelfEditForm').form("validate");

        if (submit) {
            $("#shelfEditForm").form("submit", {

                        success: function () {
//                $.messager.alert("提示","修改成功","info");
                            $("#shelfEdit").dialog("close");
                            $("#shelfList").datagrid("reload");
                        }
                    }
            );
        }
    }

    
    function shelfDelete() {

        var shelf = getSelected("shelfList");

        if(shelf!=undefined){
            $.messager.confirm("提示","确定删除吗？",function (dt) {

                if (dt){

                    var shelf = $("#shelfList").datagrid("getSelected");

                    $.post("/shelfAction/ajaxDeleteShelf.action",{id:shelf.id},function (data) {

                    })

                    $("#shelfList").datagrid("reload");
//                $.messager.alert("提示","删除成功","info");
                }else{
                }
            })
        }

    }

</script>

</body>
</html>