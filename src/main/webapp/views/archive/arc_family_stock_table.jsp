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
                    <th colspan="5">本人、配偶、共同生活的子女投资或者以其他方式持有股票的情况</th>
                </tr>
                <tr>
                    <td>持有人姓名</td>
                    <td>称 谓</td>
                    <td>股票名称或代码</td>
                    <td>持股数量</td>
                    <td>填报前一交易日市值（万元）</td>
                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.stockName}</td>
                    <td>${archive.stockNumber}</td>
                    <td>${archive.price}</td>
                </tr>

                <%--<tr>--%>
                    <%--<td colspan="3">填报前一交易日所有股票的总市值</td>--%>
                    <%--<td><i></i>万元</td>--%>
                <%--</tr>--%>
                <tr>
                    <td>备注</td>
                    <td colspan="4">${archive.remark}</td>
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
