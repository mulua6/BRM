<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>缴费列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/zTreeStyle/zTreeStyle.css" type="text/css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-ztree-2.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/tree-event-pro.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/user_role.js"></script>
	
	
  </head>
  
  <body>
  <div>
  <div id="Title_bar_Head"> 
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 缴费管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>
    <div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="100">编号</td>
                <td width="100">读者名字</td>
                <td width="100">读者卡号</td>
                <td width="100">套餐费</td>
                <td width="100">押金</td>
                <td width="100">时间</td>
                <td width="100">原因</td>
                <td width="100">备注</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">

            <c:forEach items="${paymentList}" var="payment" varStatus="s">

                <tr class="TableDetail1 template">
                    <td align="center" style="text-align: center">${s.count}</td>
                    <td align="center" style="text-align: center">${customer.customerName}</td>
                    <td align="center" style="text-align: center">${customer.number}</td>
                    <td align="center" style="text-align: center">${payment.money}</td>
                    <td align="center" style="text-align: center">${payment.deposit}</td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${payment.time}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center">${payment.reason}</td>
                    <td align="center" style="text-align: center">${payment.other}&nbsp;</td>
                    <td><a href="${pageContext.request.contextPath}/paymentAction/deletePayment.action?id=${payment.id}">删除</a>
                        <%--|--%>
                        <%--<a href="${pageContext.request.contextPath}/paymentAction/preUpdatePayment.action?id=${payment.id}">修改</a>--%>
                    </td>
                </tr>


            </c:forEach>
        </tbody>
    </table>
    
       <div id="TableTail">
        <div id="TableTail_inside">
            <a href="${pageContext.request.contextPath}/go.action?to=payment/add"><img src="${pageContext.request.contextPath}/css/images/createNew.png" /></a>
        </div>
    </div>
    
    <%--<div class="ItemBlock_Title1" id="userTitle" style="display: none;">--%>
	<%--<!-- 信息说明 --><div class="ItemBlock_Title1">--%>
		        	<%--<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif"/>--%>
		        	<%--<div id="userImage"></div>--%>
    			   <%--</div>--%>
    <%--<div class="ItemBlock_Title1" id="privilegeTitle" style="display: none;"><div class="ItemBlock_Title1">--%>
        	<%--<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" />选择角色</div> --%>
        <%--</div>--%>
        <%----%>
        <%--<!-- 表单内容显示 -->--%>
        <%--<div class="ItemBlockBorder" style="display: none;" id="privilegeContent">--%>
            <%--<div class="ItemBlock">--%>
                <%--<table cellpadding="0" cellspacing="0" class="mainForm">--%>
					<%--<!--表头-->--%>
					<%--<thead>--%>
						<%--<tr align="LEFT" valign="MIDDLE" id="TableTitle">--%>
							<%--<td width="300px" style="padding-left: 7px;">--%>
								<%--<!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->--%>
								<%--<input type="checkbox" id="allchecked"/>--%>
								<%--<label for="cbSelectAll">全选</label>--%>
							<%--</td>--%>
						<%--</tr>--%>
					<%--</thead>--%>
                   <%----%>
			   		<%--<!--显示数据列表-->--%>
					<%--<tbody id="TableData">--%>
						<%--<tr class="TableDetail1">--%>
							<%--<!-- 显示权限树 -->--%>
							<%--<td>--%>
								<%--<ul id='roleTree' class="tree"></ul>--%>
								<%--<img id="loading" src="css/images/loading.gif">--%>
							<%--</td>--%>
						<%--</tr>--%>
					<%--</tbody>--%>
                <%--</table>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<!-- 表单操作 -->--%>
        <%--<div id="InputDetailBar">--%>
            <%--<image id="saveRole" src="${pageContext.request.contextPath}/style/images/save.png"/>--%>
        <%--</div>--%>
</div>
  </body>
</html>
