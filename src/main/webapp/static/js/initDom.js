String.prototype.getDom = function() {	//为JS的String方法添加getDom方法
 if(arguments.length == 0){
 	return 0;	//判断迭代参数是否为空
 }
 	var param = arguments[0];//获取传递参数
 	var s = this;	//获取当前填充字符串	RegExp All*
 if(typeof(param) == 'object') {//如果传入参数为Object的Json类型
  for(var key in param)//
   s = s.replace(new RegExp("\\{" + key + "\\}", "g"), param[key]);
  return s;
 } else {
  for(var i = 0; i < arguments.length; i++)
   s = s.replace(new RegExp("\\{" + i + "\\}", "g"), arguments[i]);
  return s;
 }
}