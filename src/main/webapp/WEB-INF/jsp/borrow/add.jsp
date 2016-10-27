<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>借阅图书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

      <script type="text/javascript" >

          function checkIfBorrowed() {

              var cardNumber = $("#cardNumber").val();
              var isbn = $("#isbn").val();

              $.post(
                      "${pageContext.request.contextPath}/borrowAction/checkIfBorrowed.action",
                      {'cardNumber':cardNumber,'isbn':isbn},
                      function (result) {
                          if(result=="1"){
                              $("#save").attr("disabled", false);
                              alert("这本书已经借过了，是否还要再次借阅？")
                          }else if (result=="0"){
                              $("#save").attr("disabled", false);
                          }else {
                              $("#save").attr("disabled", true);
                              alert(result)
                          }
                      },
                      'text'
              )
          }



      </script>

  </head>
  
  <body>
  <!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 借阅管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form action="${pageContext.request.contextPath}/borrowAction/addBorrow.action" method="post">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 借阅图书 </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">

                    <tr><td>读者卡号</td>
                        <td>
                            <input id="cardNumber" type="text" name="cardNumber" value="${cardNumber}" cssClass="InputStyle">
                        </td>
                    </tr>
                    <tr><td>书刊ISBN</td>
                        <td>
                            <input id="isbn" type="text" name="isbn" cssClass="InputStyle" onblur="checkIfBorrowed()">
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        
			
		
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input id="save" type="image" src="${pageContext.request.contextPath}/css/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/css/images/goBack.png"/></a>
        </div>
    </form>
</div>

  </body>
</html>
