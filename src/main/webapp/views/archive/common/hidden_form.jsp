<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<input type="hidden" name="userId" value="${currentUser.id}">
<input type="hidden" name="userName" value="${currentUser.realname}">
<input type="hidden" name="jobPosition" value="${currentUser.jobPosition}">
<input type="hidden" name="archiveType" value="${archiveType}">
<input type="hidden" name="organizationId" value="${currentUser.organizationId}">
<input type="hidden" name="organization" value="${currentUser.organizationName}">
