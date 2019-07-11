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
							<th colspan="4">一般干部参加单位组织生活会情况登记表</th>
						</tr>
						<tr>
							<td>姓   名</td>
							<td colspan="3">
								${archive.userName}
							</td>
						</tr>
						<tr>
							<td>职   务</td>
							<td>${archive.jobPosition}</td>
							<td>单    位</td>		
							<td>${archive.organization}</td>
						</tr>
						<tr>
							<td>会议议题</td>
							<td>${archive.meetingSubject}</td>
							<td>参加组织生活会时间</td>		
							<td>${archive.meetingTime}</td>
						</tr>
						<tr>
							<td>查<br/>找<br/>问<br/>题</td>
							<td colspan="3">${archive.problem}</td>
						</tr>
						<tr>
							<td>整<br/>改<br/>措<br/>施</td>
							<td colspan="3">${archive.rectify}</td>
						</tr>
						<%--<tr>--%>
							<%--<td>单 位<br/>党组织<br/>意 见</td>--%>
							<%--<td colspan="3"></td>--%>
						<%--</tr>--%>
						<tr>
							<td>备注</td>
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
