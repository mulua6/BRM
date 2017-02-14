<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body id="book">


    <div title="图书列表" style="padding:10px;border-style: solid;border-color: #a2b5d6;border-width: 1px;margin: 10px">

        <form id="queryBookForm" action="/bookAction/ajaxFindBookByInput.action" method="post" style="margin: 20px" class="easyui-form">

            <div>
                <div>
                    <label for="input">书名/ISBN:</label>
                    <input type="text" name="input"  />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <a class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="margin:3px;" onclick="findBookByInput()">查询</a>

                </div>
            </div>
        </form>

    </div>


    <div id="book_tb" style="margin-bottom:5px" class="myButtonDiv">
        <a data-options="iconCls:'icon-add'" style="margin:3px;" onclick="bookPreAdd()">添加</a>
        <a data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="bookPreEdit()">修改</a>
        <a data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="bookDelete()">删除</a>
        <a data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="reloadList('bookList')">刷新</a>
        <a data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterBook()">过滤</a>
    </div>





	<div title="读者列表" style="padding:10px">

		<table id="bookList" class="easyui-datagrid" style="width:1280px;height:680px"
			   data-options="url:'/bookAction/findAllBooksAsJson.action',rownumbers:true,fitColumns:true,singleSelect:true,pagination:false,toolbar:'#book_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="80">id</th>
				<th data-options="field:'bookName',align:'center'" width="250">书名</th>
				<th data-options="field:'isbn',align:'center'" width="80">ISBN</th>
				<th data-options="field:'author',align:'center'" width="50">作者</th>
				<th data-options="field:'publishTimeView',align:'center'" width="60">出版时间</th>
				<th data-options="field:'publisher',align:'center'" width="100">出版社</th>
				<th data-options="field:'price',align:'center'" width="30">定价</th>
				<th data-options="field:'packaging',align:'center'" width="30">包装</th>
				<th data-options="field:'shelfName',align:'center'" width="30">书架</th>
				<th data-options="field:'statusView',align:'center'" width="50">状态</th>
				<th data-options="field:'status',align:'center',hidden:true" width="30">状态id</th>
				<th data-options="field:'other',align:'center'" width="100">备注</th>
			</tr>
			</thead>
		</table>


	</div>

	<!--add-->
	<div id="bookAdd" style="display: none;text-align: right" >

		<form id="bookAddForm" action="/bookAction/ajaxAddBook.action" method="post" class="easyui-form" >
			<div>
				<label for="isbn">ISBN:</label>
				<input type="text" id="add_book_isbn" name="isbn" data-options="required:true"  onkeypress="if(event.keyCode==13) {loadBookInfo()}"/><br/><br/>
			</div>


            <%--ajax 动态加载书的信息--%>
            <div>
                <label for="bookName">书名:</label>
                <input type="text" name="bookName" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="author">作者:</label>
                <input type="text" name="author" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="publisher">出版社:</label>
                <input type="text" name="publisher" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="publishTimeView">出版时间:</label>
                <input type="text" name="publishTimeView" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="price">定价:</label>
                <input type="text" name="price" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="shelfId">书架:</label>
                <select style="width: 132px;" name="shelfId"  id="add_book_shelfId" class="easyui-combobox" >
                    <%--<option value="#">请选择套餐</option>--%>
                </select><br/><br/>
            </div>
            <div>
                <label for="packaging">包装:</label>
                <select style="width: 132px;" name="packaging"  id="add_book_packaging" class="easyui-combobox" >
                    <%--<option value="精装" selected="selected">精装</option>--%>
                    <%--<option value="平装">平装</option>--%>
                </select><br/><br/>
            </div>
            <div>
                <label for="other">备注:</label>
                <input type="text" name="other"  /><br/><br/>
            </div>

		</form>

        <!--toolbar for add book-->
        <div id="book_add_bt" class="myButtonDiv">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="margin:3px;" onclick="bookAdd()">保存</a>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('bookAdd')">取消</a>
        </div>
	</div>


	<!--edit-->
	<div id="bookEdit" style="display: none;text-align: right" >

		<form id="bookEditForm" action="/bookAction/ajaxEditBook.action" method="post"  class="easyui-form">

            <div>
                <label for="isbn">ISBN:</label>
                <input type="text" id="edit_book_isbn" name="isbn" data-options="required:true" /><br/><br/>
                <input type="hidden" name="id" />
            </div>


            <div>
                <label for="bookName">书名:</label>
                <input type="text" name="bookName" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="author">作者:</label>
                <input type="text" name="author" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="publisher">出版社:</label>
                <input type="text" name="publisher" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="publishTimeView">出版时间:</label>
                <input type="text" name="publishTimeView" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="price">定价:</label>
                <input type="text" name="price" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="shelfId">书架:</label>
                <select style="width: 132px;" name="shelfId" id="edit_book_shelfId">
                    <%--<option value="#">请选择套餐</option>--%>
                </select><br/><br/>
            </div>
            <div>
                <label for="packaging">包装:</label>
                <select style="width: 132px;" name="packaging" id="edit_book_packaging">
                    <%--<option value="精装">精装</option>--%>
                    <%--<option value="平装">平装</option>--%>
                </select><br/><br/>
            </div>
            <div>
                <label for="status">状态:</label>
                <select style="width: 132px;" name="status" id="edit_book_status">
                    <%--<option value="0">正常</option>--%>
                    <%--<option value="1">丢失</option>--%>
                    <%--<option value="2">损坏</option>--%>
                    <%--<option value="3">外借</option>--%>
                </select><br/><br/>
            </div>
            <div>
                <label for="other">备注:</label>
                <input type="text" name="other"  /><br/><br/>
            </div>
		</form>
        <!--toolbar for edit book-->
        <div id="book_edit_bt" class="myButtonDiv">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="margin:3px;" onclick="bookEdit()">保存</a>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('bookEdit')">取消</a>
        </div>

    </div>

    <!--更改套餐-->
    <div id="alterCard" style="display: none;text-align: left" >

        <form id="alterCardForm" action="/bookAction/ajaxAlterPackage.action" method="post"  class="easyui-form">

            <div>
                <label for="bookName">姓名:</label>
                <input type="text" name="bookName" data-options="required:true,disabled:true" /><br/><br/>
                <input type="hidden" name="id" data-options="required:true" />
            </div>

            <div>
                <label for="cardName">套餐:</label>
                <select style="width: 132px;" name="cardId">
                    <%--<option value="#">请选择套餐</option>--%>
                </select>
            </div>

        </form>
        <!--toolbar for edit book-->
        <div id="alter_card_bt" style="display: none">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="margin:3px;" onclick="alterCard()">保存</a>
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('alterCard')">取消</a>
        </div>

    </div>

<script type="application/javascript">
    var cardList;
    var shelfList;

    $(function () {


        //查询所有的套餐类型
        $.post("/cardAction/findAllCardsAsJson.action",{},function (data) {
            cardList = data.rows;
        })

        //查询所有的套餐类型
        $.post("/shelfAction/findAllShelfsAsJson.action",{},function (data) {
            shelfList = data.rows;
        })



        //设置校验
        $("div[id*='book'] input[name!='address'][name!='other'][name!='publisher'][name!='publishTimeView'][name!='author']").each(function () {

            $(this).validatebox({

                required: true,
                delay:200,
                missingMessage:'不能为空'


            });
        })

        $("#bookAdd").dialog({

            title: '添加图书',
            width: 500,
            height: 500,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#book_add_bt'


        });
        $("#bookEdit").dialog({

            title: '编辑图书',
            width: 500,
            height: 510,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#book_edit_bt'


        });


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

    });







    /*book*/

    function loadBookInfo() {

        var isbn = $("#add_book_isbn").val();

        $.post("/bookAction/loadBookInfo.action",{'isbn':isbn},function (data) {
            var book = $(data.rows).get(0);

//            alert(JSON.stringify(data));
            if(!data.flag){

                $("#bookAddForm").form("load",book);
            }else{
                $.messager.confirm("提示","这本书已经存在，是否要继续！",function (flag) {
                    if(flag){
                        $("#bookAddForm").form("load",book);
                    }else {
                        //剩下 书架和包装不用清除
//                    $('#bookAddForm').form("clear");
                        $("#bookAddForm input[class!='textbox-text validatebox-text']").each(function () {
                            $(this).val("");
                        });
                    }
                })
            }

        })
        
    }
    
    
    function bookPreAdd() {

        $("#bookAddForm").form("clear");
        $("#add_book_shelfId").empty();


        $("#bookAdd").dialog("open");

        //默认选中第一个
        $(shelfList).get(0).selected = true;

        $("#add_book_shelfId").combobox({
            valueField:'id',
            textField:'shelfName',
            data:shelfList
        });
        //取消默认选择第一个
        $(shelfList).get(0).selected = false;


        $("#add_book_packaging").combobox({
            valueField:'value',
            textField:'text',
            data:[
                {
                    value:'平装',
                    text:'平装'

                },
                {
                    value:'精装',
                    text:'精装',
                    selected:true
                }

            ]
        });

    }







    
    function bookAdd() {


        var submit = $('#bookAddForm').form("validate");

        if (submit){

            $('#bookAddForm').form('submit', {
                success: function(data){


                    //添加后不关闭窗口
//                    $("#bookAdd").dialog("close");
                    var data = eval('(' + data + ')');
                    $.messager.alert("提示","添加图书成功","info")
                    $("#bookList").datagrid("reload");


                    //剩下 书架和包装不用清除
//                    $('#bookAddForm').form("clear");
                    $("#bookAddForm input[class!='textbox-text validatebox-text']").each(function () {
                        $(this).val("");
                    });


                },
                error: function () {
                    $.messager.alert("提示","添加图书失败","error")
                }
            });
        }else {
        }
    }

    function bookPreEdit() {

        var book = getSelected("bookList");
        if(book!=undefined){

            $("#edit_book_shelfId").combobox({
                valueField:'id',
                textField:'shelfName',
                data:shelfList
            });

            $("#bookEdit").dialog("open");

            $("#edit_book_packaging").combobox({
                valueField:'value',
                textField:'text',
                data:[
                    {
                        value:'平装',
                        text:'平装'
                    },
                    {
                        value:'精装',
                        text:'精装'
                    }

                ]
            });
            $("#edit_book_status").combobox({
                valueField:'value',
                textField:'text',
                data:[
                    {
                        value:'0',
                        text:'正常'
                    },
                    {
                        value:'1',
                        text:'丢失'
                    },
                    {
                        value:'2',
                        text:'损坏'
                    },
                    {
                        value:'3',
                        text:'外借'
                    }

                ]
            });

            $("#bookEditForm").form("load",book);

        }



    }
    
    function bookEdit() {
        var submit = $('#bookEditForm').form("validate");

        if (submit) {

            $("#bookEditForm").form("submit", {

                        success: function () {
//                $.messager.alert("提示","修改成功","info");
                            $("#bookEdit").dialog("close");
                            $("#bookList").datagrid("reload");
                        }
                    }
            );

        }
    }

    function bookDelete() {


        var book = getSelected("bookList");
        if(book!=undefined) {

            $.messager.confirm("提示", "确定删除吗？", function (dt) {

                if (dt) {

                    $.post("/bookAction/ajaxDeleteBook.action", {id: book.id}, function (data) {

                        $("#bookList").datagrid("reload");
//                $.messager.alert("提示","删除成功","info");

                    })


                } else {
                }
            })
        }
    }

    function findBookByInput() {
        var input = $("#queryBookForm input[name='input']").val();

        $.post("/bookAction/ajaxFindBookByInput.action",{"input":encodeURI(input,"UTF-8")},function (data)   {
            var books = eval("("+JSON.stringify(data)+")");
            $("#bookList").datagrid("loadData",books);
        })


    }



    function filterBook() {
        var dg = $("#bookList").datagrid();

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