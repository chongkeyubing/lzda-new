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
                    <th colspan="4">一般干部在企业、中介组织和社会团体兼职情况登记表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>${archive.userName}</td>
                    <td>单位及职务</td>
                    <td>${archive.organization}&nbsp;${archive.jobPosition}</td>
                </tr>
                <tr>
                    <td>兼职单位</td>
                    <td>${archive.parttimeOrg}</td>
                    <td>兼职单位性质</td>
                    <td>${archive.parttimeOrgType}</td>
                </tr>
                <tr>
                    <td>兼任职务</td>
                    <td>${archive.parttimeJob}</td>
                    <td>兼职时间</td>
                    <td>${archive.parttimeDuring}</td>
                </tr>
                <tr>
                    <td>兼职取酬情况<br/>(元/年)</td>
                    <td>${archive.parttimeSalary}</td>
                    <td>兼职批准机关</td>
                    <td>${archive.approveOrg}</td>
                </tr>
                <tr>
                    <td>情<br/>况<br/>说<br/>明<br/>以<br/>及</br/>本<br/>人<br/>意<br/>见</td>
                    <td colspan="3">${archive.advice}</td>
                </tr>
                <tr>
                    <td>纠正<br/>处理<br/>情况</td>
                    <td colspan="3">${archive.handle}</td>
                </tr>
                <%--<tr>--%>
                    <%--<td>党组织审核<br/>意 见</td>--%>
                    <%--<td colspan="3">${archive.advice}</td>--%>
                <%--</tr>--%>
                <tr>
                    <td>备注</td>
                    <td colspan="3">${archive.remark}</td>
                </tr>
                <c:if test="${approveOperate}">
                    <%@ include file = "../approve/approve_operate.jsp" %>
                </c:if>

                <c:if test="${approveRecord}">
                    <%@ include file = "../approve/approve_record.jsp" %>
                </c:if>

            </table>
        </div>
    </div>
</div>
