<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>修改用户</title>
    
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
            <img border="0" width="13" height="13" src="./css/images/title_arrow.gif"/> 用户信息
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <s:form action="userAction_update">
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="./css/blue/images/item_point.gif" /> 用户信息 </div> 
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr><td>登录名</td>
                        <td><s:textfield name="logonName" readonly="true" cssClass="InputStyle"></s:textfield>*
							（登录名不能修改）
						</td>
                    </tr>
                    <tr><td>密码</td>
                        <td><s:textfield name="password" readonly="false" cssClass="InputStyle"></s:textfield>*
						</td>
                    </tr>
                    <tr><td>用户名</td>
                        <td><s:hidden name="uid" value="%{uid}"></s:hidden>
                        <s:textfield name="username" cssClass="InputStyle"></s:textfield>*
						</td>
                    </tr>
					<tr><td>性别</td>
                        <td><s:radio name="sex" list="#{'male':'男','female':'女' }"></s:radio>
						</td>
                    </tr>
					<tr><td>联系电话</td>
                        <td><s:textfield name="phone" cssClass="InputStyle" ></s:textfield></td>
                    </tr>
                    <tr><td>E-mail</td>
                        <td><s:textfield name="email" cssClass="InputStyle"></s:textfield></td>
                    </tr>
                </table>
            </div>
        </div>
         <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="./css/images/save.png"/>
            <s:a href="javascript:history.go(-1);"><img src="./css/images/goBack.png"/></s:a>
        </div>
    </s:form>
</div>

  </body>
</html>
