<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>业务文件管理</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet"
	href="../js/My97DatePicker/skin/default/datepicker.css" type="text/css"></link>
<link href="../images/logo.ico" rel="SHORTCUT ICON" />
<script type='text/javascript' src='../js/My97DatePicker/WdatePicker.js'></script>
<script type='text/javascript' src='../dwr/engine.js'></script>
<script type='text/javascript' src='../dwr/util.js'></script>
<script type='text/javascript' src='../dwr/interface/UserInfoService.js'></script>
</head>
<body onload="setValue()">
<div id="main"><jsp:include page="../main/mainHeader.jsp" />
<div class="content">
<div class="content_resize">
<div class="mainbar">
<h3 class="title">业务文件管理</h3>
<div id="searchCondition">
	<s:form id="searchFileForm" action="schBusinessFileList.do" method="post">
		<input type="hidden" name="adminFile.fileModule" id="adminFile.fileModule" value="1">
		<ul class="fullScreenUl">
			<li class="width300Li">
				<table>
					<tr>
						<td><label>文件类别：</label></td>
						<td>
							<div id="moveSpan1" style="position:relative;" >
							<span style="margin-left:147px;width:175px;overflow:hidden;position:relative;" id="devmodelNamespan">
							<select id="devmodelBak" name="mainDevInfo.deviceModelId" style="width:165px;margin-left:-147px;BORDER-LEFT:#9DE4FF 1px solid;BORDER-RIGHT:#9DE4FF 1px solid;FONT-SIZE: 9pt;HEIGHT:21px;"  onchange="fillFileType(this)">
								<option value="">--请选择--</option>
								<option value="董事会文件">董事会文件</option>
								<option value="财税文件">财税文件</option>
								<option value="工商文件">工商文件</option>
				     			<s:iterator id="model" value="#request.mainDevInfo" status="stats">
				         			<option value="${model.deviceModelId }"><s:property value="#model.deviceModelName"/></option>
								</s:iterator>
							</select>
							</span>
							<input id="adminFile.fileType" name="adminFile.fileType" type="text" style="width:142px;position:absolute;left:0px;BORDER-RIGHT:#9DE4FF 1px solid;FONT-SIZE: 9pt;HEIGHT:15px;color: #cdcdcd;" value="<s:property value='adminFile.fileType' />"
									onclick="clearValue(this)" onblur="setValue()" maxlength="50"/>
							</div>
						</td>
					</tr>
				</table>
			</li>
			<li class="width200Li">
				<label>文件名:</label>
				<input type="text" class="" name="adminFile.fileName" id="adminFile.fileName" value="<s:property value='adminFile.fileName' />"/>
			</li>
			<li>
				<input type="button" class="mediumButton" style="float: right" class="button" onclick="searchFileList()" value="查询">
			</li>
		</ul>
	</s:form>
</div>

<s:if test="adminFileList==null || adminFileList.size()==0">
	<tr>
		<td>
		<h3><s:text name="Common.Nodata" /></h3>
		</td>
	</tr>
</s:if>
<s:else>
	<div class="searchResult" id="searchResult">
		<ul class="fullScreenUl">
			<li class="width200Li"><label><s:text name="文件名" /></label></li>
			<li class="width200Li"><label><s:text name="文件类型" /></label></li>
			<li class="width200Li"><label><s:text name="上传时间" /></label></li>
			<li class="width50Li"><label><s:text name="预览" /></label></li>
			<li class="width50Li"><label><s:text name="下载" /></label></li>
			<li class="width50Li"><label><s:text name="删除" /></label></li>
		</ul>
		<s:iterator value="adminFileList" status="st">
			<ul class="fullScreenUl">
				<li class="width200Li"><s:property value="fileName" /></li>
				<li class="width200Li"><s:property value="fileType" /></li>
				<li class="width200Li"><s:date name="uploadDate" format="yyyy-MM-dd hh:mm:ss" /></li>
				<li class="width50Li">
					<form action="schBusinessFile.do" method="post" id='searchfile<s:property value="id" />'>
						<input type="hidden" name="adminFile.id" value='<s:property value="id" />' />
						<input type="button" onclick='searchFile("searchfile"+<s:property value="id" />);' class="mediumRightButton" class="button" value="<s:text name='预览' />">
					</form>
				</li>
				<li class="width50Li">
					<a href="<s:property value='filePath' />"><input type="button" onclick="this.parentNode.click();" class="mediumRightButton" class="button" value="<s:text name='下载' />"></a>
				</li>
				<li class="width50Li">
					<form action="delBusinessFile.do" method="post" id='deletefile<s:property value="id" />'>
						<input type="hidden" name="adminFile.id" value='<s:property value="id" />' />
						<input type="hidden" name="adminFile.fileModule" value="1" />						
						<input type="hidden" name="adminFile.filePath" value='<s:property value="filePath" />' />
						<input type="button" onclick='deleteFile("deletefile"+<s:property value="id" />);' class="mediumRightButton" class="button" value="<s:text name='Common.Delete' />">
					</form>
				</li>
			</ul>
		</s:iterator>
	</div>
</s:else>

<div></div>
</div>
<div class="clr"></div>
</div>
</div>
<!-- end #page --> <jsp:include page="../common/footer.jsp" /></div>
</body>
<script type="text/javascript">
	function searchFileList()
	{
		var obj=document.getElementById("adminFile.fileType");
		if(obj.value=="<s:text name='请输入文件类别'/>")
		{
	       obj.value="";
		}
		document.getElementById("searchFileForm").submit();
	}
	function searchFile(id)
	{
		// document.getElementById(id).submit();
	}
	function deleteFile(id)
	{
		if(confirm('<s:text name="AdminRole.IfDelete" />'))
		{
			document.getElementById(id).submit();
		}
	}
	
	function fillFileType(obj)
	{
		document.getElementById("adminFile.fileType").value= obj.options[obj.selectedIndex].value;
		setValue(document.getElementById("adminFile.fileType"));
	}

	function clearValue(obj)
	{
		if(obj.style.color=="#cdcdcd")
		{
			obj.value="";
			obj.style.color="";
		}				   
	}
	//set input value when input is logindomain
	function setValue()
	{
	   var obj=document.getElementById("adminFile.fileType");
	   if(obj.value!=""&&obj.value!="<s:text name='请输入文件类别'/>")
	   {
	       obj.style.color="";
	   }
	   else if(obj.value==''||obj.value=="<s:text name='请输入文件类别'/>")
	   {
	       obj.value="<s:text name='请输入文件类别'/>";
	       obj.style.color="#cdcdcd";
	   }
	}
</script>
</html>
