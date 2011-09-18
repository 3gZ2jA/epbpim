<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>电子杂志导入</title>
<script type="text/javascript">
	function checkError() {
		var msg = "<s:property value='msg'/>";
		if (msg) {
			alert(msg);
		}
	}
	function chooseFile()
	{
		var uploadFile = $('uploadFile');
		var filePath=uploadFile.value;
	    var fileName=filePath.substring(filePath.lastIndexOf('\\')+1,filePath.length);
	    document.getElementById('periodicalFile.periodicalName').value=fileName;
	}
	
	function checkParam()
	{
		if(!document.getElementById('periodicalFile.periodicalType').value)
	    {
			alert("请选择类别！");
			return false;
	    }
		if(!document.getElementById('periodicalFile.periodicalName').value)
	    {
			alert("请选择文件！");
			return false;
	    }		
	}
	
</script>
<style>
.WithBreaks {
	word-wrap: break-word;
}
</style>
</head>
<body onload="checkError();">
	<div id="main"><jsp:include page="adminHeader.jsp" />
		<div class="content">
			<div class="content_resize">
				<div class="mainbar">
					<h4 class="title">电子杂志导入:</h4>
					<div class="entry">
						<s:form action="importPeriodicalFile.do" method="post" id="importPeriodicalFileForm" onsubmit="return checkParam();" enctype="multipart/form-data">
							<ul class="fullScreenUl">
								<li class="width300Li"><label class="lb">类别：</label>
								<select id="periodicalFile.periodicalType" name="periodicalFile.periodicalType" class="width150Select">
										<option value="">--请选择--</option>
										<option value="土建">土建</option>
										<option value="市政">市政</option>
								</select>
								</li>
							</ul>
							<ul class="fullScreenUl">	
								<li style="width: 42px">
									<label>文件：</label>
								</li>
								<li style="width: 400px">
									<s:file name="uploadFile" id="uploadFile" size="40" onchange="chooseFile()" />
									<input type="hidden" name="periodicalFile.periodicalName" id="periodicalFile.periodicalName">
								</li>
							</ul>	
							<ul class="fullScreenUl">
								<li class="width200Li"><input type="submit" class="button" value="上传">
								</li>
							</ul>
						</s:form>


					</div>

					<div class="clr"></div>
				</div>
			</div>
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
		<jsp:include page="../common/footer.jsp" /></div>
</body>
</html>