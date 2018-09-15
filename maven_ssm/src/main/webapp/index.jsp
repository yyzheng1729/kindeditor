<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/kindeditor-all.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="${pageContext.request.contextPath}/static/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
</head>
<body>
<form method="post" action="upload" name="myform" enctype="multipart/form-data">
	<textarea type="text" name="uploadImage" style="height:600px;width:80%;" value=""></textarea>
	<button type="submit">提交</button>	
</form>

<script>
	//加载KindEditor插件
	KindEditor.ready(function(K) {
		var KE = K.create('textarea[name="uploadImage"]', {
			cssPath : 'static/kindeditor/plugins/code/prettify.css',
			filePostName  : "file",/* ImageController MultipartFile file*/
			uploadJson : 'kindEditorUpload',
			allowFileManager : false,
			allowImageUpload: true, //上传图片框本地上传的功能，false为隐藏，默认为true
			allowImageRemote : false, //上传图片框网络图片的功能，false为隐藏，默认为true
			formatUploadUrl:false,
			resizeType: 0,
			afterCreate : function() {
				var self = this;
				this.sync();
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['myform'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['myform'].submit();
				});
			},
			afterBlur:function() { this.sync(); }, 	//失去焦点后，将内容写入textarea中
			afterUpload:function(url,data,name){
				if( name=="image" || name == "multiimagez"){
					var img = new Image();
					img.src = url;
					img.onload = function(){
						if( img.width > 600 ){
							KE.html(KE.html().replace('<img src="' + url + '"','<img src="' + url + '" width="600"'));
						}else if( img.width == img.height ){
							KE.html(KE.html().replace('<img src="' + url + '"','<img src="' + url + '" width="200"'));
						}
					}
				} 
			}
		});
		prettyPrint();
	});
</script>
</body>
</html>