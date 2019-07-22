<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />--%>
		<style type="text/css">
			.layui-textarea.txtArea {
				width: 878px;
				height: 120px;
			}
			.layui-input-block.area{margin-left: 130px;}
			.layui-input-block.reset{margin-left: 0;text-align: center;}
			form.form1{margin-top: 15px;}
			.layui-upload{text-align: center;}
		</style>
	<%--</head>--%>

	<%--<body style="display: flex; justify-content: center;">--%>
		<form class="layui-form form1" action="/rptresponsibilityperform/add">

			<input type="hidden" name="committerName" value="${currentUser.realname}">
			<input type="hidden" name="committerId" value="${currentUser.id}">
			<input type="hidden" name="organizationId" value="${currentUser.organizationId}">
			<input type="hidden" name="organizationName" value="${currentUser.organizationName}">

			<BR>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">时间</label>
					<div class="layui-input-inline">
						<input type="text" name="time" id="time" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">地点</label>
					<div class="layui-input-inline">
						<select name="quiz">
							<option value="">请选择</option>
							<option value="">1</option>
							<option value="">2</option>
							<option value="">3</option>
							<option value="">4</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">参加人员</label>
					<div class="layui-input-inline">
						<input type="text" name="" autocomplete="off" class="layui-input">
					</div>
				</div>

			</div>
			<div class="layui-form-item">
				<div class="layui-upload">
					<button type="button" class="layui-btn layui-btn-normal" id="test8">上传附件</button>
					<button type="button" class="layui-btn" id="test9">开始上传</button>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">主题</label>
				<div class="layui-input-block" >
					<input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" style="width: 878px;">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">内容</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" class="layui-textarea txtArea"></textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block reset">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>
					<button type="reset" class="layui-btn">返回</button>
				</div>
			</div>
		</form>
		<%--<script src="layui/layui.js"></script>--%>
		<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;

				//日期
				laydate.render({
					elem: '#time'
				});
				laydate.render({
					elem: '#date1'
				});




				//选完文件后不自动上传
				/*upload.render({
					elem: '#test8'
					,url: '/upload/'
					,auto: false
					,accept:file
					//,multiple: true
					,bindAction: '#test9'
					,done: function(res){
						console.log(res)
					}
				});*/



			});




		</script>
<script>
	layui.use('upload', function() {
		var $ = layui.jquery
				, upload = layui.upload;

		//选完文件后不自动上传
		upload.render({
			elem: '#test8'
			, url: '/upload/'
			, auto: false
			,accept:file,
			 multiple: true
			, bindAction: '#test9'
			, done: function (res) {
				console.log(res)
			}
		});
	});

</script>
