<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>岗位列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/style/zTreeStyle/zTreeStyle.css" type="text/css"> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/jquery-ztree-2.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/tree-event-pro.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/style/js/role_privilege.js"></script>
	
	
  </head>
  
  <body>
    <div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="./css/images/title_arrow.gif"/> 岗位管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">
       
        <!-- 表头-->
        <thead>
            <tr align="CENTER" valign="MIDDLE" id="TableTitle">
            	<td width="200px">岗位名称</td>
                <td width="300px">岗位说明</td>
                <td>相关操作</td>
            </tr>
        </thead>

		<!--显示数据列表-->
        <tbody id="TableData" class="dataContainer" datakey="roleList">
        	<s:iterator value="roles">
				<tr class="TableDetail1 template">
					<td>${name}&nbsp;</td>
					<s:hidden name="rid"></s:hidden>
					<td>${description}&nbsp;</td>
					<td><s:a action="roleAction_delete?rid=%{rid}">删除</s:a>
						<s:a action="roleAction_updateUI?rid=%{rid}">修改</s:a>
						<s:a>设置权限</s:a>
					</td>
				</tr>
			</s:iterator>
        </tbody>
    </table>
    
    <!-- 其他功能超链接   新建-->
    <div id="TableTail">
        <div id="TableTail_inside">
            <s:a action="roleAction_saveUI"><img src="./css/images/createNew.png" /></s:a>
        </div>
    </div>
	
	<!--    设置权限的面板   默认是隐藏的-->
	
	<div class="ItemBlock_Title1" id="userTitle" style="display: none;"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif"/>
        	<div id="roleImage"></div>
        </div>
    <div class="ItemBlock_Title1" id="privilegeTitle" style="display: none;"><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" />选择权限</div> 
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder" style="display: none;" id="privilegeContent">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
					
                   
			   		<!--显示数据列表-->
					<tbody id="TableData">
						<tr class="TableDetail1">
							<!-- 显示权限树 -->
							<td>
								<ul id='privilegeTree' class="tree"></ul>
								<img id="loading" src="css/images/loading.gif">
							</td>
						</tr>
					</tbody>
                </table>
            </div>
        </div>
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <image id="savePrivilege" src="${pageContext.request.contextPath}/css/images/save.png"/>
        </div>
</div>
  </body>
</html>
