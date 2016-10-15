<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>添加读者</title>
    
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
    <form action="${pageContext.request.contextPath}/customerAction/addCustomer.action" method="post">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 读者信息 </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">

                    <tr><td>姓名</td>
                        <td>
                            <input type="text" name="customerName" cssClass="InputStyle">
                        </td>
                    </tr>
                    <tr><td>套餐</td>
                        <td>
                            <select name="cardId" cssClass="InputStyle" style="width: 130px;text-align: center">
                                <c:forEach items="${sessionScope.cardList}" var="card">
                                    <option value="${card.id}">${card.cardName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr><td>卡号</td>
                    <td>
                        <input type="text" name="number" cssClass="InputStyle">
                    </td>
                </tr><tr><td>电话</td>
                    <td>
                        <input type="text" name="phone" cssClass="InputStyle">
                    </td>
                </tr><tr><td>性别</td>
                    <td>
                        <select name="sex" cssClass="InputStyle" style="width: 130px;text-align: center">
                            <c:forEach items="${sessionScope.sexList}" var="sex">
                                <option value="${sex.key}">${sex.value}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                </tr>

                    <tr><td>生日</td>
                        <td>
                            <input type="text" name="birthday" cssClass="InputStyle">
                        </td>
                    </tr>

                    <tr><td>联系地址</td>
                        <td>
                            <input type="text" name="address" cssClass="InputStyle">
                        </td>
                     </tr>

                    <tr><td>状态</td>
                    <td>
                        <select name="status" cssClass="InputStyle" style="width: 130px;text-align: center">
                            <c:forEach items="${sessionScope.statusList}" var="s">
                                <option value="${s.number}">${s.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr><tr><td>备注</td>
                    <td>
                        <input type="text" name="other" cssClass="InputStyle">
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
