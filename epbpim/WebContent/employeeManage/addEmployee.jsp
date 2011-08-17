<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>新增员工</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link rel="stylesheet"
	href="../js/My97DatePicker/skin/default/datepicker.css" type="text/css"></link>
<link href="../images/logo.ico" rel="SHORTCUT ICON" />
<script type='text/javascript' src='../js/My97DatePicker/WdatePicker.js'></script>
<script type='text/javascript' src='../js/common.js'></script>
</head>
<body>
	<div id="main"><jsp:include page="../main/mainHeader.jsp" />
		<div class="content">
			<div class="content_resize">
				<div class="mainbar">
					<h3 class="title">新增员工</h3>
					<div id="addProjectTable">
						<h4 class="title">员工基本信息</h4>
						<ul class="fullScreenUl">
							<li class="width200Li"><label class="width4Lb">姓名:</label> <input
								class="width100Input" name="projectBean.name" id="projectName" />
							</li>
							<li class="width250Li"><label class="width4Lb">编号:</label> <input
								class="width150Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">用户名:</label> <input
								class="width100Input" name="projectBean.name" id="projectName" />
							</li>
							<li class="width200Li"><label class="width4Lb">性别:</label><select
								id="projectType" name="projectBean.majorType">
									<option value="人防">--------男--------</option>
									<option value="房修">--------女--------</option>
							</select>
							</li>
							
						</ul>
						<ul class="fullScreenUl">
							<li class="width200Li"><label class="width4Lb">出生年月:</label><input
								class="Wdate width100Input" name="projectBean.startDate"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</li>
							<li class="width250Li"><label class="width4Lb">身份证:</label><input
								class="width150Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">人事档案:</label><input
								class="width100Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">党派:</label><input
								class="width100Input" name="projectBean.number" id="projectNum" />
							</li>
						</ul>
						<ul class="fullScreenUl">
							<li class="width450Li"><label class="width4Lb">家庭住址:</label><input
								class="width350Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">电话:</label><input
								class="width100Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">手机:</label><input
								class="width100Input" name="projectBean.number" id="projectNum" />
							</li>

						</ul>
						<h4 class="title">教育程度信息</h4>
						<ul class="fullScreenUl">
							<li class="width200Li"><label class="width4Lb">学历:</label> <select
								id="projectType" name="projectBean.majorType">
									<option value="0">-----请选择-----</option>
									<option value="咨询1部">初中</option>
									<option value="咨询1部">技校</option>
									<option value="咨询1部">中专</option>
									<option value="咨询1部">高中</option>
									<option value="咨询1部">大专</option>
									<option value="咨询1部">本科</option>
									<option value="咨询1部">硕士</option>
									<option value="咨询1部">博士</option>
									<option value="咨询1部">博士后</option>
							</select></li>
							<li class="width250Li"><label class="width4Lb">学校名称:</label><input
								class="width150Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">专业:</label><input
								class="width100Input" name="projectBean.number" id="projectNum" />
							</li>
							<li class="width200Li"><label class="width4Lb">毕业日期:</label><input
								class="Wdate width100Input" name="projectBean.startDate"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</li>
						</ul>
						<h4 class="title">工作信息</h4>
						<ul class="fullScreenUl">
							<li class="width200Li"><label class="width4Lb">所属部门:</label>
								<select id="projectType" name="projectBean.majorType">
									<option value="0">-----请选择-----</option>
									<option value="咨询1部">咨询1部</option>
									<option value="咨询1部">咨询2部</option>
									<option value="咨询1部">咨询3部</option>
							</select>
							</li>
							<li class="width200Li"><label class="width4Lb">入职日期:</label><input
								class="Wdate width100Input" name="projectBean.startDate"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</li>
							<li class="width200Li"><label class="width4Lb">离职日期:</label><input
								class="Wdate width100Input" name="projectBean.startDate"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
							</li>

						</ul>
						<ul class="fullScreenUl">
							<li class="width200Li"><label class="width4Lb">关联人:</label>
								<input class="width100Input" name="projectBean.number"
								id="projectNum" />
							</li>
							<li class="width250Li"><label class="width4Lb">状态:</label> <select
								id="projectType" name="projectBean.majorType">
									<option value="0">-----请选择-----</option>
									<option value="无">在职</option>
									<option value="咨询1部">离职</option>
									<option value="咨询1部">返聘</option>
									<option value="咨询1部">实习</option>
							</select>
							</li>

							<li class="width200Li"><label class="width4Lb">缴纳保险:</label>
								<select name="projectBean.majorType">
									<option value="0">-----请选择-----</option>
									<option value="无">城保</option>
									<option value="咨询1部">镇保</option>
									<option value="咨询1部">综保</option>
							</select>
							</li>
							<li class="width200Li"><label class="width4Lb">人事档案:</label><input
								class="width100Input" name="projectBean.number" id="projectNum" />
							</li>
						</ul>
						<ul class="fullScreenUl">
							<li class="width200Li"><label class="width4Lb">角色:</label>
								<select name="projectBean.majorType">
									<option value="0">-----请选择-----</option>
									<option value="无">总经理</option>
									<option value="咨询1部">部门经理</option>
									<option value="咨询1部">普通员工</option>
							</select>
							</li>
						</ul>
						<ul class="fullScreenUl">
							<li class="width450Li"><label class="width4Lb">备注:</label><input
								class="width350Input" name="projectBean.number" id="projectNum" />
							</li>
						</ul>
						<h4 class="title">职业资质信息</h4>
						<div id="employeeLicences">
							<ul class="fullScreenUl" id="1">
								<li class="width200Li"><label class="width4Lb">资质:</label>
									<select id="projectType" name="projectBean.majorType">
										<option value="0">------请选择------</option>
										<option value="咨询1部">造价工程师</option>
										<option value="咨询1部">造价员</option>
										<option value="咨询1部">招标工程师</option>
										<option value="咨询1部">一级建造师</option>
										<option value="咨询1部">咨询(投资)工程师</option>
								</select>
								</li>
								<li class="width250Li"><label class="width4Lb">证书编号:</label><input
									class="width150Input" name="projectBean.number" id="projectNum" />
								</li>
								<li class="width200Li"><label class="width4Lb">专业:</label><input
									class="width100Input" name="projectBean.number" id="projectNum" />
								</li>
								<li class="width200Li"><label class="width4Lb">有效期:</label><input
									class="Wdate width100Input" name="projectBean.startDate"
									onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></li>
								<li class="width50Li">
									<input type="button" class="mediumLeftButton"
									onclick="deleteLicense(1);" value="删除">
								</li>
							</ul>
						</div>
						<ul class="fullScreenUl">
							<li><input type="button" class="mediumLeftButton"
								onclick="addLicense();" value="新增职业资质">
							</li>
						</ul>
						<ul class="fullScreenUl">
							<li class="width450Li"><label class="width4Lb">备注:</label><input
								class="width350Input" name="projectBean.number" id="projectNum" />
							</li>
						</ul>
						<ul class="fullScreenUl">
							<li><input type="button" id="addProject"
								class="mediumLeftButton"
								onclick="window.location.href='../main/main.jsp'" value="保存">
							</li>
						</ul>
					</div>

					<div></div>


				</div>


				<div class="clr"></div>
			</div>
		</div>
		<!-- end #page -->
		<jsp:include page="../common/footer.jsp" /></div>
</body>
<script type="text/javascript">
	function addLicense() {
		var employeeLicences = $("employeeLicences");
		var ul = document.createElement("ul");
		ul.className = "fullScreenUl";
		var li1 = document.createElement("li");
		li1.innerHTML = "<label class='width4Lb'>资质:</label>"
				+ "<select id='projectType' name='projectBean.majorType'>"
				+ "<option value='0'>------请选择------</option>"
				+ "<option value='咨询1部'>造价工程师</option>"
				+ "<option value='咨询1部'>造价员</option>"
				+ "<option value='咨询1部'>招标工程师</option>"
				+ "<option value='咨询1部'>一级建造师</option>"
				+ "<option value='咨询1部'>咨询(投资)工程师</option></select>";
		var li2 = document.createElement("li");
		li2.innerHTML = "<label class='width4Lb'>证书编号:</label><input class='width150Input' name='projectBean.number' id='projectNum' />";
		var li3 = document.createElement("li");
		li3.innerHTML = "<label class='width4Lb'>专业:</label><input class='width100Input' name='projectBean.number' id='projectNum' />";
		var li4 = document.createElement("li");
		li4.innerHTML = "<label class='width4Lb'>有效期:</label><input class='Wdate width100Input' name='projectBean.startDate' onfocus=WdatePicker({dateFmt:'yyyy-MM-dd'}) />";
		var li5 = document.createElement("li");
		var t=employeeLicences.childNodes.length;
		var id = t+1;
		li5.innerHTML = "<input type='button' class='mediumLeftButton' onclick='deleteLicense("+id+")' value='删除'>";
		li1.className = "width200Li";
		li2.className = "width250Li";
		li3.className = "width200Li";
		li4.className = "width200Li";
		li5.className = "width50Li";
		ul.appendChild(li1);
		ul.appendChild(li2);
		ul.appendChild(li3);
		ul.appendChild(li4);
		ul.appendChild(li5);
		ul.setAttribute("id", id);
		employeeLicences.appendChild(ul);
	}
	
	function deleteLicense(id){ 
		if(confirm("确定删除该职业资质？")){
			var employeeLicences = $("employeeLicences");
			var ul = $(id);
			employeeLicences.removeChild(ul);
		}
	}
</script>


</html>
