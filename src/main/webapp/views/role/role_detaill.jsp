<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>		
	
<!--查看权限弹出框-->
<div id="authorityShow_popup" style="display: none;">
	<div class="authority_details">
		<div>
			角色名<input type="text" class="aude_roleName_show" />
		</div>
		<div class="authority_table">
			<p>权限列表</p>
		</div>
		
		<table class="layui-table" lay-data="{url:'', id:'test'}" lay-filter="test">
		  <thead>
		    <tr>
		      <th lay-data="{field:'id',width:145}">ID</th>
		      <th lay-data="{field:'authority',width:250}">权限名</th>
		    </tr>
		  </thead>
		  <tbody>
			<tr>
				<td lay-data="{field:'userid'}">1</td>
				<td lay-data="{field:'username'}">增加</td>
			</tr>
			<tr>
				<td lay-data="{field:'userid'}">2</td>
				<td lay-data="{field:'username'}">删除</td>
			</tr>
			<tr>
				<td lay-data="{field:'userid'}">3</td>
				<td lay-data="{field:'username'}">查询</td>
			</tr>
		</tbody>
		</table>
		
	</div>
	
</div>
			
		