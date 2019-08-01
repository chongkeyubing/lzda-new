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
                <tr>单位：${report.organizationName}</tr>
                <tr>
                    <th colspan="5">${report.year}年${report.quarter}主体责任季度工单任务落实情况反馈表</th>
                </tr>
                <tr>
                    <td>工单类别</td>
                    <td>任务序号</td>
                    <td>是否完成</td>
                    <td colspan="2">具体落实情况</td>
                </tr>

                <c:if test="${not empty tasks1}">
                    <c:forEach items="${tasks1}" var="task1" varStatus="status">
                        <tr>
                            <c:if test="${status.first}">
                                <td rowspan="${tasks1.size()}">主体责任<br/>季度工单</td>
                            </c:if>
                            <td>${task1.taskOrder}</td>
                            <td>${task1.complete}</td>
                            <td colspan="2">${task1.completeInfo}</td>
                        </tr>
                    </c:forEach>
                </c:if>

                <c:if test="${not empty tasks2}">
                    <c:forEach items="${tasks2}" var="task2" varStatus="status">
                        <tr>
                            <c:if test="${status.first}">
                                <td rowspan="${tasks2.size()}">“第一责任人”责任<br/>季度工单</td>
                            </c:if>
                            <td>${task2.taskOrder}</td>
                            <td>${task2.complete}</td>
                            <td colspan="2">${task2.completeInfo}</td>
                        </tr>
                    </c:forEach>
                </c:if>

                <c:if test="${not empty attachments}">
                    <tr class="imgDisplay">
                        <td>附件</td>
                        <td colspan="4">
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
            <p class="remark">注：1、“任务序号”指本季度工单对应任务，对照任务序号逐一填写任务落实情况；</p>
            <p class="remark" style="text-indent: 4em;">2、填写内容要求实事求是，简要描述工作完成情况；</p>
            <p class="remark" style="text-indent: 4em;">3、本表请于每季度末月25前填报</p>
        </div>
    </div>
</div>

<%@ include file="../common/back.jsp" %>
<script src="static/js/imgUp1.js"></script>
<script src="static/js/initDom.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/swiper.js"></script>
