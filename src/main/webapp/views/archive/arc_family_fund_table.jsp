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
                    <th colspan="5">本人、配偶、共同生活的子女投资或者以其他方式持有基金的情况</th>
                </tr>
                <tr>
                    <td>持有人姓名</td>
                    <td>称 谓</td>
                    <td>基金名称或代码</td>
                    <td>基金份额</td>
                    <td>填报前一交易日净值（万元）</td>

                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.fundName}</td>
                    <td>${archive.fundNumber}</td>
                    <td>${archive.price}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="4">${archive.remark}</td>
                </tr>
                <%--<tr>--%>
                    <%--<td colspan="3">填报前一交易日所有基金的总市值</td>--%>
                    <%--<td><i></i>万元</td>--%>
                <%--</tr>--%>
                <c:if test="${approveOperate}">
                    <%@ include file="../approve/approve_operate.jsp" %>
                </c:if>

                <c:if test="${approveRecord}">
                    <%@ include file="../approve/approve_record.jsp" %>
                </c:if>
            </table>
        </div>
    </div>
</div>
