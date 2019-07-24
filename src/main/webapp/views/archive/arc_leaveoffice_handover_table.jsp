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
                    <th colspan="4">一般干部离职交接情况登记表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>${archive.userName}</td>
                    <td>单 位</td>
                    <td>${archive.organization}</td>
                </tr>
                <tr>
                    <td>职 务</td>
                    <td>${archive.jobPosition}</td>
                    <td>任职时间</td>
                    <td>${archive.duringTime}</td>
                </tr>
                <tr>
                    <td>调往单位</td>
                    <td>${archive.toOrganization}</td>
                    <td>职 务</td>
                    <td>${archive.toJobPosition}</td>
                </tr>

                <tr>
                    <td>公文、资料是否<br/>按规定移交</td>
                    <td colspan="3">${archive.documentHandover}</td>
                </tr>
                <tr>
                    <td>办公用具是否<br/>按规定移交</td>
                    <td colspan="3">${archive.officeHandover}</td>
                </tr>
                <tr>
                    <td>生活用具是否<br/>按规定移交</td>
                    <td colspan="3">${archive.lifeHandover}</td>
                </tr>
                <tr>
                    <td>有无单位欠款</td>
                    <td colspan="3">${archive.debt}</td>
                </tr>
                <tr>
                    <td>其他公物按规定<br/>移交情况</td>
                    <td colspan="3">${archive.otherHandover}</td>
                </tr>

                <%--<tr>--%>
                    <%--<td>调离单位主管领导</td>--%>
                    <%--<td colspan="3"></td>--%>
                <%--</tr>--%>

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
<%@ include file = "./common/back.jsp" %>