<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


    <title>查询统计</title>

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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 查询统计
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
            <img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" /> 查询统计 </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">

                    <tr>
                        <td>
                            <a href="/customerAction/countCustomer.action">
                                <button cssClass="InputStyle">读者统计</button>
                            </a>
                        </td>
                        <td>
                            <a href="/borrowAction/queryExpireBorrow.action">
                                <button cssClass="InputStyle">查询逾期未还书刊</button>
                            </a>
                        </td>

                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="/paymentAction/countAllPayments.action">
                                <button cssClass="InputStyle" >财务统计</button>
                            </a>
                        </td>

                        <td>
                            <a href="/borrowAction/queryDidNotReturnBorrow.action?days=3">
                                <button cssClass="InputStyle" >查询3天内应还书刊</button>
                            </a>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <a href="/borrowAction/queryBookRanking.action">
                                <button cssClass="InputStyle">书刊借阅排行</button>
                            </a>
                        </td>
                        <td>
                            <a href="/borrowAction/queryCustomerRanking.action">
                                <button cssClass="InputStyle">读者借阅排行</button>
                            </a>
                        </td>

                    </tr>
                    <%--<tr>--%>
                        <%--<td>--%>
                            <%--<a href="/borrowAction/queryBorrow.action">--%>
                                <%--<button cssClass="InputStyle" >查询3天内应还书刊</button>--%>
                            <%--</a>--%>
                        <%--</td>--%>
                        <%--<td>--%>
                            <%--<a href="/borrowAction/queryExpireBorrow.action">--%>
                                <%--<button cssClass="InputStyle">查询逾期未还书刊</button>--%>
                            <%--</a>--%>
                        <%--</td>--%>

                    <%--</tr>--%>

                </table>
            </div>
        </div>



        <%--<!-- 表单操作 -->--%>
        <div id="InputDetailBar">
        </div>
</div>

</body>
</html>
