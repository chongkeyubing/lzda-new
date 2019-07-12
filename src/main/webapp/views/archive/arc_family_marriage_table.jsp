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
							<th colspan="7">子女与港澳以及台湾居民通婚的情况</th>
						</tr>
						<tr>
							<td rowspan="2">子女姓名</td>
							<td rowspan="2">称谓</td>
							<td colspan="5">子女的配偶基本情况</td>
						</tr>
						<tr>
							<td>配偶姓名</td>
							<td>配偶地区</td>
							<td>工作（学习）单位</td>
							<td>配偶职务</td>
							<td>登记时间</td>
						</tr>
						<tr>
							<td>${archive.familyName}</td>
							<td>${archive.familyAppellation}</td>
							<td>${archive.partnerName}</td>
							<td>${archive.partnerArea}</td>
							<td>${archive.partnerOrg}</td>
							<td>${archive.partnerJob}</td>
							<td>${archive.time}</td>
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
