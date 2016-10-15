<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>安东尼绘本馆-水岸新城店</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<frameset rows="100,*,25" framespacing="0" border="0" frameborder="0">
	    <frame src="forward.action?turnTo=top" name="TopMenu"  scrolling="no" noresize />
	    <frameset cols="250,*" id="resize">
	    	<frameset cols="*,3" id="resize">
		        <frame noresize name="menu" src="forward.action?turnTo=left" scrolling="yes" />
		        <frame noresize name="mid" src="forward.action?turnTo=mid" scrolling="no" />
	        </frameset>
	        <frame noresize name="right" src="forward.action?turnTo=right" scrolling="yes" />
	    </frameset>
	    <frame noresize name="status_bar" scrolling="no" src="forward.action?turnTo=bottom" />
	</frameset>
  </head>
  
  <body>
  </body>
</html>
