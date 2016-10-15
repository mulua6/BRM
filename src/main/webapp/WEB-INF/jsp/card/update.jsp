<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>卡类型</title>
    
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 套餐管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form action="${pageContext.request.contextPath}/cardAction/updateCard.action" method="post">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 套餐信息修改 </div>
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>套餐名称</td>
                        <td>
                            <input type="hidden" name="id" value="${card.id}">
                            <input type="text" name="cardName" value="${card.cardName}" cssClass="InputStyle"/>
						</td>
                    </tr>
                    <tr><td>收费金额</td>
                        <td>
                            <input type="text" name="price" value="${card.price}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>可借书数量</td>
                        <td>
                            <input type="text" name="number" value="${card.number}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>押金金额</td>
                        <td>
                            <input type="text" name="deposit" value="${card.deposit}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>丢失罚金</td>
                        <td>
                            <input type="text" name="lost" value="${card.lost}" cssClass="InputStyle"/>
                        </td>
                    </tr>
                    <tr><td>损坏罚金</td>
                        <td>
                            <input type="text" name="broken" value="${card.broken}" cssClass="InputStyle"/>
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
