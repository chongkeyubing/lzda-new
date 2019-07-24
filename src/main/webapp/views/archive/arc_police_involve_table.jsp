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
                    <th colspan="4">民警涉警情况登记表</th>
                </tr>
                <tr>
                    <td>时间</td>
                    <td>${archive.time}</td>
                    <td>民警姓名</td>
                    <td>${archive.userName}</td>
                </tr>
                <tr>
                    <td>单位</td>
                    <td>${archive.organization}</td>
                    <td>与民警关系</td>
                    <td>${archive.relationship}</td>
                </tr>
                <tr>
                    <td>涉警人姓名</td>
                    <td>${archive.involvedName}</td>
                    <td>涉警人单位</td>
                    <td>${archive.involvedOrganization}</td>
                </tr>
                <tr>
                    <td>涉警内容</td>
                    <td colspan="3">${archive.content}</td>
                </tr>
                <tr>
                    <td>处理情况</td>
                    <td colspan="3">${archive.result}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="3">${archive.remark}</td>
                </tr>

            </table>
            <c:if test="${approveOperate}">
                <%@ include file = "../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file = "../approve/approve_record.jsp" %>
            </c:if>
        </div>
    </div>
</div>
<%@ include file = "../common/back.jsp" %>