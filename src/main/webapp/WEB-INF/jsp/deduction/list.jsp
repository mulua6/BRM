<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>扣费列表</title>
    
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 扣费记录
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
                <td width="100">书名</td>
                <td width="100">扣款金额</td>
                <td width="100">扣款原因</td>
                <td width="100">时间</td>
                <td>相关操作</td>
            </tr>
        </thead>
        
        <!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="userList">

            <c:forEach items="${deductionList}" var="deduction" varStatus="s">

                <tr class="TableDetail1 template">
                    <td align="center" style="text-align: center">${s.count}</td>
                    <td align="center" style="text-align: center">${deduction.customerName}</td>
                    <td align="center" style="text-align: center">${deduction.bookName}</td>
                    <td align="center" style="text-align: center">${deduction.money}</td>
                    <td align="center" style="text-align: center">${deduction.reason}</td>
                    <td align="center" style="text-align: center"><fmt:formatDate value="${deduction.createTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td align="center" style="text-align: center"><a href="/borrowAction/findBorrowById.action?id=${deduction.borrowId}">查看借书记录</a></td>
                </tr>


            </c:forEach>
        </tbody>
    </table>
    
       <div id="TableTail">
        <div id="TableTail_inside">
            <a href="${pageContext.request.contextPath}/go.action?to=payment/add"><img src="${pageContext.request.contextPath}/css/images/createNew.png" /></a>
        </div>
    </div>

</div>
  </body>
</html>
