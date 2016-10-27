<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>查询用户缴费</title>
    
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
    <form action="${pageContext.request.contextPath}/paymentAction/findUserPayment.action">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 查询用户缴费信息 </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>用户卡号</td>
                        <td>
                            <input type="text" name="cardNumber" cssClass="InputStyle">
						</td>
                    </tr>

                </table>
            </div>
        </div>
        
			
		
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <%--<input type="image" src="${pageContext.request.contextPath}/css/images/searchbox_button.png"/>--%>
            <input type="image" src="${pageContext.request.contextPath}/css/images/search.gif"/>
            <%--<a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/css/images/goBack.png"/></a>--%>
        </div>
    </form>
</div>
  <div id="TableTail">
      <div id="TableTail_inside">
          <a href="${pageContext.request.contextPath}/go.action?to=payment/add"><img src="${pageContext.request.contextPath}/css/images/createNew.png" /></a>
      </div>
  </div>
  </body>
</html>
