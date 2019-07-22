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
            <table contenteditable="true">
                <tr>单位：${report.organizationName}</tr>
                <tr>
                    <th colspan="4">履 责 纪 实</th>
                </tr>
                <tr>
                    <td>时 间</td>
                    <td>${report.time}</td>
                    <td>地 点</td>
                    <td>${report.address}</td>
                </tr>
                <tr>
                    <td>参加人员</td>
                    <td colspan="3">${report.participants}</td>
                </tr>
                <tr>
                    <td>主 题</td>
                    <td colspan="3">${report.title}</td>
                </tr>
                <tr>
                    <td>内 容</td>
                    <td colspan="3">${report.content}</td>
                </tr>

                <c:if test="${not empty attachments}">
                    <tr class="imgDisplay">
                        <td>附件</td>
                        <td colspan="3">
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

<%@ include file="../common/back.jsp" %>
<script src="static/js/imgUp1.js"></script>
<script src="static/js/initDom.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/swiper.js"></script>