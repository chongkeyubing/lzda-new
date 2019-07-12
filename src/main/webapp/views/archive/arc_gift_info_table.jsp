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
                    <th colspan="6">收受礼品（金）上缴情况登记表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>${archive.userName}</td>
                    <td>单 位</td>
                    <td>${archive.organization}</td>
                    <td>职 务</td>
                    <td>${archive.jobPosition}</td>
                </tr>
                <tr>
                    <td>送礼人<br/>姓 名</td>
                    <td>单 位</td>
                    <td>职 务</td>
                    <td>送礼时间</td>
                    <td>送礼地点</td>
                    <td>方式</td>
                </tr>
                <tr>
                    <td>${archive.giftPersonName}</td>
                    <td>${archive.giftOrg}</td>
                    <td>${archive.giftJob}</td>
                    <td>${archive.giftTime}</td>
                    <td>${archive.giftAddress}</td>
                    <td>${archive.giftWay}</td>
                </tr>
                <tr>
                    <td>送礼事由</td>
                    <td colspan="5">${archive.giftReason}</td>
                </tr>
                <tr>
                    <td>礼品名称</td>
                    <td colspan="2">${archive.giftName}</td>
                    <td colspan="3">处理情况</td>

                </tr>
                <tr>
                    <td>数 量</td>
                    <td colspan="2">${archive.giftNumber}</td>
                    <td>退还当事人</td>
                    <td colspan="2">
                        <c:if test="${archive.giftHandle == '退还当事人'}">
                            <i class="layui-icon layui-icon-ok" style="font-size: 32px;"></i>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>礼品折价（元）</td>
                    <td colspan="2">${archive.giftPrice}</td>
                    <td>上缴分局</td>
                    <td colspan="2">
                        <c:if test="${archive.giftHandle == '上缴分局'}">
                            <i class="layui-icon layui-icon-ok" style="font-size: 32px;"></i>
                        </c:if>
                    </td>

                </tr>
                <tr>
                    <td>礼金（元）</td>
                    <td colspan="2">${archive.giftMoney}</td>
                    <td>上缴单位</td>
                    <td colspan="2">
                        <c:if test="${archive.giftHandle == '上缴单位'}">
                            <i class="layui-icon layui-icon-ok" style="font-size: 32px;"></i>
                        </c:if>
                    </td>

                </tr>
                <tr>
                    <td>合计（元）</td>
                    <td colspan="2">${archive.giftTotal}</td>
                    <td>其他</td>
                    <td colspan="2">
                        <c:if test="${archive.giftHandle == '其他'}">
                            <i class="layui-icon layui-icon-ok" style="font-size: 32px;"></i>
                        </c:if>
                    </td>

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
