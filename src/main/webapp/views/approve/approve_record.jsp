<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<table style="margin-top: 40px">
    <tr>
        <th colspan="6">审核记录</th>
    </tr>
    <tr>
        <td>审核人</td>
        <td>上报人</td>
        <td>填表人</td>
        <td>审核状态</td>
        <td>审核意见</td>
        <td>创建时间</td>
    </tr>
    <c:forEach items="${approves}" var="approve">
        <tr>
            <td>${approve.approverName}</td>
            <td>${approve.committerName}</td>
            <td>${approve.applicantName}</td>
            <c:if test="${approve.status == '1'}">
                <td>待单位负责人审核</td>
            </c:if>
            <c:if test="${approve.status == '2'}">
                <td>单位负责人通过</td>
            </c:if>
            <c:if test="${approve.status == '3'}">
                <td>单位负责人驳回</td>
            </c:if>
            <c:if test="${approve.status == '4'}">
                <td>待纪委审核</td>
            </c:if>
            <c:if test="${approve.status == '5'}">
                <td>纪委通过</td>
            </c:if>
            <c:if test="${approve.status == '6'}">
                <td>纪委驳回</td>
            </c:if>
            <td>${approve.comments}</td>
            <td><fmt:formatDate value="${approve.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
</table>
