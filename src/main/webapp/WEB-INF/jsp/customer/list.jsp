<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>读者列表</title>
    
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 读者管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>
    <div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="60">序号</td>
                <td width="60">姓名</td>
                <td width="60">套餐</td>
                <td width="100">卡号</td>
                <td width="100">电话</td>
                <td width="60">性别</td>
                <td width="100">生日</td>
                <td width="80">加入时间</td>
                <td width="80">到期时间</td>
                <td width="60">状态</td>
                <td width="100">联系地址</td>
                <td width="100">备注</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">

            <c:forEach items="${customerList}" var="customer" varStatus="s">

                <tr class="TableDetail1 template">
                    <td align="center" style="text-align: center">${s.count}</td>
                    <td align="center" style="text-align: center">${customer.customerName}</td>

                    <%--套餐--%>
                    <td align="center" style="text-align: center">
                        <c:forEach items="${sessionScope.cardList}" var="card">

                            <c:if test="${customer.cardId == card.id}">
                                ${card.cardName}
                            </c:if>
                        </c:forEach>
                    </td>

                    <td align="center" style="text-align: center">${customer.number}</td>
                    <td align="center" style="text-align: center">${customer.phone}</td>
                    <td align="center" style="text-align: center">
                        <c:if test="${customer.sex == 1 }">
                            男
                        </c:if>
                        <c:if test="${customer.sex == 0 }">
                            女
                        </c:if>
                    </td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${customer.birthday}" pattern="yyyy-mm-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${customer.createTime}" pattern="yyyy-mm-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${customer.expireTime}" pattern="yyyy-mm-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center">${customer.status}</td>
                    <td align="center" style="text-align: center">${customer.address}</td>
                    <td align="center" style="text-align: center">${customer.other}</td>
                    <td><a href="${pageContext.request.contextPath}/customerAction/deleteCustomer.action?id=${customer.id}">删除</a> |
                        <a href="${pageContext.request.contextPath}/customerAction/preUpdateCustomer.action?id=${customer.id}">修改</a>
                    </td>
                </tr>


            </c:forEach>
        </tbody>
    </table>
    
       <div id="TableTail">
        <div id="TableTail_inside">
            <a href="${pageContext.request.contextPath}/go.action?to=customer/add"><img src="${pageContext.request.contextPath}/css/images/createNew.png" /></a>
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
