<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Top</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="style/blue/top.css" />
	<script type="text/javascript" src="style/js/jquery-1.4.2.js"></script>
	 <script type="text/javascript">
		$(document).ready(function(){
			var date = new Date();
			var d = date.toLocaleDateString();
			var a = $("#aa").val();
		}); 
</script>
</head>

<body class="PageBody" style="margin: 0">

	<div id="Head1">
		<div id="Logo">
			<a id="msgLink" href="javascript:void(0)"></a>
            <font color="#0000CC" style="color:#F1F9FE; font-size:28px; font-family:Arial Black, Arial">安东尼绘本馆图书管理系统</font>
			<!--<img border="0" src="style/blue/images/logo.png" />-->
        </div>
		
		<div id="Head1Right">
			<div id="Head1Right_UserName">
                <img border="0" width="13" height="14" src="style/images/top/user.gif" /> 您好，<b>管理员</b>
			</div>
			<div id="Head1Right_UserDept"></div>
			
			<div id="Head1Right_Time"></div>
		</div>
		
        <div id="Head1Right_SystemButton">
            <a target="_parent" href="loginUI.jsp">
				<img width="78" height="20" alt="退出系统" src="style/blue/images/top/logout.gif" />
			</a>
        </div>
		
	</div>
    
    <div id="Head2">
        <div id="Head2_Awoke">
            <ul id="AwokeNum">
                <li><a target="desktop" href="javascript:void(0)">
						<img border="0" width="11" height="13"  src="style/images/top/msg.gif" />
						
					</a>
				</li>
               
            </ul>
        </div>
        
		<div id="Head2_FunctionList">
			<marquee style="WIDTH: 100%;" onMouseOver="this.stop()" onMouseOut="this.start()" 
				scrollamount=1 scrolldelay=30 direction=left>
				<b> </b>
			</marquee>
		</div>
	</div>

</body>
</html>
