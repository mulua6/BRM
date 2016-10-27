<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>添加书刊</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  <!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 书刊管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form action="${pageContext.request.contextPath}/bookAction/addBook.action" method="post">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 书刊信息 </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">

                    <tr><td>书室</td>
                        <td>
                            <select name="roomId" cssClass="InputStyle" style="width: 130px;text-align: center">
                                <c:forEach items="${sessionScope.roomList}" var="room">
                                    <c:if test="${room.id == book.roomId}">
                                        <option value="${room.id}" selected>${room.roomName}</option>
                                    </c:if>
                                    <c:if test="${room.id != book.roomId}">
                                        <option value="${room.id}">${room.roomName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr><td>书架</td>
                        <td>
                            <select name="shelfId" cssClass="InputStyle" style="width: 130px;text-align: center">
                                <c:forEach items="${sessionScope.shelfList}" var="shelf">
                                    <c:if test="${shelf.id == book.shelfId}">
                                        <option value="${shelf.id}" selected>${shelf.shelfName}</option>
                                    </c:if>
                                    <c:if test="${shelf.id != book.shelfId}">
                                        <option value="${shelf.id}">${shelf.shelfName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr><td>书刊ISBN</td>
                        <td>
                            <input type="text" name="isbn" cssClass="InputStyle">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/css/images/save.png"/>
            <a href="${pageContext.request.contextPath}/bookAction/findAllBooks.action"><img src="${pageContext.request.contextPath}/css/images/goBack.png"/></a>
        </div>
    </form>
</div>

  </body>
</html>
