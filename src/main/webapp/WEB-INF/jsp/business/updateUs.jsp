<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<HTML>
<HEAD>
	<TITLE>关于我们</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script language="javascript" src="${pageContext.request.contextPath}/style/js/pageCommon.js" charset="utf-8"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/style/js/PageUtils.js" charset="utf-8"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/style/js/DemoData.js" charset="utf-8"></script>
	<script language="javascript" src="${pageContext.request.contextPath}/style/js/DataShowManager.js" charset="utf-8"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/blue/pageCommon.css" />
    <script type="text/javascript">
    </script>


</HEAD>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 关于我们
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <s:form action="businessAction_updateAboutUs.action">
        <div class="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 公司简介</DIV>  -->
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                	<tr>
                        <td width="100"><h3>公司名称:&nbsp;&nbsp;</h3></td>
                        <s:hidden name="id" value="%{aboutUs.id}"></s:hidden>
                        <td><s:textfield style="  width:600px; height:25px;  " name="name" value="%{aboutUs.name}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>公司地址:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="address" value="%{aboutUs.address}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>公司电话:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="tel" value="%{aboutUs.tel}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>联&nbsp;系&nbsp;人:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="contacts" value="%{aboutUs.contacts}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>联系方式:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="phone" value="%{aboutUs.phone}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>公司邮箱:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="mail" value="%{aboutUs.mail}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>公司传真:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="fax" value="%{aboutUs.fax}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                	<tr>
                        <td width="100"><h3>公司邮编:&nbsp;&nbsp;</h3></td>
                        <td><s:textfield style="  width:600px; height:25px;  " name="zipCode" value="%{aboutUs.zipCode}" class="InputStyle" ></s:textfield> </td>
                    </tr>
                </table>
            </div>
        </div>
        
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/style/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/style/images/goBack.png"/></a>
        </div>
    </s:form>
</div>

</body>
</html>
