<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
	<title><s:property value="%{head}" /></title>
	<meta content="" name="keywords">
<meta content="" name="description">
	<link href="./files/common.css" rel="stylesheet" type="text/css">
		<link href="./files/A.css" rel="stylesheet" type="text/css">
		<style type="text/css">
ul li {
	margin: 0;
	padding: 0;
	list-style: none;
}

F
.ban li.current {
	display: block;
}

.ban li {
	display: none;
	width: 201px;
	height: 160px;
}

.dot {
	position: absolute;
	bottom: 18px;
	right: 15px;
}

.dot li {
	float: left;
	width: 10px;
	height: 10px;
	background: url(../images/banner-dot1.png) no-repeat;
	margin-right: 8px;
}

.dot li.current {
	background: url(../images/banner-dot2.png) no-repeat;
}
</style>
		<script type="text/javascript" src="./files/base.js"></script>
		<script type="text/javascript" src="./files/common.js"></script>
		<script type="text/javascript" src="./files/form.js"></script>
		<script type="text/javascript" src="./files/blockui.js"></script>
		<!---reload-!-->
		<script type="text/javascript" id="b5mmain" src="./files/b5m.main.js"></script>
		<script type="text/javascript" async="" src="./files/flag.js"></script>
		<script type="text/javascript" async="" src="./files/b5m.adv.js"></script>
		<script type="text/javascript" async=""
			src="./files/jquery-highcharts.js"></script>
		<script type="text/javascript" async="" src="./files/b5m.common.js"></script>
</head>

<script type="text/javascript" src="./files/channelmenu_6.js"></script>
<script>
	var PDV_PAGEID = '1';
	var PDV_RP = '';
	var PDV_COLTYPE = 'index';
	var PDV_PAGENAME = 'index';

	$(function() {
		var num = 1;
		var timer;
		$('.dot li').mouseover(
				function() {

					$(this).addClass('current').siblings().removeClass();
					$('.ban li').eq($(this).index()).stop().hide().fadeIn()
							.siblings().hide();
					num = $(this).index() + 1;

				})
		function outplay() {

			if (num >= 5) {
				num = 0;
			}
			$('.dot li').eq(num).addClass('current').siblings().removeClass();
			$('.ban li').eq(num).stop().hide().fadeIn().siblings().hide();
			num++;
		}
		timer = setInterval(outplay, 2000);
		$('.dot li').mouseover(function() {
			clearInterval(timer);
		}).mouseout(function() {
			timer = setInterval(outplay, 2000);
		})
	})
</script>
</head>
<body style="background: #48afe2">


	<div id="contain"
		style="width: 1002px; background: none transparent scroll repeat 0% 0%; margin: 0px auto; padding: 0px">

		<div id="top"
			style="width: 1002px; height: 313px; background-image: none; background-attachment: scroll; background-color: transparent; background-position: 0% 0%; background-repeat: repeat repeat;">


			<!-- 图片/FLASH -->

			<div id="pdv_11513" class="pdv_class" title=""
				style="width: 1002px; height: 313px; top: 0px; left: 0px; z-index: 3">
				<div id="spdv_11513" class="pdv_top"
					style="overflow: hidden; width: 100%; height: 100%">
					<div class="pdv_border"
						style="margin: 0px; padding: 0px; height: 313px; border: 0px solid;">
						<div
							style="height: 25px; margin: 1px; display: none; background:;">
							<div
								style="float: left; margin-left: 12px; line-height: 25px; font-weight: bold; color:">

							</div>
							<div style="float: right; margin-right: 10px; display: none">
								<a href="http://www.qiyezhengzhan.com/demo/4232/-1"
									style="line-height: 25px; color:">更多</a>
							</div>
						</div>
						<div style="padding: 0px">


							<img src="./files/1291790510.jpg" border="0" width="100%">
						</div>
					</div>

				</div>
			</div>

			<!-- 自定义透明FLASH -->

			<div id="pdv_10802" class="pdv_class" title=""
				style="width: 1000px; height: 217px; top: 95px; left: 1px; z-index: 5">
				<div id="spdv_10802" class="pdv_top"
					style="overflow: hidden; width: 100%; height: 100%">
					<div class="pdv_border"
						style="margin: 0px; padding: 0px; height: 217px; border: 0px solid;">
						<div
							style="height: 25px; margin: 1px; display: none; background:;">
							<div
								style="float: left; margin-left: 12px; line-height: 25px; font-weight: bold; color:">

							</div>
							<div style="float: right; margin-right: 10px; display: none">
								<a href="http://www.qiyezhengzhan.com/demo/4232/-1"
									style="line-height: 25px; color:">更多</a>
							</div>
						</div>
						<div style="padding: 0px">


							<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
								codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
								width="100%" height="100%">
								<param name="movie" value="./file/1262833583.swf">
									<param name="quality" value="high">
										<param name="wmode" value="transparent">
											<embed src="./file/1262833583.swf" wmode="transparent"
												quality="high"
												pluginspage="http://www.macromedia.com/go/getflashplayer"
												type="application/x-shockwave-flash" width="1000"
												height="217">
							</object>

						</div>
					</div>

				</div>
			</div>

			<!-- 全站搜索表单 -->

			<!-- 网站标志 -->

			<div id="pdv_10806" class="pdv_class" title=""
				style="width: 226px; height: 97px; top: 0px; left: 37px; z-index: 7">
				<div id="spdv_10806" class="pdv_top"
					style="overflow: hidden; width: 100%; height: 100%">
					<div class="pdv_border"
						style="margin: 0px; padding: 0px; height: 97px; border: 0px solid;">
						<div
							style="height: 25px; margin: 1px; display: none; background:;">
							<div
								style="float: left; margin-left: 12px; line-height: 25px; font-weight: bold; color:">

							</div>
							<div style="float: right; margin-right: 10px; display: none">
								<a href="http://www.qiyezhengzhan.com/demo/4232/-1"
									style="line-height: 25px; color:">更多</a>
							</div>
						</div>
						<div style="padding: 0px">


							<img src="./files/images/<s:property value="%{logo}"/> "
								border="0">
						</div>
					</div>

				</div>
			</div>

			<!-- 二级导航菜单 -->

			<div id="pdv_11930" class="pdv_class"
				style="width: 688px; height: 42px; top: 70px; left: 314px; z-index: 12">
				<div id="spdv_11930" class="pdv_top"
					style="overflow: hidden; width: 100%; height: 100%">
					<div class="pdv_border"
						style="margin: 0px; padding: 0px; height: 42px; border: 0px solid;">
						<div
							style="height: 25px; margin: 1px; display: none; background:;">
							<div
								style="float: left; margin-left: 12px; line-height: 25px; font-weight: bold; color:">
								导航菜单</div>
							<div style="float: right; margin-right: 10px; display: none">
								<a href="http://www.qiyezhengzhan.com/demo/4232/-1"
									style="line-height: 25px; color:">更多</a>
							</div>
						</div>
						<div style="padding: 0px">


							<div id="channelmenu">
								<div class="menuleft"></div>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="webAction_index.action?typeId=%{typeId}"
									style="text-decoration:none;color:white;font-weight:bold;"
									target="_self">网站首页</s:a>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="webAction_index_jt.action" target="_self"
									style="text-decoration:none;color:white;font-weight:bold;">思齐集团</s:a>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="webAction_companyCP.action?typeId=%{typeId}"
									target="_self"
									style="text-decoration:none;color:white;font-weight:bold;">公司简介</s:a>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a
									action="webAction_findAllNewsByType.action?typeId=%{typeId}&page=1"
									target="_self"
									style="text-decoration:none;color:white;font-weight:bold;">新闻中心</s:a>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a
									action="webAction_getBusinessBytype.action?typeId=%{typeId}&page=1"
									target="_self"
									style="text-decoration:none;color:white;font-weight:bold;">业务资源</s:a>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:a action="webAction_findUs.action?typeId=%{typeId}&page=1"
									target="_self"
									style="text-decoration:none;color:white;font-weight:bold;">联系我们</s:a>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
		<div id="content"
			style="width: 1002px; height: 679px; background-image: none; background-attachment: scroll; background-color: transparent; margin: 0px auto; background-position: 0% 0%; background-repeat: repeat repeat;">