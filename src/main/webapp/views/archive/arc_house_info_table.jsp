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
                    <th colspan="7">一般干部住房情况登记表</th>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>${archive.userName}</td>
                    <td>单位及职务</td>
                    <td colspan="4">${archive.organization}&nbsp;${archive.jobPosition}</td>
                </tr>
                <tr>
                    <td colspan="3">房 屋 地 址</td>
                    <td>房屋性质</td>
                    <td>产 权人</td>
                    <td>建筑面积（㎡）</td>
                    <td>购（租）时 间</td>
                </tr>
                <tr>
                    <td colspan="3">${archive.address}</td>
                    <td>${archive.type}</td>
                    <td>${archive.owner}</td>
                    <td>${archive.area}</td>
                    <td>${archive.time}</td>
                </tr>

                <tr>
                    <td>有无<br/>公款<br/>装修<br/>情况</td>
                    <td colspan="6">${archive.publicFunds}</td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="6">${archive.remark}</td>
                </tr>

            </table>
            <c:if test="${approveOperate}">
                <%@ include file="../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file="../approve/approve_record.jsp" %>
            </c:if>
            <%--<p class="remark">注：房屋性质是指福利房、商品房、自建房，集资建房等。</p>--%>
        </div>
    </div>
</div>
