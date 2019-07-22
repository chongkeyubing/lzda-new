<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>		
	
<div id="addRole_popup">
	<div class="layui-form addRole_form">
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">角色</label>
		      <div class="layui-input-inline">
		        <input type="text" name="add_roleName" lay-verify="required" autocomplete="off" class="layui-input" id="add_roleName">
		      </div>
		    </div>
		 </div>
		 
		 <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" lay-filter="roleAdd" lay-submit id = "addRole">新增</button>
		      <button type="reset" class="layui-btn layui-btn-primary" id="roleReset">重置</button>
		    </div>
		  </div>
	</div>
</div>
	
<script>
layui.use(['element','table','layer','form'], function() {
	var element = layui.element;
	var table = layui.table;
	var layer = layui.layer;
	var form = layui.form;

	form.on('submit(roleAdd)',function(data){
		var role = { 
			roleName:$("#addRole_popup #add_roleName").val(),
			roleflag:$("#addRole_popup #add_roleflag").val()
		};
		console.log(role);
		$.post('<%=basePath %>/role/roleInsert.method',role,function(data){
			data = JSON.parse(data);
			if(data.success){
				layer.msg("添加成功");
				//表格重载
				table.reload('roleTable',{
		   			url:'<%=basePath%>/role/roleSelectForPage.method'
		   		});
				//关闭弹出窗
				layer.close(addRoleLayerIndex);
			}else{
				layer.msg("添加失败");
			}
		});
	});
	
	$("#addRole_popup #roleReset").click(function(){
		$("#add_roleName").val('');
	})
	
});	
</script>
		