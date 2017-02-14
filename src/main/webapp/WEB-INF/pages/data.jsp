<%--
  Created by IntelliJ IDEA.
  User: liuhe
  Date: 2017/2/11
  Time: 下午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>DataGrid Complex Toolbar - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery/css/demo.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/datagrid-filter.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/brm.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/locale/easyui-lang-zh_CN.js"></script>



</head>
<body>


<table class="easyui-datagrid" style="width:1280px;height:700px"
       url="/customerAction/findAllCustomersAsJson.action"
       title="DataGrid - Complex Toolbar" toolbar="#tb"
       singleSelect="true" fitColumns="true">
    <thead>
    <tr>
        <th field="itemid" width="60">Item ID</th>
        <th field="customerName" width="80">customerName</th>
        <th field="listprice" align="right" width="70">List Price</th>
        <th field="unitcost" align="right" width="70">Unit Cost</th>
        <th field="attr1" width="200">Address</th>
        <th field="status" width="50">Status</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
    </div>
    <div>
        Date From: <input class="easyui-datebox" style="width:80px">
        To: <input class="easyui-datebox" style="width:80px">
        Language:
        <input class="easyui-combobox" style="width:100px"
               url="data/combobox_data.json"
               valueField="id" textField="text">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
    </div>
</div>



</body>
</html>

