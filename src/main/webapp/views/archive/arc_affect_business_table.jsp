<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th colspan="4">民警可能影响公正执行职务情况登记表</th>
                </tr>
                <tr>
                    <td>时 间</td>
                    <td>${archive.time}</td>
                    <td>姓 名</td>
                    <td>${archive.userName}</td>
                </tr>
                <tr>
                    <td>单 位</td>
                    <td>${archive.organization}</td>
                    <td>与民警关系</td>
                    <td>${archive.relationship}</td>
                </tr>
                <tr>
                    <td>可能影响<br/>公正执行<br/>职务内容</td>
                    <td colspan="3">${archive.content}</td>
                </tr>
                <tr>
                    <td>处理情况</td>
                    <td colspan="3">${archive.handleInfo}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="3">${archive.remark}</td>
                </tr>
            </table>
            <c:if test="${approveOperate}">
                <%@ include file="../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file="../approve/approve_record.jsp" %>
            </c:if>
        </div>
    </div>
</div>
