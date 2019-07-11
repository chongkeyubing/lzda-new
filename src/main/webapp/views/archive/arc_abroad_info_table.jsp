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
                    <th colspan="4">一般干部出国（境）情况登记表</th>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>${archive.userName}</td>
                    <td>单位及职务</td>
                    <td>${archive.organization}&nbsp;${archive.jobPosition}</td>
                </tr>
                <tr>
                    <td>开始时间</td>
                    <td>${archive.beginTime}</td>
                    <td>结束时间</td>
                    <td>${archive.endTime}</td>
                </tr>
                <tr>
                    <td>目的地</td>
                    <td colspan="3">${archive.destination}</td>
                </tr>
                <tr>
                    <td>批准单位</td>
                    <td colspan="3">${archive.approveOrganization}</td>
                </tr>
                <tr>
                    <td>资金来源</td>
                    <td colspan="3">${archive.fundSource}</td>
                </tr>
                <tr>
                    <td>出国<br/>（境）<br/>事由</td>
                    <td colspan="3">${archive.goabroadReason}</td>
                </tr>
                <tr>
                    <td>出国<br/>（境）<br/>情况<br/>报告</td>
                    <td colspan="3">${archive.report}</td>
                </tr>

            </table>
            <p class="remark">注：此表应在一般干部出国（境）归来后一周内填写上报。</p>
            <c:if test="${approveOperate}">
                <%@ include file = "../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file = "../approve/approve_record.jsp" %>
            </c:if>
        </div>
    </div>
</div>
