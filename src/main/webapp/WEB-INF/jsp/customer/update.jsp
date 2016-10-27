<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>读者用户</title>
    
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 读者管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form action="${pageContext.request.contextPath}/customerAction/updateCustomer.action" method="post">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 读者信息 </div>
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>名字</td>
                        <td>
                            <input type="hidden" name="id" value="${customer.id}">
                            <input type="text" name="customerName" value="${customer.customerName}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>套餐</td>
                        <td>
                            <select name="cardId" cssClass="InputStyle" style="width: 130px;text-align: center">
                                <c:forEach items="${sessionScope.cardList}" var="card">
                                    <c:if test="${card.id == customer.cardId}">
                                        <option value="${card.id}" selected>${card.cardName}</option>
                                    </c:if>
                                    <c:if test="${card.id != customer.cardId}">
                                        <option value="${card.id}">${card.cardName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr><td>卡号</td>
                        <td>
                            <input type="text" name="number" value="${customer.number}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>电话</td>
                        <td>
                            <input type="text" name="phone" value="${customer.phone}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>性别</td>
                        <td>
                            <select name="sex" cssClass="InputStyle" style="width: 130px;text-align: center">
                                <c:forEach items="${sessionScope.sexList}" var="sex">
                                    <c:if test="${sex.key == customer.sex}">
                                        <option value="${sex.key}" selected>${sex.value}</option>
                                    </c:if>
                                    <c:if test="${sex.key != customer.sex}">
                                        <option value="${sex.key}">${sex.value}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr><td>生日</td>
                        <td>
                            <input type="text" name="birthday" value="<fmt:formatDate value="${customer.birthday}"  pattern="yyyy-MM-dd"></fmt:formatDate>" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>加入时间</td>
                        <td>
                            <input type="text" name="createTime" value="<fmt:formatDate value="${customer.createTime}" type="date"></fmt:formatDate>" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>到期时间</td>
                        <td>
                            <input type="text" name="expireTime" value="<fmt:formatDate value="${customer.expireTime}" type="date"></fmt:formatDate>" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>押金</td>
                        <td>
                            <input type="text" name="deposit" value="${customer.deposit}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>状态</td>
                        <td>
                            <select name="status" cssClass="InputStyle" style="width: 130px;text-align: center">
                                <c:forEach items="${sessionScope.statusList}" var="st">
                                    <c:if test="${st.number == customer.status}">
                                        <option value="${st.number}" selected>${st.name}</option>
                                    </c:if>
                                    <c:if test="${st.number != customer.status}">
                                        <option value="${st.number}">${st.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr><td>联系地址</td>
                        <td>
                            <input type="text" name="address" value="${customer.address}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>备注</td>
                        <td>
                            <input type="text" name="other" value="${customer.other}" cssClass="InputStyle"/>
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
