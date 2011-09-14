var OutMailForm=function(b,a){return this.setup(b,a);};OutMailForm.prototype.setup=function(d,c){var e=this.initToolbar();var b=new copyFieldItems();var a=new Ext.FormPanel({url:__ctxPath+"/communicate/saveOutMail_.do",title:"发送邮件",iconCls:"menu-mail_send",layout:"form",id:"OutMailForm",tbar:e,timeout:120000,border:false,formId:"OutMailFormId",labelWidth:60,style:"padding-bottom:25px;",reader:new Ext.data.JsonReader({root:"result"},[{name:"mailId",mapping:"mailId"},{name:"outMail.title",mapping:"title"},{name:"content",mapping:"content"},{name:"senderName",mapping:"senderName"},{name:"receiverAddresses",mapping:"receiverAddresses"},,{name:"receiverNames",mapping:"receiverNames"},{name:"senderAddresses",mapping:"senderAddresses"},{name:"cCNames",mapping:"cCNames"},{name:"cCAddresses",mapping:"cCAddresses"},{name:"mailDate",mapping:"mailDate"},{name:"fileIds",mapping:"fileIds"},{name:"fileNames",mapping:"fileNames"},{name:"readFlag",mapping:"readFlag"},{name:"replyFlag",mapping:"replyFlag"},{name:"folderId",mapping:"folderid"},{name:"userId",mapping:"userId"},{name:"userName",mapping:"userName"}]),items:[{xtype:"panel",layout:"form",border:false,style:"padding-left:10%;padding-top:20px;",defaultType:"textfield",labelWidth:60,width:650,items:[{fieldLabel:"发送人地址",name:"outMail.senderAddresses",xtype:"hidden",id:"senderAddresses"},{fieldLabel:"发送人名称",name:"outMail.senderName",xtype:"hidden",id:"senderName"},{fieldLabel:"接受人址",name:"outMail.receiverAddresses",xtype:"hidden",id:"receiverAddresses"},{fieldLabel:"抄送人地址",name:"outMail.cCAddresses",value:"",xtype:"hidden",id:"cCAddresses"},{fieldLabel:"操作",name:"opt",xtype:"hidden",value:c,id:"opt"},{fieldLabel:"附件IDs",name:"outMail.fileIds",xtype:"hidden",value:"",id:"fileIds"},{fieldLabel:"MailId",name:"outMail.mailId",xtype:"hidden",id:"mailId"},{fieldLabel:"已回复",name:"outMail.replyFlag",xtype:"hidden",id:"replyFlag"},{fieldLabel:"附件名称列表",name:"outMail.fileNames",xtype:"hidden",id:"fileNames"},{xtype:"container",border:false,layout:"column",height:26,bodyStyle:"padding-top:20px;",defaultType:"textfield",items:[{xtype:"label",text:"收件人:",style:"padding-left:0px;padding-top:3px;",width:65},{width:353,fieldLabel:"收件人姓名列表",name:"outMail.receiverNames",id:"receiverNames",allowBlank:false,blankText:"请选择收件人",readOnly:false},{xtype:"button",text:"选择收件人",iconCls:"btn-mail_recipient",handler:function(){EMailSelector.getView(function(h){var g=Ext.getCmp("receiverNames");g.setValue(h);}).show();}},{xtype:"button",text:"我要抄送",iconCls:"btn-mail_copy",handler:function(){var g=Ext.getCmp("ccField");g.show();}}]},{xtype:"container",id:"ccField",layout:"column",style:"padding-left:0px;",height:26,hidden:true,defaultType:"textfield",items:[b]},{width:503,fieldLabel:"主题",name:"outMail.title",allowBlank:false,blankText:"邮件主题为必填"},{xtype:"container",layout:"column",height:50,border:false,fieldLabel:"附件",items:[{columnWidth:0.75,layout:"form",border:false,items:[{id:"outMailFileNames.display",name:"outMailFileNames.display",xtype:"panel",items:"",height:50,autoScroll:true,border:true}]},{columnWidth:0.25,layout:"form",border:false,defaultType:"button",items:[{text:"上传附件",iconCls:"menu-attachment",handler:function(){var g=App.createUploadDialog({file_cat:"communication/outMail",callback:outMailUploadMailAttach});g.show("queryBtn");}},{text:"清除附件",iconCls:"reset",handler:function(){Ext.getCmp("fileIds").setValue("");Ext.getCmp("fileNames").setValue("");Ext.getCmp("outMailFileNames.display").update();}}]}]},{fieldLabel:"内容",name:"outMail.content",id:"content",xtype:"htmleditor",height:280}]}]});if(d!=null&&d!=""&&d!=undefined){var f=Ext.getCmp("mailId");f.setValue(d);if(c=="draft"){a.getForm().load({deferredRender:false,url:__ctxPath+"/communicate/getOutMail_.do",method:"post",params:{mailId:d,folderId:3},waitMsg:"正在载入数据...",success:function(k,l){var r=Ext.getCmp("cCNames");if(r.value=="null"){r.value="";}if(r.value!=null&&r.value!=""){var v=Ext.getCmp("ccField");v.show();}var m=Ext.getCmp("fileNames").value;if(m!=""){var u=Ext.getCmp("outMailFileNames.display");var n=Ext.getCmp("outmail_placeholder");if(n!=null){n.hide();}var x=m.split(",");var q=Ext.getCmp("fileIds").value.split(",");var w="";for(var p=0;p<x.length;p++){w+='<span><a href="#" onclick="FileAttachDetail.show('+q[p]+')">'+x[p]+'</a> <img class="img-delete" src="'+__ctxPath+'/images/system/delete.gif" onclick="deleteAttach(this,'+q[p]+')"/>&nbsp;|&nbsp;</span>';}Ext.DomHelper.append(u.body,w);}var o=l.result.data;var t=o.receiverAddresses;var h=o.receiverNames;var g=getStrToEmail(t,h);k.findField("receiverNames").setValue(g);var j=o.cCAddresses;var r=o.cCNames;var s=getStrToEmail(j,r);Ext.getCmp("cCNames").setValue(s);},failure:function(g,h){}});}else{if(c=="reply"){a.getForm().load({deferredRender:false,url:__ctxPath+"/communicate/optOutMail_.do",method:"post",params:{mailId:d,opt:"回复"},waitMsg:"正在载入数据...",success:function(k,l){Ext.getCmp("mailId").setValue(d);var r=Ext.getCmp("cCNames");if(r.value!=null&&r.value!=""){var v=Ext.getCmp("ccField");v.show();}var m=Ext.getCmp("fileNames").value;if(m!=""){var u=Ext.getCmp("outMailFileNames.display");var n=Ext.getCmp("outmail_placeholder");if(n!=null){n.hide();}var x=m.split(",");var q=Ext.getCmp("fileIds").value.split(",");var w="";for(var p=0;p<x.length;p++){w+='<span><a href="#" onclick="FileAttachDetail.show('+q[p]+')">'+x[p]+'</a> <img class="img-delete" src="'+__ctxPath+'/images/system/delete.gif" onclick="deleteAttach(this,'+q[p]+')"/>&nbsp;|&nbsp;</span>';}Ext.DomHelper.append(u.body,w);}var o=l.result.data;var j=o.cCAddresses;var r=o.cCNames;var t=getStrToEmail(j,r);Ext.getCmp("cCNames").setValue(t);var s=o.senderAddresses;var h=o.senderName;var g=getStrToEmail(s,h);k.findField("receiverNames").setValue(g);},failure:function(g,h){}});}else{if(c=="forward"){a.getForm().load({deferredRender:false,url:__ctxPath+"/communicate/optOutMail_.do",method:"post",params:{mailId:d,opt:"转发"},waitMsg:"正在载入数据...",success:function(g,h){Ext.getCmp("mailId").setValue(d);var n=Ext.getCmp("cCNames");if(n.value!=null&&n.value!=""){var p=Ext.getCmp("ccField");p.show();}var j=Ext.getCmp("fileNames").value;if(j!=""){var o=Ext.getCmp("outMailFileNames.display");var k=Ext.getCmp("outmail_placeholder");if(k!=null){k.hide();}var r=j.split(",");var m=Ext.getCmp("fileIds").value.split(",");var q="";for(var l=0;l<r.length;l++){q+='<span><a href="#" onclick="FileAttachDetail.show('+m[l]+')">'+r[l]+'</a> <img class="img-delete" src="'+__ctxPath+'/images/system/delete.gif" onclick="deleteAttach(this,'+m[l]+')"/>&nbsp;|&nbsp;</span>';}Ext.DomHelper.append(o.body,q);}g.findField("receiverNames").setValue("");},failure:function(g,h){}});}}}}return a;};OutMailForm.prototype.initToolbar=function(){var a=new Ext.Toolbar({width:"100%",height:30,items:[{text:"立即发送",iconCls:"btn-mail_send",handler:function(){var b=Ext.getCmp("OutMailForm");b.getForm().submit({waitMsg:"正在发送邮件,请稍候...",timeout:120000,success:function(c,d){Ext.Msg.confirm("操作信息","邮件发送成功！继续发邮件?",function(g){if(g=="yes"){var e=Ext.getCmp("OutMailForm");e.getForm().reset();}else{var f=Ext.getCmp("centerTabPanel");f.remove("OutMailForm");}});},failure:function(c,d){if(d.result!=null&&d.result!=undefined){Ext.ux.Toast.msg("错误信息",d.result.msg);}}});}},{text:"存草稿",iconCls:"btn-mail_save",handler:function(){var b=Ext.getCmp("OutMailForm");b.getForm().findField("opt").setValue("attach");b.getForm().submit({waitMsg:"正在保存草稿,请稍候...",success:function(c,d){Ext.Msg.confirm("操作信息","草稿保存成功！继续发邮件?",function(g){if(g=="yes"){var e=Ext.getCmp("OutMailForm");e.getForm().reset();}else{var f=Ext.getCmp("centerTabPanel");f.remove("OutMailForm");}});},failure:function(c,d){if(d.result!=null&&d.result!=undefined){Ext.ux.Toast.msg("错误信息",d.result.msg);}}});}},{text:"重置",iconCls:"reset",handler:function(){var b=Ext.getCmp("OutMailForm");b.getForm().reset();}},{text:"取消",iconCls:"btn-mail_remove",handler:function(){var b=Ext.getCmp("centerTabPanel");b.remove("OutMailForm");}}]});return a;};function copyFieldItems(){var a=[{xtype:"label",text:"抄送人:",style:"padding-left:0px;padding-top:3px;",width:61},{width:350,fieldLabel:"抄送人姓名列表",name:"outMail.cCNames",value:"",id:"cCNames",emptyText:"",readOnly:false},{xtype:"button",text:"选择抄送人",iconCls:"btn-mail_recipient",handler:function(){EMailSelector.getView(function(b){var c=Ext.getCmp("cCNames");c.setValue(b);}).show();}},{xtype:"button",text:"取消抄送",iconCls:"btn-delete_copy",handler:function(){var c=Ext.getCmp("ccField");var b=Ext.getCmp("OutMailForm");Ext.getCmp("cCNames").setValue("");b.getForm().findField("cCAddresses").setValue("");c.hide();}}];return a;}function outMailUploadMailAttach(e){var h="";var j=Ext.getCmp("fileIds");var a=j.value;if(a!=null&&a!=""){a+=",";}var b=Ext.getCmp("fileNames");var g=b.value;if(g!=null&&g!=""){g+=",";}var f=Ext.getCmp("outMailFileNames.display");var c=Ext.getCmp("outmail_placeholder");if(c!=null){c.hide();}for(var d=0;d<e.length;d++){a+=e[d].fileId;g+=e[d].fileName;if(d<e.length-1){a+=",";g+=",";}h+='<span><a href="#" onclick="FileAttachDetail.show('+e[d].fileId+')">'+e[d].fileName+'</a> <img class="img-delete" src="'+__ctxPath+'/images/system/delete.gif" onclick="deleteAttach(this,'+e[d].fileId+')"/>&nbsp;|&nbsp;</span>';}j.setValue(a);b.setValue(g);Ext.DomHelper.append(f.body,h);}function deleteAttach(g,c){var e=Ext.getCmp("fileIds").value;var d=Ext.getCmp("fileNames").value;var b="";var a="";if(e.indexOf(",")<0){Ext.getCmp("fileIds").setValue("");}else{e=e.replace(","+c,"").replace(c+",","");Ext.getCmp("fileIds").setValue(e);}Ext.get(g.parentNode).remove();if(Ext.getCmp("fileIds").value==""){Ext.getCmp("outmail_placeholder").show();}display.doLayout(true);var f=Ext.getCmp("mailId").value;if(f!=null&&f!=""&&f!=undefined){Ext.Ajax.request({url:__ctxPath+"/communicate/attachOutMail_.do",method:"post",params:{mailId:f,fileId:c,fileIds:b,fileNames:a},success:function(){}});}else{Ext.Ajax.request({url:__ctxPath+"/system/multiDelFileAttach.do",params:{ids:c},method:"post",success:function(){Ext.ux.Toast.msg("信息提示","成功删除所选记录！");}});}}function getStrToEmail(c,e){var d="";if(c==null||c=="null"){c="";}if(e==null||e=="null"){e="";}if(c.length>1){var b=c.split(",");var g=e.split(",");if(b!=null&&b.length>0){if(g!=null&&g.length>0){for(var f=0;f<b.length;f++){if(g.length>=f){d+=""+g[f].replace('"',"")+""+"<"+b[f]+">"+";";}else{d+=""+b[f]+""+"<"+b[f]+">"+";";}}}else{for(var f=0;f<b.length;f++){d+=""+b[f]+""+"<"+b[f]+">"+";";}}}}return d;}