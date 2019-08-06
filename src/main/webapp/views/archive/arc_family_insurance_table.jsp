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
                    <th colspan="6">本人、配偶、共同生活的子女投资或者以其他方式持有投资型保险的情况</th>
                </tr>
                <tr>
                    <td>投保人姓名</td>
                    <td>称 谓</td>
                    <td>保险产品全称</td>
                    <td>保单号</td>
                    <td>保险公司名称</td>
                    <td>累积缴纳保费、投资资金（万元）</td>

                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.insuranceName}</td>
                    <td>${archive.insuranceNumber}</td>
                    <td>${archive.companyName}</td>
                    <td>${archive.price}</td>
                </tr>

                <%--<tr>--%>
                <%--<td colspan="4">累计缴纳保费、投资金总额</td>--%>
                <%--<td><i></i>万元</td>--%>
                <%--</tr>--%>

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
<%@ include file="./common/back.jsp" %>