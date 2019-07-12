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
                    <th colspan="5">一般干部收入情况登记表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td colspan="1">${archive.userName}</td>
                    <td>单位及职务</td>
                    <td colspan="2">${archive.organization}&nbsp;${archive.jobPosition}</td>
                </tr>
                <tr>
                    <td colspan="2">收 入 合 计（元）</td>
                    <td colspan="3">${archive.total}</td>
                </tr>
                <tr>
                    <td colspan="2">申报上年度工资收入（元）</td>
                    <td colspan="3">${archive.lastYear}</td>
                </tr>
                <tr>
                    <td colspan="2">各类奖金、津贴、补贴及福利费等（元）</td>
                    <td colspan="3">${archive.award}</td>
                </tr>
                <tr>
                    <td colspan="2">从事咨询、讲学、写作、审稿、<br/>书画等劳务所得（元）</td>
                    <td colspan="3">${archive.labour}</td>
                </tr>
                <tr>
                    <td colspan="2">从事股票、基金、理财产品收益所得（元）</td>
                    <td colspan="3">${archive.stock}</td>
                </tr>
                <tr>
                    <td colspan="2">其 它(元)</td>
                    <td colspan="3">${archive.other}</td>
                </tr>
                <tr>
                    <td colspan="2">个人说明</td>
                    <td colspan="3">${archive.personalInfo}</td>
                </tr>
                <tr>
                    <td colspan="2">备注</td>
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
