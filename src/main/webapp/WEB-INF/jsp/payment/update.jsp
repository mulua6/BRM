<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>用户缴费</title>
    
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 缴费管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form action="${pageContext.request.contextPath}/paymentAction/updatePayment.action" method="post">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 更新缴费信息 </div>
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>读者名字</td>
                        <td>
                            <input type="hidden" name="id" value="${payment.id}">
                            <input type="hidden" name="cardNumber" value="${customer.number}">
                            <input type="hidden" name="customerId" value="${customer.id}">
                            <input type="hidden" name="reason" value="${payment.reason}">
                            <input type="text"  value="${customer.customerName}" readonly cssClass="InputStyle"/>
						</td>
                    </tr>
                    <c:if test="${payment.money != null}">
                        <tr><td>套餐费</td>
                            <td>
                                <input type="text" name="money" value="${payment.money}" cssClass="InputStyle"/>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${payment.deposit != null}">
                        <tr><td>押金</td>
                            <td>
                                <input type="text" name="deposit" value="${payment.deposit}" cssClass="InputStyle"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr><td>时间</td>
                        <td>
                            <input type="text" name="time" value="<fmt:formatDate value="${payment.time}" pattern="yyyy-MM-dd"></fmt:formatDate>" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>备注</td>
                        <td>
                            <input type="text" name="other" value="${payment.other}" cssClass="InputStyle"/>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
         <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/css/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/css/images/goBack.png"/></a>
        </div>
    </form>
</div>

  </body>
</html>
