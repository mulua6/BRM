<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/web/title.jsp"%>

<!-- 图片/FLASH -->

<div id="pdv_12020" class="pdv_class" title="" style="width:1002px;height:507px;top:0px;left:0px; z-index:2">
<div id="spdv_12020" class="pdv_content" style="overflow:hidden;width:100%;height:100%">
<div class="pdv_border" style="margin: 0px; padding: 0px; height: 507px; border: 0px solid; ">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="http://www.qiyezhengzhan.com/demo/4232/news/class/-1" style="line-height:25px;color:">更多</a>
		</div>
	</div>
<div style="padding:0px">


<img src="./files/1291796237.jpg" border="0" width="100%">

</div>
</div>

</div>
</div>

<!-- HTML编辑区 -->

<div id="pdv_12019" class="pdv_class" title="联系我们" style="width:183px;height:111px;top:384px;left:35px; z-index:10">
<div id="spdv_12019" class="pdv_content" style="overflow:hidden;width:100%;height:100%">
<div class="pdv_border" style="margin: 0px; padding: 0px; height: 111px; border: 0px solid; ">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		联系我们
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="http://www.qiyezhengzhan.com/demo/4232/news/class/-1" style="line-height:25px;color:">更多</a>
		</div>
	</div>
<div style="padding:0px">
<div style="FONT: 12px/18px simsun; COLOR: #fff">地&nbsp; 址：中牟县<br>电&nbsp; 话：0571-98765432<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0571-98765432<br>传&nbsp; 真：0571-98765430<br>邮&nbsp; 箱：boss@mail.com</div>
</div>
</div>

</div>
</div>

<!-- 当前位置提示条 -->

<div id="pdv_12028" class="pdv_class" title="当前位置" style="width:676px;height:46px;top:37px;left:287px; z-index:11">
<div id="spdv_12028" class="pdv_content" style="overflow:hidden;width:100%;height:100%">
<div class="pdv_border" style="border: 0px; background-image: url(http://www.qiyezhengzhan.com/demo/4232/base/border/788/images/top.png); padding: 0px; margin: 0px; height: 46px; background-position: initial initial; background-repeat: no-repeat no-repeat; ">
 
<link href="./files/nav.css" rel="stylesheet" type="text/css">
<div id="nav">
	&nbsp;&nbsp;您现在的位置：<s:a action="webAction_index.action?typeId=%{typeId}">${companyName}</s:a> &gt; 新闻中心

</div>

</div>

</div>
</div>

<!-- 文章翻页检索 -->

<div id="pdv_12029" class="pdv_class" title="文章检索" style="width: 674px; height: 430px; top: 120px; left: 290px; z-index: 12; ">
<div id="spdv_12029" class="pdv_content" style="overflow:visible;width:100%;">
<div class="pdv_border" style="margin:0;padding:0;height:100%;border:0px  solid;background:;">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		文章检索
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="http://www.qiyezhengzhan.com/demo/4232/news/class/-1" style="line-height:25px;color:">更多</a>
		</div>
	</div>
<div style="margin:0px;padding:0px">

<link href="./files/newslist_diy.css" rel="stylesheet" type="text/css">

<s:iterator value="%{newsList}"  id = "c"  var="news"  status = "s">
           <ul class="newslist">
           <li class="newslist_diy"><div class="time"><s:property value ="%{#news.createTime}"/></div><s:a action="webAction_findOneNews?id=%{#news.id}" target="_self" class="newslist_diy"><s:property value ="%{#news.title}"/></s:a></li>
           </ul>
	</s:iterator>

</div>

<div>
<%@ include file="/WEB-INF/jsp/common/page.jsp"%>
</div>
</div>
</div>

</div>
</div>
</div>
<div id="bottom" style="width: 1002px; height: 172px; background-image: none; background-attachment: scroll; background-color: transparent; background-position: 0% 0%; background-repeat: repeat repeat; ">


<!-- 图片/FLASH -->

<div id="pdv_12018" class="pdv_class" title="" style="width:1002px;height:116px;top:0px;left:0px; z-index:1">
<div id="spdv_12018" class="pdv_bottom" style="overflow:hidden;width:100%;height:100%">
<div class="pdv_border" style="margin: 0px; padding: 0px; height: 116px; border: 0px solid; ">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="http://www.qiyezhengzhan.com/demo/4232/news/class/-1" style="line-height:25px;color:">更多</a>
		</div>
	</div>
<div style="padding:0px">


<img src="./files/1291860827.jpg" border="0" width="100%">

</div>
</div>

</div>
</div>

<!-- 底部菜单（一级） -->

<div id="pdv_12017" class="pdv_class" style="width:371px;height:28px;top:80px;left:263px; z-index:4">
<div id="spdv_12017" class="pdv_bottom" style="overflow:hidden;width:100%;height:100%">
<div class="pdv_border" style="margin: 0px; padding: 0px; height: 28px; border: 0px solid; ">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		脚注栏目
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="http://www.qiyezhengzhan.com/demo/4232/news/class/-1" style="line-height:25px;color:">更多</a>
		</div>
	</div>

</div>
</div>

</div>
</div>

<!-- 底部信息编辑区 -->

<div id="pdv_12026" class="pdv_class" title="脚注信息" style="width:337px;height:90px;top:82px;left:648px; z-index:8">
<div id="spdv_12026" class="pdv_bottom" style="overflow:hidden;width:100%;height:100%">
<div class="pdv_border" style="margin: 0px; padding: 0px; height: 90px; border: 0px solid; ">
	<div style="height:25px;margin:1px;display:none;background:;">
		<div style="float:left;margin-left:12px;line-height:25px;font-weight:bold;color:">
		脚注信息
		</div>
		<div style="float:right;margin-right:10px;display:none">
		<a href="http://www.qiyezhengzhan.com/demo/4232/news/class/-1" style="line-height:25px;color:">更多</a>
		</div>
	</div>
<div style="padding:0px">
<div style="width:100%;text-align:center;font:12px/20px Arial, Helvetica, sans-serif">
<div style="TEXT-ALIGN: center; LINE-HEIGHT: 24px; MARGIN: 0px; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #fff">版权所有 Copyright(C)2014-2016 河南思齐置业有限公司</div>
</div>

</div>
</div>

</div>
</div>
</div>
</div><div id="bodyex">

</div>





<object id="b5tplugin" type="application/x-bang5taoplugin" style="position:absolute;left:-9000px;top:-9000px;" width="0" height="0"></object></body></html>