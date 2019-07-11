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
                    <th colspan="5">持有护照情况登记表</th>
                </tr>
                <tr>
                    <td>护照号</td>
                    <td>签发日期</td>
                    <td>有效期</td>
                    <td>保管单位</td>
                    <td>备注</td>
                </tr>
                <tr>
                    <td>${archive.passportNumber}</td>
                    <td>${archive.grantDate}</td>
                    <td>${archive.expiryDate}</td>
                    <td>${archive.storekeeper}</td>
                    <td>${archive.remark}</td>
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
