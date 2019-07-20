<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<link rel="stylesheet" type="text/css" href="static/css/imgUp.css"/>
<link rel="stylesheet" type="text/css" href="static/css/demos.css"/>
<link rel="stylesheet" type="text/css" href="static/css/jquery-weui.css"/>
<link rel="stylesheet" type="text/css" href="static/css/weui.min.css"/>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th colspan="10">一般干部收受礼品（金）上缴情况登记表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>${punish.userName}</td>
                    <td>单 位</td>
                    <td colspan="2">${punish.organization}</td>
                    <td>职 务</td>
                    <td>${punish.jobPosition}</td>
                    <td>上缴时间</td>
                    <td colspan="2">${punish.time}</td>
                </tr>
                <tr>
                    <td>上缴礼品名称</td>
                    <td>数 量</td>
                    <td>礼品折价（元）</td>
                    <td>上缴礼金（元）</td>
                    <td>合计（元）</td>
                    <td>送礼人<br/>姓 名</td>
                    <td>送礼人单位</td>
                    <td>送礼人职务</td>
                    <td>送礼时间</td>
                    <td>送礼地点</td>
                </tr>
                <tr>
                    <td>${punish.giftName}</td>
                    <td>${punish.amount}</td>
                    <td>${punish.price}</td>
                    <td>${punish.money}</td>
                    <td>${punish.total}</td>
                    <td>${punish.giftPersonName}</td>
                    <td>${punish.giftPersonOrg}</td>
                    <td>${punish.giftPersonJob}</td>
                    <td>${punish.giftTime}</td>
                    <td>${punish.giftAddress}</td>
                </tr>
                <tr>
                    <td colspan="2">接受登记部门</td>
                    <td colspan="3">${punish.registOrg}</td>
                    <%--<td colspan="2">经手人</td>--%>
                    <%--<td>${punish.userName}</td>--%>
                    <td colspan="2">负责人</td>
                    <td colspan="3">${punish.chargePerson}</td>
                </tr>
                <tr>
                    <td>礼品（金）<br/>处理情况</td>
                    <td colspan="9">${punish.handleInfo}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="9">${punish.remark}</td>
                </tr>
                <c:if test="${not empty attachments}">
                    <tr class="imgDisplay">
                        <td>附件</td>
                        <td colspan="9">
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