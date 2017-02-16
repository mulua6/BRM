<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">

</head>
<body id="customer">

    <div title="借阅列表" style="padding:10px;border-style: solid;border-color: #a2b5d6;border-width: 1px;margin: 10px">

        <form id="queryCustomerForm" action="/customerAction/ajaxFindCustomerByInput.action" method="post" style="margin: 20px" class="easyui-form">

            <div>
                <div>
                    <label for="input">姓名/卡号:</label>
                    <input type="text" name="input"  />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <a class="myButton"  data-options="iconCls:'icon-search'" style="margin:3px;" onclick="findCustomerByInput()">查询</a>

                </div>
            </div>
        </form>

    </div>

    <!--toolbar-->
    <div id="customer_tb" class="myButtonDiv">
        <a  data-options="iconCls:'icon-add'" style="margin:3px;" onclick="customerPreAdd()">添加</a>
        <a  data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="customerPreEdit()">修改</a>
        <%--<a  data-options="iconCls:'icon-edit'" style="margin:3px;" onclick="">查看</a>--%>
        <a  data-options="iconCls:'icon-remove'" style="margin:3px;" onclick="customerDelete()">删除</a>
        <a  data-options="iconCls:'icon-undo'" style="margin:3px;" onclick="preAlterCard()">改套餐</a>
        <a  data-options="iconCls:'icon-ok'" style="margin:3px;" onclick="paymentPreAdd()">缴费</a>
        <a  data-options="iconCls:'icon-reload'" style="margin:3px;" onclick="reloadList('customerList')">刷新</a>
        <a  data-options="iconCls:'icon-filter'" style="margin:3px;" onclick="filterCustomer()">过滤</a>
    </div>


	<div title="读者列表" style="padding:10px">

		<table id="customerList" class="easyui-datagrid" style="width:1280px;height:550px"
			   data-options="url:'/customerAction/findAllCustomersAsJson.action',rownumbers:true,fitColumns:true,singleSelect:true,pagination:false,toolbar:'#customer_tb'">
			<thead>
			<tr>
				<th data-options="field:'id',align:'center',hidden:true" width="80">id</th>
				<th data-options="field:'status',align:'center',hidden:true" width="80">status</th>
				<th data-options="field:'customerName',align:'center'" width="80">姓名</th>
				<th data-options="field:'sexView',align:'center'" width="80">性别</th>
				<th data-options="field:'cardName',align:'center'" width="50">套餐</th>
				<th data-options="field:'number',align:'center'" width="60">卡号</th>
				<th data-options="field:'phone',align:'center'" width="100">电话</th>
				<th data-options="field:'birthdayView',align:'center'" width="100">生日</th>
				<th data-options="field:'createTimeView',align:'center'" width="100">加入时间</th>
				<th data-options="field:'expireTimeView',align:'center'" width="100">到期时间</th>
				<th data-options="field:'deposit',align:'center'" width="80">押金</th>
				<th data-options="field:'statusView',align:'center'" width="60">状态</th>
				<th data-options="field:'address',align:'center'" width="180">联系地址</th>
				<th data-options="field:'other',align:'center'" width="260">备注</th>
			</tr>
			</thead>
		</table>


	</div>



<script type="application/javascript">


    function preAlterCard() {

        var customer = getSelected("customerList");

        if(customer!=undefined){

            //ajax get card list
            $.post("/cardAction/findAllCardsAsJson.action",{},function (data) {
                $.each(data.rows,function (index,card) {

                    var cardNode;

                    if (customer.cardId == card.id){

                        cardNode = $("<option value=\""+card.id+"\"  selected>"+card.cardName+"</option>")
                    }else {
                        cardNode = $("<option value=\""+card.id+"\" >"+card.cardName+"</option>")
                    }

                    $("#alterCardForm select").append(cardNode);
                })

            })

            $("#alterCard").dialog("open");
            $("#alterCardForm").form("load",customer);
        }


    }



    function formatDate(value,row){
        exTime = value;
        var d = new Date(value);
        return $.fn.datebox.defaults.formatter(d);
    }

    function filterCustomer() {
        var dg = $("#customerList").datagrid();

        dg.datagrid('enableFilter',
            [{
                field:'deposit',
                type:'numberbox',
                options:{precision:1},
                op:['equal','notequal','less','greater']
            },
                {
                    field:'statusView',
                    type:'combobox',
                    options:{
                        panelHeight:'auto',
                        data:[{value:'',text:'所有'},{value:'正常',text:'正常'},{value:'挂失',text:'挂失'},{value:'逾期',text:'逾期'}],
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





	<!--add-->
	<div id="customerAdd" style="text-align: right" >

		<form id="customerAddForm" action="/customerAction/ajaxAddCustomer.action" method="post" class="easyui-form" >
			<div>
				<label for="customerName">姓名:</label>
				<input type="text" name="customerName" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="sex">性别:</label>

                <input type="radio" name="sex" value="1" checked>男
                <input type="radio" name="sex" value="0">女<br/><br/>

			</div>
			<div>
				<label for="card">套餐:</label>
                <select style="width: 132px;" name="cardId">
                    <%--<option value="#">请选择套餐</option>--%>
                </select><br/><br/>
			</div>
			<div>
				<label for="number">卡号:</label>
				<input type="text" name="number" data-options="required:true" /><br/><br/>
			</div>
			<div>
				<label for="phone">电话:</label>
				<input type="text" name="phone"  /><br/><br/>
			</div>
			<div>
				<label for="birthday">生日:</label>
                <input type="text" name="birthday" id="customer_add_birthday" data-options="required:true,	validType:'validDate'" onblur="myFormatDate()">
                <br/><br/>
			</div>

            <div>
                <label for="address">地址:</label>
                <input type="text" name="address"  value="&nbsp;"/><br/><br/>
            </div>
            <div>
                <label for="other">备注:</label>
                <input type="text" name="other"  value="&nbsp;"/><br/><br/>
            </div>
		</form>

        <!--toolbar for add customer-->
        <div id="customer_add_bt" class="myButtonDiv">
            <a  data-options="iconCls:'icon-save'" style="margin:3px;" onclick="customerAdd()">保存</a>
            <a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('customerAdd')">取消</a>
        </div>
	</div>


	<!--edit-->
	<div id="customerEdit" style="display: none;text-align: right" >

		<form id="customerEditForm" action="/customerAction/ajaxEditCustomer.action" method="post"  class="easyui-form">

            <div>
                <label for="customerName">姓名:</label>
                <input type="text" name="customerName" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="sex">性别:</label>

                <input type="radio" name="sex" value="1" checked>男
                <input type="radio" name="sex" value="0">女<br/><br/>

            </div>
            <div>
                <label for="cardName">套餐:</label>
                <input type="text" name="cardName" data-options="required:true,disabled:true" /><br/><br/>

                <%--隐藏的字段--%>
                <input type="text" name="cardId" style="display: none" />
                <input type="text" name="id" style="display: none" />
                <%--<select style="width: 132px;" name="cardId">--%>
                    <%--&lt;%&ndash;<option value="#">请选择套餐</option>&ndash;%&gt;--%>
                <%--</select><br/><br/>--%>
            </div>
            <div>
                <label for="status">状态:</label>
                <select style="width: 132px;" name="status">
                <option value="#">请选择套餐</option>
                </select><br/><br/>
            </div>
            <div>
                <label for="number">卡号:</label>
                <input type="text" name="number" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="phone">电话:</label>
                <input type="text" name="phone" data-options="required:true" /><br/><br/>
            </div>
            <div>
                <label for="expireTime">到期时间:</label>
                <input type="text" name="expireTime" data-options="required:true,formatter:formatDate" /><br/><br/>
            </div>

            <div>
                <label for="address">地址:</label>
                <input type="text" name="address"  /><br/><br/>
            </div>
            <div style="display: none">
                <label for="deposit">地址:</label>
                <input type="text" name="deposit"  /><br/><br/>
            </div>
            <div>
                <label for="other">备注:</label>
                <input type="text" name="other"  value="&nbsp;"/><br/><br/>
            </div>
		</form>
        <!--toolbar for edit customer-->
        <div id="customer_edit_bt" class="myButtonDiv">
            <a  data-options="iconCls:'icon-save'" style="margin:3px;" onclick="customerEdit()">保存</a>
            <a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('customerEdit')">取消</a>
        </div>

    </div>

    <!--更改套餐-->
    <div id="alterCard" style="display: none;text-align: right" >

        <form id="alterCardForm" action="/customerAction/ajaxAlterPackage.action" method="post"  class="easyui-form">

            <div>
                <label for="customerName">姓名:</label>
                <input type="text" name="customerName" data-options="required:true,disabled:true" /><br/><br/>
                <input type="hidden" name="id" data-options="required:true" />
            </div>

            <div>
                <label for="cardName">套餐:</label>
                <select style="width: 132px;" name="cardId">
                    <%--<option value="#">请选择套餐</option>--%>
                </select>
            </div>

        </form>
        <!--toolbar for edit customer-->
        <div id="alter_card_bt" class="myButtonDiv">
            <a  data-options="iconCls:'icon-save'" style="margin:3px;" onclick="alterCard()">保存</a>
            <a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('alterCard')">取消</a>
        </div>

    </div>



<!--缴费-->
<div id="paymentAdd" style="display: none;text-align: right" >

    <form id="paymentAddForm" action="/paymentAction/ajaxAddPayment.action" method="post" class="easyui-form" >
        <div>
            <label for="customerName">姓名:</label>
            <input type="text" name="customerName" readonly="readonly" data-options="required:true" /><br/><br/>
        </div>
        <div>
            <label for="number">卡号:</label>
            <input type="text" name="number" readonly="readonly" data-options="required:true" /><br/><br/>
        </div>
        <div>
            <label for="money">套餐费:</label>
            <input type="text" name="money" data-options="required:true" value="0" onfocus="if(value=='0') {value=''}" onblur="if (value=='') {value='0'}"/><br/><br/>
        </div>
        <div>
            <label for="deposit">押金:</label>
            <input type="text" name="deposit" data-options="required:true" value="0" onfocus="if(value=='0') {value=''}" onblur="if (value=='') {value='0'}"/><br/><br/>
        </div>
        <div>
            <label for="other">备注:</label>
            <input type="text" name="other"  value="&nbsp;"/><br/><br/>
        </div>
    </form>

    <!--toolbar for add customer-->
    <div id="payment_add_bt" class="myButtonDiv">
        <a  data-options="iconCls:'icon-save'" style="margin:3px;" onclick="doAddPayment()">保存</a>
        <a  data-options="iconCls:'icon-cancel'" style="margin:3px;" onclick="closeWin('paymentAdd')">取消</a>
    </div>
</div>


<script type="application/javascript">

    /*customer*/
    function customerPreAdd() {

        $("#customerAddForm").form("clear");
        $("#customerAddForm select").empty();


        $("#customerAdd").dialog("open");

        //ajax get card list
        $.post("/cardAction/findAllCardsAsJson.action",{},function (data) {
            $.each(data.rows,function (index,card) {

                var cardNode = $("<option  value=\""+card.id+"\" >"+card.cardName+"</option>")


                $("#customerAddForm select").append(cardNode);
            })

        })


    }

	$(function () {


	    //加载所有的套餐类型
        var cardList;
        //查询所有的套餐类型
        $.post("/cardAction/findAllCardsAsJson.action",{},function (data) {
            cardList = data.rows;
        })



        //设置所有的校验
        $("div[id*='customer'] input[name!='address'][name!='other'][name!='address']").each(function () {

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

        //init all dialog

        $("#customerAdd").dialog({

            title: '添加读者',
            width: 500,
            height: 500,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#customer_add_bt'
        });


        $("#customerEdit").dialog({

            title: '编辑读者',
            width: 400,
            height: 500,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#customer_edit_bt'
        });

        $("#alterCard").dialog({

            title: '修改套餐',
            width: 400,
            height: 250,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#alter_card_bt'


        });

        $("#paymentAdd").dialog({

            title: '缴费',
            width: 500,
            height: 500,
            closed: true,
            cache: false,
            modal: true,
            buttons:'#payment_add_bt'
        });




        //初始化所有的form
        $("form").each(function () {
            $(this).addClass("myForm");
        })


    });
    
    function customerAdd() {


        var submit = $('#customerAddForm').form("validate");

        if (submit){

            $('#customerAddForm').form('submit', {
                success: function(data){

                    $("#customerAdd").dialog("close");
                    var data = eval('(' + data + ')');
                    $.messager.alert("提示",data.msg,"info")
                    $("#customerList").datagrid("reload");

                    $('#customerAddForm').form("clear");
                }
            });
        }else {
        }



    }

    function customerPreEdit() {


        $("#customerEditForm select").empty();

        var customer = getSelected("customerList");

        if(customer!=undefined) {

            //ajax get status list
            $.post("/customerAction/getAllCustomerStatus.action", {}, function (data) {
                $.each(data, function (index, status) {
                    var statusNode;

                    if (customer.status == status.id) {

                        statusNode = $("<option value=\"" + status.id + "\"  selected>" + status.statusName + "</option>")
                    } else {
                        statusNode = $("<option value=\"" + status.id + "\" >" + status.statusName + "</option>")
                    }

                    $("#customerEditForm select").append(statusNode);
                })

            });

            $("#customerEdit").dialog("open");


            var d = new Date(customer.expireTime);
            customer.expireTime = $.fn.datebox.defaults.formatter(d);

            $("#customerEditForm").form("load", customer);
        }
    }
    
    function customerEdit() {
        var submit = $('#customerEditForm').form("validate");

        if (submit) {

            $("#customerEditForm").form("submit", {

                        success: function () {
//                $.messager.alert("提示","修改成功","info");
                            $("#customerEdit").dialog("close");
                            $("#customerList").datagrid("reload");
                        }
                    }
            );

        }
    }

    function customerDelete() {


        var customer = getSelected("customerList");

        if(customer!=undefined) {

            $.messager.confirm("提示", "确定删除吗？", function (dt) {

                if (dt) {

                    $.post("/customerAction/ajaxDeleteCustomer.action", {id: customer.id}, function (data) {

                        $("#customerList").datagrid("reload");
                    })
                } else {
                }
            })
        }

    }


    function alterCard() {


        $("#alterCardForm").form("submit", {

            success: function () {
                $("#alterCard").dialog("close");
                $("#customerList").datagrid("reload");
            }
        });

    }


    function findCustomerByInput() {
        var input = $("#queryCustomerForm input[name='input']").val();

        $.post("/customerAction/ajaxFindCustomerByInput.action",{"input":encodeURI(input,"UTF-8")},function (data)   {
            var customers = eval("("+JSON.stringify(data)+")");
            $("#customerList").datagrid("loadData",customers);
        })


    }






    /*payment add*/
    function paymentPreAdd() {


        var customer = getSelected("customerList");

        if(customer!=undefined) {

            $("#paymentAdd").dialog("open");

            customer.deposit = 0;
            customer.money = 0;
            $("#paymentAddForm").form("load", customer);

        }

    }
    
    function doAddPayment() {

        var money = $("#paymentAddForm input[name='money']").val();
        var deposit = $("#paymentAddForm input[name='deposit']").val();


        if (money==0&&deposit==0){
            $.messager.alert("提示","套餐费和押金不能同时为0","error");
            return false;
        }

        $("#paymentAddForm").form("submit",{
            success:function (data) {
                reloadList('customerList');
                $("#paymentAdd").dialog("close");
                $.messager.alert("提示","缴费成功！","info");
            }
        })
    }
    
    function myFormatDate() {
        var dateStr = $("#customer_add_birthday").val();

        var y = dateStr.substring(0,4);
        var m = dateStr.substring(4,6);
        var d = dateStr.substring(6,8);

        $("#customer_add_birthday").val(y+"-"+m+"-"+d);


    }


</script>

</body>
</html>