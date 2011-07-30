<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../css/register.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../images/logo.ico" rel="SHORTCUT ICON" />
<script type='text/javascript' src='../dwr/engine.js'></script>  
<script type='text/javascript' src='../dwr/util.js'></script> 
<script type='text/javascript' src='../dwr/interface/UserInfoService.js'></script> 
</head>
<body onload="createCode();">
<div id="main"><jsp:include page="loginHeader.jsp" />
<div class="content">
<div class="content_resize">
<div class="mainbar">
<h2 class="title">用户注册</h2>
<form action="register.do" name="registerForm" method="post" id="registerForm">
<div id="registerTable">
<ul>
	<li class="labelLi"><label >用户名:</label></li>
	<li class=""><input name="userName" maxlength="10" id="userName" /></li>
	<li> <input	type="button" style="width: 100px"
	onclick="checkUserName();" class="button" value="检查用户名"></li>
	<li><label class="comments">由6-10位字母数字组成</label></li>
</ul>

<ul>
	<li class="labelLi"><label >密码:</label></li>
	<li class="inputLi"><input name="password" maxlength="10" id="password"  type="password"/></li>
	<li><label class="required">*必填</label></li>
	<li><label class="comments">由6-10位字母数字组成</label></li>
</ul>
<ul>
	<li  class="labelLi"><label >密码确认:</label></li>
	<li class="inputLi"><input name="passwordConfirm" maxlength="10" id="passwordConfirm" type="password"
		 /></li>
	<li><label class="required">*必填</label></li>
	<li><label class="comments">由6-10位字母数字组成</label></li>
</ul>
<ul>
	<li  class="labelLi"><label >邮箱:</label></li>
	<li class="inputLi"><input name="mailAddress" maxlength="100" id="mailAddress"
		 /></li>
	<li><label class="required">*必填</label></li>
</ul>
<ul>
	<li  class="labelLi"><label >公司:</label></li>
	<li class="inputLi"><input name="company" maxlength="20" id="company"
		 /></li>
	<li><label class="required">*必填</label></li>
	<li><label class="comments">20个字以内</label></li>
</ul>
<ul>
	<li  class="labelLi"><label >手机:</label></li>
	<li class="inputLi"><input name="mobile" maxlength="20" id="mobile"
		 /></li>
	<li></li>
	<li><label class="comments">11位手机号</label></li>
</ul>

<ul>
	<li  class="labelLi"><label >密码找回问题:</label></li>
	<li class="inputLi"><input name="question" maxlength="20" id="question"
		 /></li>
	<li><label class="required">*必填</label></li>
	<li><label class="comments">20个字以内</label></li>
</ul>

<ul>
	<li  class="labelLi"><label >密码找回答案:</label></li>
	<li class="inputLi"><input name="answer" maxlength="20" id="answer"
		 /></li>
	<li><label class="required">*必填</label></li>
	<li><label class="comments">20个字以内</label></li>
</ul>

<ul>
	<li  class="labelLi"><label >验证码:</label></li>
	<li class="inputLi"><input name="validateCode" maxlength="10" id="validateCode" /></li>	
	<li><img align="absmiddle" id="randNumIMG" src="${pageContext.request.contextPath}/image.jsp" style="cursor:hand" onclick="javascript:reloadIMG();" alt="点击换验证码" /><s:fielderror theme="Struts"><s:param>validateCode</s:param></s:fielderror></li>
</ul>
<ul>
<li><input type="button" id="register-submit" style="width: 130px"
	onclick="validateCommit();" class="button" value="同意协议并注册"></li>
<li> <input
	type="button" onclick="displayProtocal();"
	 class="button" value="显示协议"></li>
<li></li>
</ul>
</div>

<div > </div>
<div style="display: none" id="displayProtocal">
<textarea>任远信息网络办公服务产品使用协议
感谢您选择任远信息（以下简称“任远”）的网络办公产品服务！
在使用本服务前，请您务必先仔细阅读本协议以下条款：

 （一）定义

 1. “任远网络办公服务”/“本服务”，包括截止目前在线存储服务、发布\使用、整理、分析数字数据文件服务及后续任远可能推出的纳入任远建筑行业网络办公范畴内的其他服务。任远将不断创新致力于向您提供最优体验，您认知并同意任远提供的服务形式和本质可不经事先通知您而不时变换。
 2. “任远建筑信息管理系统服务”即任远运用在线存储、分析服务系统，按照用户已同意的任远指定的服务协议条款，依据接收到的用户帐号、密码和用户指令（用户指令，包括但不限于用户手动操作所发出的指令以及用户网页游览器手动上传所发出的指令）进行相应的操作，通过互联网络为用户提供远程文件存储、分析的服务。
 2.1本协议所提“手动上传”，是指用户使用网页游览器登录任远产品服务器并且互联网的前提下，任远产品服务器监测到用户手动上传的数据，服务器自动将“变化”更新到该用户的网络账号下的行为。本协议所提“变化”，包括但不下于文件/文件夹的整理、分析、增加、删除、更名、更改、移动。
 3. “发布\使用数字数据文件服务”，即任远运用发布\使用数字数据文件服务系统，按照用户已同意的任远指定的服务协议条款，通过互联网络为用户提供发布、使用、整理、分析数字数据的服务。
3.1 “数字数据文件”，即用户发布并出现在   任远建筑信息管理系统   上的内容，仅限于文字、数字、数据（如：材料价格、信息价格），无论数字数据的表现形式，凡属文学和科学领域具有独创性并能以某种有形形式复制的智力成果，均构成本协议所指数据。
3.2 “发布数据”，即上载并出现在   任远建筑信息管理系统  上的数字数据。
 3.3“用户”，即所有使用本“服务”的个人及企业组织；
 3.4“在线存储用户”即使用“任远建筑信息管理系统”的数据储存用户。
 3.5 “发布用户”，即依照本协议约定将其依法享有所有权或获得所有权人合法授权的文件发布，使得该文件出现在 www.jcjyo.net(任远建筑信息管理系统登陆页面)上并可供使用用户依照本协议约定加以使用的数字数据文件提供者。
3.6“使用数据分析用户”，即依照本协议约定就发布数字数据文件加以分析数据的用户。

 （二）接受本协议

 1. 所有用户，包括但不限于“在线存储用户”、“发布用户”和/或“使用数据分析用户”拟使用本服务的全部或部分必须首先同意本协议。如果您不接受本协议，请不要使用本服务的全部或部分。
 2. 即便您没有点击同意本协议，您的下述行为也将视为您对本协议的认可：
2.1 点击激活链接激活本服务，您的激活行为将视为您对本协议的完全同意；或
2.2 实际使用本服务，您的使用行为将视为您对本协议的完全同意；或
2.3 实际使用任远连同本服务一并提供的任何产品或服务，您的使用行为将视为您对本协议的完全同意。
2.4 实际使用第三方连同本服务一并提供的任何产品或服务，您的使用行为将视为您对本协议的完全同意。
 3. 您继续之前，任远强烈建议您打印或在本地保存本协议作为备案。

 （三）服务资费

 任远将有可能就本服务的全部或部分向用户收取费用，具体资费政策以届时在任远建筑信息管理系统www.jcjyo.net上公布的内容为准，届时如您不同意按照任远制定的收费标准支付服务费用，您可自行主动取消本服务。

 （四）本协议和/或本服务的变更

 1. 任远有权依照本协议约定方式就本协议的有关约定和/或有关服务内容进行变更，包括但不限于对在  任远建筑信息管理系统  用户按照任远规定的标准进行分级并针对不同级别的  任远建筑信息管理系统  用户提供不同服务内容，对任远在 任远建筑信息管理系统   的存储空间、存储格式要求、用户账号下网站回收站中文件的保留时间、对保存在用户账号下的相同文件名的文件/文件夹因发生“变化”所产生的历史记录版本的数量、本服务的具体形式、方法等进行调整。任远将在该变更内容确定后通过本协议第（十二）条约定的方式向用户公布，一旦本协议和/或有关服务内容发生变动，任远将会在该变更内容确定后通过本协议第（十二）条约定的方式向用户公布。
 2. 请您不时关注本协议及本服务有关内容，以便掌握任何变动情况。如果您不同意任远变更的内容，您可以主动取消获得的本服务。如果您在 变更内容通告后15天内未主动取消本服务，包括但不限于未删除存储或发布的数字数据文件，则视为接受本协议和/或有关服务的变更；变更内容通告后您如果仍继续 使用任远提供的产品和服务亦构成对有关变更的接受。本协议及针对某项服务添加相关特别约定、专项服务协议中凡提及“主动取消本服务”均仅指用户以邮件方式 主动联系本服务的任远客服并明确告知任远客服取消服务，任远客服联系邮件为 CustomerService@jcjyo.com 。如用户针对变更内容有异议，应立即停止使用本服务，并在上述约定期限内主动取消本服务， 但已支付的费用不予退还（如果有关服务为收费服务）。
 3. 同时，任远将可能进一步扩充本服务功能，针对该部分新增功能将有可能附带特别适用于该功能的协议内容，请您在使用该新增功能前，仔细阅读该功能所附带协议（如有）。届时您接受该项新增功能服务的前提为您同意该项新增功能服务所附带的所有法律文件，包括但不限于本协议及新增功能服务所附带的协议。如果您不接受该新增功能所附带协议，请您切勿使用该新增功能，您的使用行为将被视为您完全接受该附带协议。同时您知悉并同意如本协议与任何针对某项新增服务添加相关特别约定、协议不一致的，均优先适用针对新增功能所添加相关特别约定及协议的规定。

 （五）服务开通及中止、终止

 1. 服务的开通
1.1 用户接受任远指定的服务条款，完成相应的用户账号注册程序后，便成为本服务的合法用户。
1.2 用户在申请使用本服务时，必须向任远提供真实、准确的个人资料，如个人资料有任何变动，必须及时更新，以便任远确认您的身份，为您提供密码找回等服务。如您的密码被遗忘、丢失或被盗用，您可按任远规定的流程申请重置或更换，除按规定的流程为您重置或更换密码外，任远对此不再承担其他任何责任。
1.3 用户申请成功后，每个用户都将获得一个用户账号并由该用户掌握其相应的密码，该用户账号和密码由用户负责保管；用户应当对以其用户账号进行的所有活动和事件负法律责任。若因为用户自身原因，而导致账号、密码遭他人非法使用时，任远将不负责处理。用户自身原因包括但不限于：任意向第三者透露账号和密码及所有注册资料；多人共享同一个账号；安装非法或来路不明的程序；将已经登陆帐号的设备提供给他人使用等。
 1.4 用户所输入的用户名和找回密码及答案。任远有权拒绝向任何用户提供任何信息或承担任何义务。
1.5 如若有任何第三方向任远发出指示，在确认其提供账户、密码信息准确的情况下，用户同意且任远有权视为该行为获得了用户的充分授权，该行为所产生结果直接归属于用户本身。

 2. 服务的中止 
2.1 为了本服务的正常运行，任远需要定期或不定期地进行维护，因此类情况而造成的正常服务中断，用户应该予以理解，任远将尽合理努力事先进行通告，并尽力避免服务中断或将中断时间限制在最短时间内；但对因此产生的不便和损失，任远不承担责任。
2.2 如发生下列任何一种情形，任远有权随时中断向用户提供本协议项下的服务而无需通知用户，对因此而产生的不便或损害，任远对用户或第三人均不承担任何责任：
2.2.1 定期检查或施工，更新软硬件等，任远有权暂停服务，但任远会尽快完成维护、更新工作；
2.2.2 服务器遭受损坏，无法正常运作；
2.2.3 突发性的软硬件设备与电子通信设备故障；
2.2.4 网络提供商线路或其它故障；
2.2.5 在紧急情况之下为维护国家安全或其它用户及第三者之人身安全；
2.2.6 不可抗力及其他第三方原因。
2.3 当在线用户的意外（断电、电脑死机、误操作）操作对当前文件上传和修改的操作，用户将自行承担上述情况发生时而可能造成的损失。

 3. 服务的终止
3.1 用户可以到指定的页面，申请取消本服务，一旦取消成功，该用户所有与本服务相关的内容，包括但不限于在线存储的内容或发布的数字数据文件，将会被自动删除。任远强烈建议您在主动取消本服务前，自行备份相关内容。在您主动取消本服务后，任远拒绝提供恢复服务。
3.2 如用户违反任远的相关规定，任远有权立即取消对该用户的本服务的部分或全部。请您严格依照任远相关规定使用本服务，因您的违约行为而导致任远取消 部分或全部本服务的，您所有与本服务相关的内容，包括但不限于存储的内容或发布的数字数据文件，将会被删除，任远拒绝提供任何恢复服务。
 4. 除前款所述情形外，用户同意任远享有通过在提前1个月以网站公告（网站：www.jcjyo.net ）通知的方式中断或终止部分或全部本服务的权利，用户已明确知晓上述权利的授予且知晓因上述权利的行使可能给自身及其他第三方造成的直接或间接利益减损，用户在此明确表示不追究任远因行使上述单方中断或终止服务权利而可能导致的一切责任。
 5. 如果任远就本协议有关服务进行收费，则本协议项下该收费的有关服务终止后（仅指任远决定终止提供该有关服务的情形），对于用户已经购买但尚未使用的 有关服务，任远拒绝退还用户任何费用。任远给予用户 90个工作日的期限用于申请退还已经购买但尚未使用的有关服务。 用户认可上述申请退还期限的合理性，并应在上述申请退还期限内依照届时任远公布的具体政策申请办理退还手续。上述申请退还期限届满，用户依照任远届时公布 具体政策提交的退还申请未能到达任远届时指定接受地址的，视为用户自动放弃该项退还权利，任远针对该用户已经购买但尚未使用的有关服务有权予以拒绝进行退还处理。本款所指退还政策仅针对用户已经购买但尚未使用的有关服务。
 6. 无论因任何原因用户暂停接受服务或终止服务十二个月，任远将就该账号予以删除。

 （六）隐私政策

 1. 任远不收集有关您的任何特定信息，除非您特意提供了此类信息或者您已经同意任远收集此类信息。除用户注册信息之外。
 2. 任远可能会在特定情况下与第三方合作，共同向您提供相关的网络服务，在此情况下，如该第三方同意承担与任远同等的保护用户隐私的责任，则任远可将您的个人信息等提供给该第三方。
 3. 在不透露您隐私资料的前提下，任远有权对整个用户数据库进行分析并对用户数据库进行商业上的利用（包括但不限于公布、分析或以其它方式使用用户访问量、用户偏好等用户数据信息）。
 4. 任远建筑信息管理系统用户可以对在线存储的“内容”进行：存档、下载、整理、分析（包括但不限于在线存储用户自行手动下载）到本地计算机、管理（包括但不限于进行删除操作）、共享给其他用户、发布HTML格式文档等动作。请放心，除非您将存入的“内 容”进行“发布”，否则它们都会保持私有性。登录之后，您可以将您的在线存储“内容”的访问权授予任何用户。在这之前，您的在线存储的“内容”访问权限都 归您个人所有。工作人员或者其他人不会有任何途经获取您私有的在线存储的“内容”信息，做为商业用途。
 6. 请确信，在未经您的明确同意之前，任远绝不会向其他公司或个人出租或销售您的任何在线存储的信息和“内容”。漫游器 (Robot) 和信息采集软件 (Spider) 不会搜到您未“发布”的在线存储的“内容”，因此您未发布和共享的在线存储的“内容”不会出现在任何任远提供的搜索索引中。
 7. 同时任远提示在线使用用户，因在线存储用户的个人授权、下载、共享、发布等行为而导致“公布”或公开在线存储的“内容”，与任远无关，由在线存储用户对其自身的行为负责
 8. 任远提示您，您通过本服务发布数字数据即构成对您数据的发表；因您的个人发布而导致内容的“公布”或公开，与任远无关，请您就您自身的行为负责。
 9. 任远提示在线存储用户，在线存储用户之间共享文件、信息、内容等的行为，与任远无关，由该等在线存储用户根据其行为由其各自自行承担责任。
 10. 任远有权要求发布用户提供上传数字数据的源文件，任远保证不对外公开或向第三方提供发布用户提供的源代码，但下列情况除外：
10.1 事先获得该发布用户的明确授权；
10.2 根据有关的法律法规要求；
10.3 按照相关政府主管部门的要求；
10.4 为维护社会公众的利益；
10.5 为维护任远的合法权益。
 11. 任远要求发布用户提供源代码的行为并不构成任远的审查义务。

 （七）广告

 1. 用户认可任远有权在向用户提供服务时可展示广告和推销，无论是针对自身产品/服务或第三方产品/服务。
 2. 任远在服务上展示广告和推销的方式、模式和范围可不经向用户特别通知而变更。
 3. 用户应意识到作为服务一部分展示给用户的内容，包括但不限于服务中的广告及服务中的赞助内容，可能受知识产权的保护。用户不得修改、租赁、出租、借贷、出售、分发该内容（无论全部还是部分）或根据该内容创作衍生作品，除非任远或内容权利人在单独协议中特别告知用户可以为之。
 4. 您于本服务或经由本服务与广告商进行通讯或商业往来，或参与促销活动，包含相关商品或服务之付款及交付，以及前述交易其他任何相关 条款、条件、保证或声明，完全为您与前述广告商之间之行为。任远依其注册地法律法规及本协议，毋须承担对广告及广告商进行审查、甄别之义务。
 5. 前述任何交易或前述广告商出现于本服务所生之任何性质的损失或损害，您同意任远不予负责。

 （八）网站行为

 1. 本网站在国家法律、法规、政策范围内，依照用户指令（包括但不限于：用户使用在本网站注册的帐号/密码前提下，直接在本网站操作、用户对 任远建筑材料信息管理系统 的操作等相关操作）提供相关内容的上传、下载、存储、管理、整理、分析（包括但不限于进行删除操作）、链接或搜索服务，本网站 不对用户发布数字数据进行任何编辑、修改或选择，仅为用户提供存储、发布、管理、整理、分析数字数据和搜索、下载、使用数字数据的平台。
 2. 本网站不能控制用户发布数字数据的合法性以及其来源、归属，也不承担任何预先审核义务。本网站提醒用户应该通过自己的谨慎判断确定发布数字数据的合法性和有效性。
 3. 本网站不能控制或保证用户完全遵照本协议发布或使用数字数据，包括但不限于该数字数据与用户使用的其他软件的兼容性、可用性、稳定性。本网站提醒用 户可能存在用户超出本协议范围进行发布或使用数字数据的侵权行为，用户应自行承担因此而产生的一切损失，包括但不限于因使用经本服务下载或取得的任何资料 导致用户电脑系统损坏或资料丢失。本网站仅在必要时提供协助义务。
 4. 本网站不涉及任何基于发布数字数据而产生的包括权属确认、使用授权等在内的一切法律关系及法律纠纷。本网站不以任何形式参与发布用户或者使用用户包括授权使用等在内行为，也拒绝承担基于此所产生的一切责任。
5. 用户对使用本网站上的发布数字数据自行承担风险，本网站不就用户的任何行为做任何形式的保证。
 6. 本网站的发布数字数据，除因站务管理需要并已获得本网站授权而由本网站管理人员发布的公告类帖文外，仅代表该发布用户本人观点，与本网站立场无关。
 7. 因如下所列任何原因而造成的个人资料泄露、丢失、被盗用或被篡改等，本网站均获得免责：
 (a) 任何因政府管制而造成的暂时性关闭等影响网络正常浏览的不可抗力原因；
 (b) 任何计算机系统问题、黑客攻击、计算机病毒侵入或发作的原因。

 （九）用户行为

 1. 用户所存储、发布内容均系其合法享有所以权的数字数据或依法取得所有权人授权的数字数据（及享有相关权益及第三方授权的其他内容）；用户就该内容依法享有的所以权或使用授权能完全满足本网站规则对该内容加以使用。
 2. 您经由本服务存储、发布、整理、分析数字数据，完全是您而非任远的责任。任远无法控制经由本服务存储、发布、整理、分析数字数据，因此不保证存储、发布数字数据之正确性、合法性、安全性、完整性或品质。
 3. 任远对于您使用本服务所存储、发布的数字数据不承担任何审查或保证责任，您承诺您使用本服务完全合法且不侵犯任何第三方的合法权益，如您使用本服务 违反法律规定或侵害到其他人合法权益导致任何第三人提出索赔的，均由您独立承担全部法律责任。任远接受您提交内容之行为均不得视为任远对该内容的认可。
 4. 您同意如若任远有理由认为您使用本服务之行为违反法律规定或有任何第三方告知任远您使用本服务之行为侵犯其合法权益的，任远有权在不预先通知您的情况下立即屏蔽或者删除相应内容，并暂停或终止您使用本服务的全部或部分，即便您使用本服务发布之内容有可能最终未被有管辖权的司法机构认定为非法或侵犯任何第三方的合法权益。
 5. 您若将任远在线存储、发布、整理、分析数字数据服务作下述使用，任远有权屏蔽或者删除任何前述内容，并暂停或终止您使用本服务的全部或部分：
5.1 “发布”任何非法、有害、胁迫、滥用、骚扰、侵害、中伤、粗俗、猥亵、诽谤、侵害他人隐私、有害或种族歧视的或道德上令人不快的“内容”。
5.2 以任何方式危害未成年人。
5.3 冒充任何人或机构，包含但不限于任远主管. 论坛版主. 工作人员等工作人员或与此有关的其他人员，或以虚伪不实的方式陈述或谎称与任何人或机构部门。
5.4 伪造任远官方网站以及任何任远在线存储服务以欺骗其它用户。
5.5 将侵害任何人之任何专利、 商标、 商业秘密、著作权或其他专属权利（以下简称“权利”）之“内容”加以“发布”。
5.6 将任何广告“内容”或其他任何形式的劝诱“内容”加以“发布”。
5.7 将设计目的在于干扰. 破坏或限制任何计算机软件. 硬件或通讯设备功能之软件病毒或其他计算机代码. 档案和程序之任何“内容”，加以“发布”。
5.8 破坏正常的使用流程，恶意共享文件，上传大量垃圾“内容”到公共存储空间。
5.9 干扰或破坏本服务或与本服务相连线之服务器和网络，或不遵守于本服务连线网络之规定. 程序. 政策或规范。
5.10 故意或非故意违反任何相关现行有效法律。
5.11 收集和储存其他使用用户之个人资料。
5.12 其他任远认为有害或不当行为。
 6. 用户应遵守中华人民共和国相关法律法规(如果用户在中华人民共和国境外使用本服务，应遵守所在国家或地区的法律法规)。用户保证其所发布的数字数据不存在任何违法中华人民共和国法律、法规、政策等的内容；不存在任何违背社会风俗、社会道德和互联网一般道德和礼仪的内容；不存在其他任何不当内容。特别提示，用户不得发布下列内容，否则任远有权删除任何前述数字数据并暂停或终止您使用本服务的全部或部分，已支付的费用不予返还：
6.1 反对中华人民共和国宪法所确定的基本原则的；
6.2 危害国家统一、主权和领土完整的；
6.3 泄露国家秘密，危害国家安全或者损害国家荣誉和利益的；
6.4 煽动民族仇恨、民族歧视，破坏民族团结或者侵害民族风俗、习惯的；
6.5 破坏国家宗教政策，宣扬邪教、迷信的；
6.6 散布谣言，扰乱社会秩序，破坏社会稳定的；
6.7 散布淫秽、赌博、暴力或者教唆犯罪的；
6.8 侮辱或者诽谤他人，侵害他人合法权益的；
6.9 危害社会公德或者民族优秀文化传统的；
6.10 发布任何非法、有害、胁迫、滥用、骚扰、侵害、中伤、粗俗、猥亵、诽谤、侵害他人隐私、有害或种族歧视的或道德上令人不快的数字数据；
6.11 以任何方式危害未成年人；
6.12 冒充任何人或机构，包含但不限于任远主管、论坛版主、工作人员，或以虚伪不实的方式陈述或谎称与任何人或机构部门；
6.13 伪造任远官方网站以及任何本服务以欺骗其它用户；
6.14 将侵害任何人之任何专利、商标、商业秘密、著作权或其他专属权利（以下简称“权利”）之数字数据加以发布；
6.15 将任何广告数字数据或其他任何形式的劝诱数字数据加以发布；
6.16 将设计目的在于干扰、破坏或限制任何计算机软件、硬件或通讯设备功能之软件病毒或其他计算机代码、档案和程序之任何数字数据，加以发布；
6.17 破坏正常的使用流程、恶意共享文件、发布大量垃圾数字数据到公共存储空间；
6.18 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；未经允许，对计算机信息网络功能进行删除、修改或者增加的；未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；干扰或破坏本服务或与本服务相连线之服务器和网络，或不遵守于本服务连线网络之规定、程序、政策或规范；
6.19 故意或非故意违反任何相关现行有效法律；
6.20 收集和储存其他用户之个人资料；
6.21 其他任远认为有害或不当行为。
 7. 用户授权
7.1 授权内容
发布用户授权任何使用用户均可在法律允许的范围内就其发布在 jcjyo.net 的数字数据不限于使用于非商业目的；上述授权为普通全球授权，不可分授权或转授权；该使用授权包括著作权法第十条所指复制权、发行权、出租权、展览权、表演权、放映权、广播权、信息网络传播权、摄制权、改编权、翻译权、汇编权。“商业目的”在此界定为无论是否收费盈利，但凡与商业运营、推广等相关的目的或以任何直接或者间接的方式为公司或其他营利性组织服务均视为具备商业性。
7.2 授权限制
为获得上述授权，使用用户应依照法律规定履行相关义务，尊重并不得侵犯发布用户人身性质的著作权，包括发表权、修改权、署名权、保持作品完整的权利；且应完全在本协议约定授权范围内使用，如若涉及任何超出本协议约定授权范围的使用均应自行与发布用户联系并获得其书面授权。同时在使用发布数字数据时在合理位 置附上本协议内容全文使得第三方能明确获悉本协议条款，并不得就该协议条款作任何修改。
7.2 授权终止
如若发布用户删除其发布的该数字数据，则该授权自删除行为完成时停止，该撤销行为对已发生的授权使用不具备溯及力，已授权行为可且仅可在原有范围内继续使用；除上述情况外，该授权持续生效。
 8. 您使用任何发布数字数据的内容时，均依赖前述内容之正确性、合法性、完整性、安全性或实用性，您同意必须自行加以评估，承担所有风险。
 9. 本网站在此声明，上述授权条款并不代表本网站已就发布用户的发布数字数据予以使用，不构成任何证明本网站使用发布用户的发布数字数据的依据。

 （十）移除通知

 1. 如果您认为发布用户发布在本网站发布数字数据侵犯您所享有的所有权，请以书面通知的形式向本网站提供以下信息以便本网站进行移除，通知书应包括以下内容：
1.1 涉嫌侵权发布数字数据所侵犯的著作权、所以权属证明；
1.2 权利人的姓名（名称）、联系方式、地址、身份证复印件（自然人）、单位登记证明复印件（单位）；
1.3 要求移除的发布数字数据的准确名称和网络地址；
1.4 侵犯著作权的相关证据；
1.5 通知书内容的真实性声明；
1.6 通知书需著作权人亲笔签名，若为单位则需加盖单位公章。
 2. 本网站的联系方式为：CustomerService@jcjyo.com 
 3. 本网站将根据您发出的通知尽快移除相关内容，并保留该通知6个月。但若您发出的通知书不符合上述约定，则视为未发出，本网站将不会采取任何措施。移除上述内容后，若本网站收到原发布用户的反通知证明被移除内容的合法性的，本网站有权恢复被移除的内容，并不承担任何责任。

 （十一）声明

 1. 您需要自行承担下述责任和赔偿费用：
1.1 您经由本服务在线存储内容、共享在线存储的内容、发布数字数据侵害到其他人任何权益导致任何第三人提出索赔或请求。
1.2 您违反本协议导致任何第三人提出索赔或请求。
1.3 索赔请求包括但不限于合理的律师费和任远及其关联公司、 主管、 代理人、 联名厂商或其他伙伴及员工的经济损失。
1.4 您自行承担因存储、发布数字数据所产生的一切法律责任，并保证本网站可在法律允许的范围内最大限度享有免责权。
 2. 服务范围
本服务仅供个人、企业在中国大陆地区范围内（香港、澳门、台湾地区除外）用于商业目的的使用，您不得以任何方式出售、转让本服务、将本服务租赁给其他方使用或以任何方式利用本服务牟取利益，任何超出上述授权范围的使用均被视为未经授权的非法使用行为，任远保留权利要求相关责任人承担相应的法律责任包括但不限于 民事责任、行政责任、刑事责任。
 3. 第三方行为之免责
因本服务，部分服务（系统数据库）的提供有赖于任远之外的第三方提供的服务及资源，因此，如您使用本服务遭受的损失系由于任远之外的第三方提供的服务及资源所致，您只能向该第三方追索赔偿，任远将尽可能的予以协助，但对此不承担任何责任。
 4. 任远的有限保证
本有限保证取代任何文档、包装、或其他资料中的任何其他明示或默示的保证(如果有)。任远仅以"现有状况且包含所有错误"的形式提供相关的产品、软件或程序及任何服务，并仅保证：
(a) 任远所提供的产品和服务能基本符合任远正式公布的要求；
(b) 任远所提供的相关产品和服务基本与任远正式公布的服务承诺相符；
(c) 任远仅在商业上允许的合理范围内尽力解决任远在提供产品和服务过程中所遇到的任何问题。
在适用法律允许的最大范围内，任远明确表示不提供任何其他类型的保证，不论是明示的或默示的，包括但不限于适销性、适用性、可靠性、准确性、完整性、无病毒以及无错误的任何默示保证和责任。
在适用法律允许的最大范围内，任远并不担保任远所提供的产品和服务一定能满足用户的要求或符合用户的期望，也不担保提供的产品和服务不会被中断，并且对产品和服务的及时性、安全性、出错发生，以及信息是否能准确、及时、顺利的传送均不作任何担保。
在适用法律允许的最大范围内，任远不就因用户使用任远的产品和服务引起的、或在任何方面与任远的产品和服务有关的任何意外的、非直接的、特殊的、或间接的 损害或请求(包括但不限于因人身伤害、因用户隐私泄漏、用户个人资料、企业资料或用户的文件、内容、信息、数据等的泄露、丢失、被盗用等，因未能履行包括诚信或合理 谨慎在内的任何责任、因过失和因任何其他金钱上的损失或其他损失而造成的损害赔偿)承担任何责任。
 5.无第三方受益人
本协议仅为用户和任远的利益而订立。除许可的继承或转让之外，本协议非为任何他人的利益而订立。

 （十二）通告

 1. 所有致用户的通告均可通过电子邮件或常规的站内信件或网站公告传送。其它重要事项均可以此形式进行。
2. 该通告于发送或公告之日视为已送达收件人。因为特殊原因（特殊原因包括但不限于：用户提供的电子邮箱失效、用户的邮箱设有邮件过滤、邮件拦截功能）导致用户的电子邮件地址无法成功收到任远软件向您所提供的电子邮箱发送的通告，任远对此不承担任何责任。
 （十三）法律管辖

 1. 本协议的订立、执行和解释及争议的解决均应适用中国法律。
2. 如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，用户和任远一致同意交由网站运营商所在地有管辖权的法院管辖。
 （十四）其他

 1. 用户对服务之任何部分或本协议的任何部分之意见及建议可通过客户服务部门与任远联系。
2. 请点击：www.jcjyo.net 查看客服联系方式。
</textarea></div>
</form>


</div>
<jsp:include page="advertisement.jsp" />

<!-- end #content -->


<div class="clr"></div>
</div>
</div>
<!-- end #page --> <jsp:include page="../common/footer.jsp" />
</div>
</body>
<script type="text/javascript">
var code ; //在全局 定义验证码  
function reloadIMG()
{	
	var randNumImg = document.getElementById("randNumIMG");
	randNumImg.src = "http://"+window.location.host+"/BPIM/image.jsp?" + Math.random();
}
function createCode()  
{   
  code = "";  
  var codeLength = 4;//验证码的长度  
  var checkCode = document.getElementById("checkCode");  
  var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的     
  for(var i=0;i<codeLength;i++)  
  {  
   var charIndex = Math.floor(Math.random()*36);  
   code +=selectChar[charIndex];  
  }   
  if(checkCode)  
  {  
    checkCode.className="code";  
    checkCode.value = code;
    checkCode.blur();  
  }       
}     

function displayProtocal(){
	var displayProtocal = document.getElementById("displayProtocal");
	displayProtocal.style.display = "block";
}

function checkUserName(){
	var userName = document.getElementById("userName").value;
	var regExp=/^[0-9a-zA-Z-]+$/;
	if(userName==null||userName==""){
		alert("用户名不能为空");
		return removePassword();
	}
	if(userName.length<6||userName.length>10){
		alert("用户名必须在6到10位之间");
		return removePassword();
	}
	if(!regExp.test(userName)){
		alert("用户名只能输入字母数字");
		return removePassword();
	}
	var userName = document.getElementById("userName").value;
	UserInfoService.checkUserName(userName,callback);
}

function callback(valid){
	if(valid){
		alert("用户名可以使用");
	}else{
		alert("用户名已经存在");
	}
}

function validateCommit(){
	var userName = document.getElementById("userName").value;
	var regExp=/^[0-9a-zA-Z-]+$/;
	var mobileRegExp=/^[0-9]+$/;
	if(userName==null||userName==""){
		alert("用户名不能为空");
		return removePassword();
	}
	if(userName.length<6||userName.length>10){
		alert("用户名必须在6到10位之间");
		return removePassword();
	}
	if(!regExp.test(userName)){
		alert("用户名只能输入字母数字");
		return removePassword();
	}
	var password = document.getElementById("password").value;
	if(password==null||password==""){
		alert("密码不能为空");
		return removePassword();
	}
	if(password.length<6||password.length>10){
		alert("密码必须在6到10位之间");
		return removePassword();
	}
	if(!regExp.test(password)){
		alert("密码只能输入字母数字");
		return removePassword();
	}
	var passwordConfirm = document.getElementById("passwordConfirm").value;
	if(passwordConfirm==null||passwordConfirm==""){
		alert("确认密码不能为空");
		return removePassword();
	}
	if(passwordConfirm.length<6||passwordConfirm.length>10){
		alert("确认密码必须在6到10位之间");
		return removePassword();
	}
	if(!regExp.test(passwordConfirm)){
		alert("确认密码只能输入字母数字");
		return removePassword();
	}
	if(passwordConfirm!=password){
		alert("确认密码和密码不一致");
		return removePassword();
	}
	var mailAddress = document.getElementById("mailAddress").value;
	if(mailAddress.indexOf("@")<0){
		alert("邮箱格式不对");
		return removePassword();
	}
	var mobile = document.getElementById("mobile").value;
	if(mobile!==null&&mobile!=""&&!mobileRegExp.test(mobile)){
		alert("电话号码只能包括数字");
		return removePassword();
	}
	if(mobile!==null&&mobile.length!=11){
		alert("手机号码格式不对");
		return removePassword();
	}
	var question = document.getElementById("question").value;
	if(question==null){
		alert("问题不能为空");
		return removePassword();
	}
	if(question.length>20){
		alert("问题不能超过20个字");
		return removePassword();
	}
	var answer = document.getElementById("answer").value;
	if(answer==null){
		alert("答案不能为空");
		return removePassword();
	}
	if(question.length>20){
		alert("答案不能超过20个字");
		return removePassword();
	}
	document.getElementById("registerForm").submit();
	
}

function removePassword(){
	document.getElementById("password").value = "";
	document.getElementById("passwordConfirm").value = "";
	return false;
}

</script>
</html>
