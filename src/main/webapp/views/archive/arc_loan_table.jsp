<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th colspan="8">淮安市公安机关民警参与借贷、担保及营利性经营活动情况申报表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>${archive.arcLoan.userName}</td>
                    <td>性别</td>
                    <td>${archive.arcLoan.gender}</td>
                    <td>政治面貌</td>
                    <td>${archive.arcLoan.politicFace}</td>
                    <td>职务</td>
                    <td>${archive.arcLoan.jobPosition}</td>
                </tr>
                <tr>
                    <td>所在单位</td>
                    <td colspan="7">${archive.arcLoan.organization}</td>
                </tr>
                <c:if test="${not empty archive.loans}">
                    <tr>
                        <td rowspan="${archive.loans.size() + 1}">借出</td>
                        <td>债务人</td>
                        <td>金额</td>
                        <td>约定期限</td>
                        <td>约定年利率</td>
                        <td>资金来源</td>
                        <td colspan="2">整改纠正情况</td>
                    </tr>
                    <c:forEach var="loan" items="${archive.loans}">
                        <tr>
                            <td>${loan.cbligor}</td>
                            <td>${loan.amount}</td>
                            <td>${loan.timeLimit}</td>
                            <td>${loan.interest}</td>
                            <td>${loan.fundSource}</td>
                            <td colspan="2">${loan.rectifyInfo}</td>
                        </tr>
                    </c:forEach>
                </c:if>

                <c:if test="${not empty archive.borrows}">
                    <tr>
                        <td rowspan="${archive.borrows.size() + 1}">借入</td>
                        <td>债权人</td>
                        <td>金额</td>
                        <td>约定期限</td>
                        <td>约定年利率</td>
                        <td colspan="3">整改纠正情况</td>
                    </tr>

                    <c:forEach var="borrow" items="${archive.borrows}">
                        <tr>
                            <td>${borrow.creditor}</td>
                            <td>${borrow.amount}</td>
                            <td>${borrow.timeLimit}</td>
                            <td>${borrow.interest}</td>
                            <td colspan="3">${borrow.rectifyInfo}</td>
                        </tr>
                    </c:forEach>
                </c:if>


                <c:if test="${not empty archive.assures}">
                    <tr>
                        <td rowspan="${archive.assures.size() + 1}">担保</td>
                        <td>债权人</td>
                        <td>债务人</td>
                        <td>金额</td>
                        <td>约定期限</td>
                        <td>约定年利率</td>
                        <td colspan="2">整改纠正情况</td>
                    </tr>
                    <c:forEach var="assure" items="${archive.assures}">
                        <tr>
                            <td>${assure.creditor}</td>
                            <td>${assure.cbligor}</td>
                            <td>${assure.amount}</td>
                            <td>${assure.timeLimit}</td>
                            <td>${assure.interest}</td>
                            <td colspan="2">${assure.rectifyInfo}</td>
                        </tr>
                    </c:forEach></c:if>

                <c:if test="${not empty archive.activitys}">
                    <tr>
                        <td rowspan="${archive.activitys.size() + 1}">经营活动</td>
                        <td>企业名称</td>
                        <td>类型</td>
                        <td>投入金额</td>
                        <td>资金来源</td>
                        <td>营利情况</td>
                        <td colspan="2">整改纠正情况</td>
                    </tr>
                    <c:forEach var="activity" items="${archive.activitys}">
                        <tr>
                            <td>${activity.enterpriseName}</td>
                            <td>${activity.enterpriseType}</td>
                            <td>${activity.amount}</td>
                            <td>${activity.fundSource}</td>
                            <td>${activity.profit}</td>
                            <td colspan="2">${activity.rectifyInfo}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
            <p class="remark">注：本人正常的房贷、车贷以及未发生借贷、担保、参与营利性经营活动情况的民警不填此表。</p>

            <c:if test="${approveOperate}">
                <%@ include file="../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file="../approve/approve_record.jsp" %>
            </c:if>
        </div>
    </div>

</div>
<%@ include file = "./common/back.jsp" %>