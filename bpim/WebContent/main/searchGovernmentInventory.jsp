<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.bpim.common.Constants" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String username = (String) session.getAttribute(Constants.LOGIN_USER_NAME);
	if(StringUtils.isEmpty(username)) {
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../images/logo.ico" rel="SHORTCUT ICON" />
<script language="javascript" type="text/javascript" src="../js/common.js">

</script>
<script type="text/javascript">
	function setSearchValue() {
		var provice = "<s:property value="condition.provice"/>";
		if(provice!="")
		document.getElementById("provice").value=provice;
		var quotaNum = "<s:property value="condition.quotaNum"/>";
		if(quotaNum!="")
		document.getElementById("quotaNum").value=quotaNum;
		var quotaName = "<s:property value="condition.quotaName"/>";
		if(quotaName!="")
		document.getElementById("quotaName").value=quotaName;
		var quotaClass = "<s:property value="condition.quotaClass"/>";
		if(quotaClass!="")
		document.getElementById("quotaClass").value=quotaClass;
	}
	function clearPage(updateId){
		var ps = document.getElementById("ps");
		var pn = document.getElementById("pn");
		if(ps != null) {
			ps.options[1].selected = true;
		}
		if(pn != null) {
			pn.options[0].selected = true;
		}
		document.getElementById("searchGovernmentQuotaForm").submit();
	}
	
	var onecount=0;
	
    subcat = new Array();
   
    subcat[0] = new Array("土石方工程(0101)","01","0101");
   
    subcat[1] = new Array("地基与桩基础工程(0102)","01","0102");
   
    subcat[2] = new Array("砌筑工程(0103)","01","0103");
   
    subcat[3] = new Array("混凝土及钢筋混凝土工程(0104)","01","0104");
   
    subcat[4] = new Array("厂库房大门、特种门、木结构工程(0105)","01","0105");
   
    subcat[5] = new Array("金属结构工程(0106)","01","0106");
   
    subcat[6] = new Array("屋面及防水工程(0107)","01","0107");
   
    subcat[7] = new Array("防腐、隔热、保温工程(0108)","01","0108");
   
    subcat[8] = new Array("楼地面工程(0201)","02","0201");
   
    subcat[9] = new Array("墙柱面工程(0202)","02","0202");
   
    subcat[10] = new Array("天棚工程(0203)","02","0203");
   
    subcat[11] = new Array("门窗工程(0204)","02","0204");
   
    subcat[12] = new Array("油漆、涂料、裱糊工程(0205)","02","0205");
   
    subcat[13] = new Array("其他装饰工程(0206)","02","0206");
   
    subcat[14] = new Array("机械设备安装工程(0301)","03","0301");
   
    subcat[15] = new Array("电气设备安装工程(0302)","03","0302");
   
    subcat[16] = new Array("热力设备安装工程(0303)","03","0303");
   
    subcat[17] = new Array("炉窑砌筑工程(0304)","03","0304");
   
    subcat[18] = new Array("静置设备与工艺金属结构制作安装工程(0305)","03","0305");
   
    subcat[19] = new Array("工业管道工程(0306)","03","0306");
   
    subcat[20] = new Array("消防工程(0307)","03","0307");
   
    subcat[21] = new Array("给排水、采暖、燃气工程(0308)","03","0308");
   
    subcat[22] = new Array("通风空调工程(0309)","03","0309");
   
    subcat[23] = new Array("自动化控制仪表安装工程(0310)","03","0310");
   
    subcat[24] = new Array("通信设备及线路工程(0311)","03","0311");
   
    subcat[25] = new Array("建筑智能化系统设备安装工程(0312)","03","0312");
   
    subcat[26] = new Array("长距离输送管道工程(0313)","03","0313");
   
    subcat[27] = new Array("土石方工程(0401)","04","0401");
   
    subcat[28] = new Array("道路工程(0402)","04","0402");
   
    subcat[29] = new Array("桥涵护岸工程(0403)","04","0403");
   
    subcat[30] = new Array("隧道工程(0404)","04","0404");
   
    subcat[31] = new Array("市政管网工程(0405)","04","0405");
   
    subcat[32] = new Array("地铁工程(0406)","04","0406");
   
    subcat[33] = new Array("绿化工程(0501)","05","0501");
   
    subcat[34] = new Array("园路、园桥、假山工程(0502)","05","0502");
   
    subcat[35] = new Array("园林景观工程(0503)","05","0503");   
		 
    onecount=36;

    function changeSuperClass(superClassID)
    {
    	var subClassObj=document.getElementById("inventorySubClass");
    	subClassObj.length = 0;      
    	subClassObj.options[subClassObj.length] = new Option("不限", "");
		for (var i = 0; i < onecount; i++)
		{
			if (subcat[i][1] == superClassID || !superClassID)
			{ 
				subClassObj.options[subClassObj.length] = new Option(subcat[i][0], subcat[i][2]);
			}        
		}
	}	
</script>
</head>
<title>清单查询</title>
</head>
<body onload="setSearchValue();changeTitleBackground();changeSuperClass();">
<div id="main"><jsp:include page="mainHeader.jsp" />
<div class="content">
<div class="content_resize">
<s:form	action="searchGovernmentInventory.do" method="post" name="searchGovernmentInventoryForm" id="searchGovernmentInventoryForm">
<div class="mainbar">
<h3 class="title">清单查询</h3>
<div id="searchCondition">
	<ul>
		<li style="width:170px;">项目大类：
			<select id="inventorySuperClass" name="condition.inventorySuperClass" style="width: 100px;" onchange="changeSuperClass(this.options[this.selectedIndex].value)"> 
				<option value="">--请选择--</option>
				<option value="01">建筑工程(01)</option>
				<option value="02">装饰装修工程(02)</option>
				<option value="03">安装工程(03)</option>
				<option value="04">市政工程(04)</option>
				<option value="05">园林绿化工程(05)</option>
			</select>
		</li>
		<li style="width:210px;">项目小类：
			<select id="inventorySubClass" name="condition.inventorySubClass" style="width: 140px;"></select>
		</li>
		<li>
			<label class="lb">项目编号：</label><input style="width: 60px" class="inputText" name="condition.inventoryNum" id="inventoryNum">
		</li>
		<li>
			<label class="lb">项目名称：</label><input style="width: 120px" class="inputText" name="condition.inventoryName" id="inventoryName">
		</li>
		<li>
			<input type="button" name="searchButton" id="searchButton" class="button" onclick="clearPage()" value="查询">
		</li>
	</ul>
</div>

<div class="searchResult" id="searchResult" style="margin-top:15px;">
<ul>
	<li style="width: 100px">清单大类</li>
	<li style="width: 100px">编号</li>
	<li style="width: 300px">名称</li>
	<li style="width: 50px">查看详情</li>
</ul>
<s:if test="datas==null || datas.size()==0">
</s:if> 
<s:else>
	<s:iterator value="datas" status="st">
		<ul id="<s:property value='id'/>">
			<li style="width: 100px"><s:property value="governmentQuotaClass" /></li>
			<li style="width: 140px"><s:property value="governmentQuotaType" /></li>
			<li style="width: 100px"><s:property value="governmentQuotaNum" /></li>
			<li style="width: 160px">
				<s:if test="%{null!=governmentQuotaName&&governmentQuotaName.length()>12}">
					<s:property value="governmentQuotaName.substring(0, 11)+'...'" />
				</s:if>
				<s:else>
					<s:property value="governmentQuotaName" />
				</s:else>
			</li>
			<li style="width: 60px"><s:property value="governmentQuotaModel" /></li>
			<li style="width: 60px"><s:property value="governmentQuotaUnit" /></li>
			<li style="width: 60px"><s:property value='governmentQuotaAmount' /></li>
			<li style="width: 50px">
				<input type="button" class="button" onclick="window.location.href = 'viewGovernmentQuotaDetail.do?id=<s:property value='id'/>'" value="查看">
			</li>
		</ul>
	</s:iterator>
	<ul>
		<jsp:include page="../common/pagination.jsp" flush="true">
			<jsp:param name="action_page" value="main/searchGovernmentQuota.do"/>
		</jsp:include>
	</ul>
</s:else></div>
</div>
</s:form>

 <!-- end #content -->


<div class="clr"></div>
</div>
</div>
<!-- end #page --> 
<jsp:include page="../common/footer.jsp" /></div>
</body>
</html>