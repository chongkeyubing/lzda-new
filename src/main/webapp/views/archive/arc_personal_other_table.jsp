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
                    <th>个人认为需要报告的其他事项</th>
                </tr>
                <tr>
                    <td>
                        <div class="message">
                            <span>  ${archive.otherInfo}</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>本 人 承 诺</td>
                </tr>
                <tr>
                    <td style="text-align: left;text-indent: 2em;">
                        ${archive.promise}
                    </td>
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