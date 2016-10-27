<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>借阅列表</title>
    
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> ${title}
        </div>
        <div id="Title_End"></div>
    </div>
</div>
    <div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align=center valign=middle id=TableTitle>
                <td width="30">序号</td>
                <td width="60">姓名</td>
                <td width="60">卡号</td>
                <td width="60">书名</td>
                <td width="60">ISBN</td>
                <td width="100">出版社</td>
                <td width="100">借书时间</td>
                <td width="100">到期时间</td>
                <td width="100">归还时间</td>
                <%--<td width="60">状态</td>--%>
                <%--<td>相关操作</td>--%>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">

            <c:forEach items="${borrowVOList}" var="borrowVO" varStatus="s">

                <tr class="TableDetail1 template">
                    <td align="center" style="text-align: center">${s.count}</td>
                    <td align="center" style="text-align: left">${borrowVO.customerName}</td>
                    <td align="center" style="text-align: center">${borrowVO.cardNumber}</td>
                    <td align="center" style="text-align: center">${borrowVO.bookName}</td>
                    <td align="center" style="text-align: center">${borrowVO.isbn}</td>
                    <td align="center" style="text-align: center">${borrowVO.publisher}</td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${borrowVO.borrowTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${borrowVO.expireTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>

                    <td align="center" style="text-align: center">

                        <c:if test="${borrowVO.backTime != null}">
                            <fmt:formatDate value="${borrowVO.backTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                        </c:if>

                        <c:if test="${borrowVO.backTime == null}">
                            <a href="${pageContext.request.contextPath}/borrowAction/backBorrow.action?id=${borrowVO.id}">还书</a> |
                            <a href="${pageContext.request.contextPath}/borrowAction/renewBorrow.action?id=${borrowVO.id}">续借</a> |
                            <a href="${pageContext.request.contextPath}/borrowAction/preLostBorrow.action?id=${borrowVO.id}
                            &cardNumber=${borrowVO.cardNumber}
                            &customerName=${borrowVO.customerName}
                            &isbn=${borrowVO.isbn}
                            &op=0">丢失</a> |

                            <a href="${pageContext.request.contextPath}/borrowAction/preLostBorrow.action?id=${borrowVO.id}
                            &cardNumber=${borrowVO.cardNumber}
                            &customerName=${borrowVO.customerName}
                            &isbn=${borrowVO.isbn}
                            &op=1">破损</a>
                        </c:if>

                    </td>

                    <td>
                        <%--<a href="${pageContext.request.contextPath}/borrowVOAction/deleteBook.action?id=${borrowVO.id}">删除</a> |--%>
                        <%--<a href="${pageContext.request.contextPath}/borrowVOAction/preUpdateBook.action?id=${borrowVO.id}">修改</a>--%>
                    </td>
                </tr>


            </c:forEach>
        </tbody>
    </table>
    
       <div id="TableTail">
        <div id="TableTail_inside">
        </div>
    </div>
    

</div>
  </body>
</html>
