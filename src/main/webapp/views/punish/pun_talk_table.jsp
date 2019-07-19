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
                    <th colspan="6">一般干部廉政谈话情况登记表</th>
                </tr>
                <tr>
                    <td>被谈话人<br/>姓 名</td>
                    <td>${punish.userName}</td>
                    <td>单 位</td>
                    <td>${punish.organization}</td>
                    <td>职 务</td>
                    <td>${punish.jobPosition}</td>
                </tr>
                <tr>
                    <td>谈话类型</td>
                    <td>${punish.type}</td>
                    <td>谈话地点</td>
                    <td>${punish.address}</td>
                    <td>谈话时间</td>
                    <td>${punish.time}</td>
                </tr>
                <tr>
                    <td>谈话人<br/>姓 名</td>
                    <td>${punish.talkPersonName}</td>
                    <td>谈话人单位</td>
                    <td>${punish.talkPersonOrg}</td>
                    <td>谈话人职务</td>
                    <td>${punish.talkPersonJob}</td>
                </tr>
                <tr>
                    <td>谈<br/>话<br/>内<br/>容</td>
                    <td colspan="5">${punish.content}</td>
                </tr>
                <tr>
                    <td>被<br/>谈<br/>话<br/>人<br/>意<br/>见</td>
                    <td colspan="5">${punish.talkedPersonAdvice}</td>
                </tr>

                <tr>
                    <td>备注</td>
                    <td colspan="5">${punish.remark}</td>
                </tr>
                <c:if test="${not empty attachments}">
                    <tr class="imgDisplay">
                        <td>附件</td>
                        <td colspan="5">
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
<script src="static/js/imgUp1.js"></script>
<script src="static/js/initDom.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/swiper.js"></script>
		
		
