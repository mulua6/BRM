<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>书刊列表</title>
    
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
            <tr>
                <td>
                    <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 书刊管理
                </td>
            </tr>
        </div>
        <div id="Title_End"></div>
    </div>
</div>

    <div id="MainArea">

        <div id="TableTail">
            <div id="TableTail_inside">
                <a href="${pageContext.request.contextPath}/go.action?to=book/preAdd"><img src="${pageContext.request.contextPath}/css/images/createNew.png" /></a>
            </div>
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="60">序号</td>
                <td width="60">书名</td>
                <td width="60">ISBN</td>
                <%--<td width="100">编号</td>--%>
                <td width="100">作者</td>
                <td width="100">出版时间</td>
                <td width="100">出版社</td>
                <td width="60">定价</td>
                <td width="60">包装</td>
                <td width="60">书室</td>
                <td width="60">书架</td>
                <td width="100">备注</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">

            <c:forEach items="${bookList}" var="book" varStatus="s">

                <tr class="TableDetail1 template">
                    <td align="center" style="text-align: center">${s.count}</td>
                    <td align="center" style="text-align: left">${book.bookName}</td>
                    <td align="center" style="text-align: center">${book.isbn}</td>
                    <%--<td align="center" style="text-align: center">${book.number}</td>--%>
                    <td align="center" style="text-align: center">${book.author}</td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${book.publishTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center">${book.publisher}</td>
                    <td align="center" style="text-align: center">${book.price}</td>
                    <td align="center" style="text-align: center">${book.packaging}</td>
                    <%--<td align="center" style="text-align: center">${book.roomId}</td>--%>
                    <%--<td align="center" style="text-align: center">${book.shelfId}</td>--%>


                    <%--书室--%>
                    <td align="center" style="text-align: center">
                        <c:forEach items="${sessionScope.roomList}" var="room">

                            <c:if test="${book.roomId == room.id}">
                                ${room.roomName}
                            </c:if>
                        </c:forEach>
                    </td>
                    <%--书架--%>
                    <td align="center" style="text-align: center">
                        <c:forEach items="${sessionScope.shelfList}" var="shelf">

                            <c:if test="${book.shelfId == shelf.id}">
                                ${shelf.shelfName}
                            </c:if>
                        </c:forEach>
                    </td>

                    <td align="center" style="text-align: center">${book.other}</td>
                    <td><a href="${pageContext.request.contextPath}/bookAction/deleteBook.action?id=${book.id}">删除</a> |
                        <a href="${pageContext.request.contextPath}/bookAction/preUpdateBook.action?id=${book.id}">修改</a>
                    </td>
                </tr>


            </c:forEach>
        </tbody>
    </table>
    
       <%--<div id="TableTail">--%>
        <%--<div id="TableTail_inside">--%>
            <%--<a href="${pageContext.request.contextPath}/go.action?to=book/preAdd"><img src="${pageContext.request.contextPath}/css/images/createNew.png" /></a>--%>
        <%--</div>--%>
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
