<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="static/css/imgUp.css"/>
<link rel="stylesheet" type="text/css" href="static/css/demos.css"/>
<link rel="stylesheet" type="text/css" href="static/css/jquery-weui.css"/>
<link rel="stylesheet" type="text/css" href="static/css/weui.min.css"/>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th colspan="6">一般干部表彰情况登记表</th>
                </tr>
                <tr>
                    <td>被表彰人<br/>姓 名</td>
                    <td>${reward.userName}</td>
                    <td>单 位</td>
                    <td>${reward.organization}</td>
                    <td>职 务</td>
                    <td>${reward.jobPosition}</td>
                </tr>
                <tr>
                    <td>表彰类型</td>
                    <td colspan="3">${reward.rewardType}</td>
                    <td>表彰时间</td>
                    <td>${reward.rewardTime}</td>
                </tr>
                <tr>
                    <td>表<br/>彰<br/>单<br/>位</td>
                    <td colspan="5">${reward.rewardOrganization}</td>
                </tr>
                <tr>
                    <td>问<br/>责<br/>内<br/>容</td>
                    <td colspan="5">${reward.content}</td>
                </tr>
                <tr>
                    <td>备 注</td>
                    <td colspan="5">${reward.remark}</td>
                </tr>
                <c:if test="${not empty attachments}">

                    <tr class="imgDisplay">
                        <td colspan="6">
                            <ul>
                                <c:forEach items="${attachments}" var="attachment" varStatus="statu">
                                    <li>

                                        <a href="${attachment.url}" target="_blank">
                                                <%--<img src="${attachment.url}" onclick="list(${statu.index})"/>--%>
                                            <img src="${attachment.url}"/>
                                        </a>

                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:if>
            </table>
        </div>
    </div>
</div>
<%@ include file = "../common/back.jsp" %>
<script src="static/js/imgUp1.js"></script>
<script src="static/js/initDom.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/swiper.js"></script>

<script>

    function list(index) {
        var pb1 = $.photoBrowser({
            items: [
                <c:forEach items="${attachments}" var="attachment" varStatus="statu">
                "${attachment.url}",
                </c:forEach>
            ],
            initIndex: index
        });
        pb1.open();
    }
</script>

