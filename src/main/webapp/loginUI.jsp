<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional/EN">
<html>
<head>


<title>登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link href="/style/blue/login.css"
	rel="stylesheet" type="text/css" />

</head>

<BODY LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0
	CLASS=PageBody>
	<form id="login" METHOD="post" NAME="actForm"
		action="login2.action">
		<DIV ID="CenterAreaBg">
			<DIV ID="CenterArea">
				<DIV ID="LogoImg">
					<IMG BORDER="0"
						SRC="/style/blue/images/logo.png" />
				</DIV>
				<DIV ID="LoginInfo">
					<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 width=100%>
						<TR>
							<TD width=45 CLASS="Subject"><IMG BORDER="0"
								SRC="/style/blue/images/login/userId.gif" />
							</TD>

							<%--<s:property value="login" />--%>
							<TD><textfield SIZE="20" cssClass="TextField" TYPE="text"
									name="logonName"></textfield>
								<input type="text" name="name" value="${user.name}"/>
							</TD>

							<TD ROWSPAN="2" STYLE="padding-left: 10px;"><INPUT id="ss"
								TYPE="image"
								SRC="/style/blue/images/login/userLogin_button.gif" /></TD>
						</TR>
						<TR>
							<TD CLASS="Subject"><IMG BORDER="0"
								SRC="/style/blue/images/login/password.gif" /></TD>
							<TD><input SIZE="20" cssClass="TextField"
									TYPE="password" name="password"></TD>

						</TR>
					</TABLE>
				</DIV>
				<DIV ID="CopyRight">
					<A HREF="javascript:void(0)">&copy; 2014 版权所有 刘鹤</A>
				</DIV>
			</DIV>
		</DIV>
	</form>
</BODY>
</html>
