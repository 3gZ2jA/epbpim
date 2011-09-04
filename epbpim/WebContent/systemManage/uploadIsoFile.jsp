<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务文件上传</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<script language="javascript" type="text/javascript"
	src="../js/common.js"></script>
<link href="../images/logo.ico" rel="SHORTCUT ICON" />
</head>
<body>
<div id="main"><jsp:include page="../main/mainHeader.jsp" />
<div class="content">
<div class="content_resize">
<div class="mainbar">
<h3 class="title">业务文件上传</h3>
<div id="">
	<s:form action="addIsoFile.do" enctype="multipart/form-data" method="post">
		<input type="hidden" name="adminFile.fileModule" id="adminFile.fileModule" value="2">
		<ul class="fullScreenUl">
			<li class="width300Li">
				<s:file name="uploadFile" id="uploadFile" size="40" onchange="chooseFile()" />
				<input type="hidden" name="adminFile.fileName" id="adminFile.fileName">
			</li>
		</ul>	
		<ul class="fullScreenUl">	
			<li class="width200Li">
				<input type="submit" class="button" style="width: 70px;" value="上传" onclick="return checkParam();">
			</li>
		</ul>
	</s:form>
</div>
</div>
<!-- end #content -->
<div class="clr"></div>
</div>
</div>
<!-- end #page --> 
<jsp:include page="../common/footer.jsp" />
</div>

</body>
<script type='text/javascript' src='../dwr/engine.js'></script>
<script type='text/javascript' src='../dwr/util.js'></script>
<script type='text/javascript' src='../dwr/interface/MessageService.js'></script>
<script type="text/javascript">
function chooseFile()
{
	var uploadFile = $('uploadFile');
	var filePath=uploadFile.value;
    var fileName=filePath.substring(filePath.lastIndexOf('\\')+1,filePath.length);
    document.getElementById('adminFile.fileName').value=fileName;
}

function checkParam()
{
	if(!document.getElementById('adminFile.fileName').value)
    {
		alert("请选择文件！");
		return false;
    }
}
</script>
</html>