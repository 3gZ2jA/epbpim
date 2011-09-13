var MailForm=function(b,c,a){return this.setup(b,c,a);};MailForm.prototype.setup=function(d,j,a){var h=this.initToolbar();var e=new copyFieldItems();var g=new Ext.data.JsonReader({root:"data"},[{name:"mail.recipientIDs",mapping:"recipientIDs"},{name:"mail.copyToIDs",mapping:"copyToIDs"},{name:"mail.mailStatus",mapping:"mailStatus"},{name:"mail.fileIds",mapping:"fileIds"},{name:"mail.mailId",mapping:"mailId"},{name:"mail.recipientNames",mapping:"recipientNames"},{name:"mail.subject",mapping:"subject"},{name:"mailImportantFlag",mapping:"importantFlag"},{name:"mail.filenames",mapping:"filenames"},{name:"mail.content",mapping:"content"},{name:"mail.copyToNames",mapping:"copyToNames"}]);var b=new Ext.FormPanel({url:__ctxPath+"/communicate/saveMail.do",id:"mailFormPanel",border:false,autoHeight:true,reader:g,defaults:{margins:"0 0 0 0"},items:[{fieldLabel:"收件人ID列表用,分隔",name:"mail.recipientIDs",id:"mail.recipientIDs",xtype:"hidden"},{fieldLabel:"抄送人ID列表用,分开",name:"mail.copyToIDs",id:"mail.copyToIDs",xtype:"hidden"},{fieldLabel:"邮件状态",name:"mail.mailStatus",id:"mail.mailStatus",xtype:"hidden",value:1},{fieldLabel:"附件IDs",name:"mail.fileIds",xtype:"hidden",id:"mail.fileIds"},{fieldLabel:"BOXID",name:"boxId",xtype:"hidden",id:"mailBoxId"},{fieldLabel:"MailId",name:"mail.mailId",xtype:"hidden",id:"mail.mailId"},{fieldLabel:"操作",name:"replyBoxId",xtype:"hidden",id:"mail.replyBoxId"},{fieldLabel:"附件名称列表",name:"mail.filenames",xtype:"hidden",id:"mail.filenames"},{fieldLabel:"主题",xtype:"textfield",name:"mail.subject",id:"mail.subject",allowBlank:false,width:512,blankText:"邮件主题为必填"},{xtype:"compositefield",fieldLabel:"收件人",items:[{width:325,height:21,name:"mail.recipientNames",id:"mail.recipientNames",xtype:"textfield",allowBlank:false,blankText:"请选择收件人",readOnly:true},{xtype:"button",text:"选择收件人",iconCls:"btn-mail_recipient",handler:function(){UserSelector.getView(function(n,l){var m=Ext.getCmp("mail.recipientIDs");var k=Ext.getCmp("mail.recipientNames");m.setValue(n);k.setValue(l);}).show();}},{xtype:"button",text:"我要抄送",iconCls:"btn-mail_copy",handler:function(){var k=Ext.getCmp("copyField");k.show();}}]},{xtype:"container",id:"copyField",layout:"column",height:32,hidden:true,defaultType:"textfield",items:[e]},{xtype:"compositefield",fieldLabel:"优先级",items:[{width:430,fieldLabel:"邮件优先级",hiddenName:"mail.importantFlag",id:"mailImportantFlag",xtype:"combo",mode:"local",editable:false,value:"1",triggerAction:"all",store:[["1","一般"],["2","重要"],["3","非常重要"]]},{xtype:"checkbox",name:"sendMessage",boxLabel:"告诉他有信"}]},{xtype:"container",layout:"column",fieldLabel:"附件",items:[{columnWidth:0.85,border:false,layout:"form",items:[{xtype:"panel",height:50,name:"filenames.display",id:"filenames.display",items:"",autoScroll:true}]},{columnWidth:0.15,border:false,layout:"form",defaultType:"button",items:[{text:"上传附件",iconCls:"menu-attachment",handler:function(){var k=App.createUploadDialog({file_cat:"communication/innerMail",callback:uploadMailAttach});k.show();}},{text:"清除附件",iconCls:"reset",handler:function(){Ext.getCmp("mail.fileIds").setValue("");Ext.getCmp("mail.filenames").setValue("");Ext.getCmp("filenames.display").update();}}]}]},{fieldLabel:"内容",name:"mail.content",id:"mail.content",xtype:"htmleditor",height:350}]});if(d!=null&&d!="undefined"){var i=Ext.getCmp("mail.mailId");i.setValue(d);if(a=="draft"){b.getForm().load({deferredRender:false,url:__ctxPath+"/communicate/getMail.do",method:"post",params:{mailId:d,folderId:3,boxId:j},waitMsg:"正在载入数据...",success:function(k,m){var r=Ext.getCmp("mail.copyToIDs");if(r.getValue()!=""){var l=Ext.getCmp("copyField");l.show();}var p=Ext.getCmp("mail.filenames").getValue();if(p!=""){var q=Ext.getCmp("filenames.display");var t=Ext.getCmp("placeholder");if(t!=null){t.hide();}var u=p.split(",");var o=Ext.getCmp("mail.fileIds").getValue().split(",");var s="";for(var n=0;n<u.length;n++){s+='<span><a href="#" onclick="FileAttachDetail.show('+o[n]+')">'+u[n]+'</a> <img class="img-delete" src="'+__ctxPath+'/images/system/delete.gif" onclick="deleteAttach(this,'+o[n]+')"/>&nbsp;|&nbsp;</span>';}Ext.DomHelper.append(q.body,s);}},failure:function(k,l){}});}else{if(a=="reply"){b.getForm().load({deferredRender:false,url:__ctxPath+"/communicate/optMail.do",method:"post",params:{mailId:d,boxId:j,opt:"回复"},waitMsg:"正在载入数据...",success:function(k,l){Ext.getCmp("mail.replyBoxId").setValue(j);},failure:function(k,l){}});}else{if(a=="forward"){b.getForm().load({deferredRender:false,url:__ctxPath+"/communicate/optMail.do",method:"post",params:{mailId:d,opt:"转发"},waitMsg:"正在载入数据...",success:function(k,l){},failure:function(k,l){}});}}}}if(j!=null&&j!="undefined"){var f=Ext.getCmp("mailBoxId");f.setValue(j);}var c=new Ext.Panel({title:"发送邮件",iconCls:"menu-mail_send",autoScroll:true,tbar:h,id:"MailForm",layout:"hbox",margins:"0 0 6 0",layoutConfig:{padding:"5",pack:"center",align:"middle"},defaults:{margins:"0 5 0 0"},items:[b]});return c;};MailForm.prototype.initToolbar=function(){var a=new Ext.Toolbar({height:30,items:[{text:"立即发送",iconCls:"btn-mail_send",handler:function(){var c=Ext.getCmp("mailFormPanel");var b=Ext.getCmp("mail.mailStatus");if(c.getForm().isValid()){b.setValue(1);c.getForm().submit({waitMsg:"正在发送邮件,请稍候...",success:function(d,e){Ext.Msg.confirm("操作信息","邮件发送成功！继续发邮件?",function(g){if(g=="yes"){c.getForm().reset();}else{var f=Ext.getCmp("centerTabPanel");f.remove("MailForm");}});},failure:function(d,e){Ext.ux.Toast.msg("错误信息",e.result.msg);}});}}},{text:"存草稿",iconCls:"btn-mail_save",handler:function(){var c=Ext.getCmp("mail.mailStatus");c.setValue(0);var b=Ext.getCmp("mailFormPanel");if(b.getForm().isValid()){b.getForm().submit({waitMsg:"正在保存草稿,请稍候...",success:function(d,e){Ext.Msg.confirm("操作信息","草稿保存成功！继续发邮件?",function(g){if(g=="yes"){d.getForm().reset();}else{var f=Ext.getCmp("centerTabPanel");f.remove("MailForm");}});},failure:function(d,e){Ext.ux.Toast.msg("错误信息",e.result.msg);}});}}},{text:"重置",iconCls:"reset",handler:function(){var b=Ext.getCmp("MailFormPanel");b.getForm().reset();}},{text:"取消",iconCls:"btn-mail_remove",handler:function(){var b=Ext.getCmp("centerTabPanel");b.remove("MailForm");}}]});return a;};function copyFieldItems(){var a=[{xtype:"label",text:"抄送人:",style:"padding-left:0px;padding-top:3px;",width:105},{width:330,fieldLabel:"抄送人姓名列表",name:"mail.copyToNames",id:"mail.copyToNames",readOnly:true},{xtype:"button",text:"选择抄送人",style:"padding-left:5px;",iconCls:"btn-mail_recipient",handler:function(){UserSelector.getView(function(e,c){var d=Ext.getCmp("mail.copyToIDs");var b=Ext.getCmp("mail.copyToNames");d.setValue(e);b.setValue(c);}).show();}},{xtype:"button",text:"取消抄送",style:"padding-left:5px;",iconCls:"btn-delete_copy",handler:function(){var b=Ext.getCmp("copyField");var c=Ext.getCmp("mailFormPanel");c.getForm().findField("mail.copyToIDs").setValue("");c.getForm().findField("mail.copyToNames").setValue("");b.hide();}}];return a;}function uploadMailAttach(c){var h="";var j=Ext.getCmp("mail.fileIds");var a=j.getValue();if(a!=null&&a!=""){a+=",";}var d=Ext.getCmp("mail.filenames");var f=d.getValue();if(f!=null&&a!=""){f+=",";}var e=Ext.getCmp("filenames.display");var g=Ext.getCmp("placeholder");if(g!=null){g.hide();}for(var b=0;b<c.length;b++){a+=c[b].fileId;f+=c[b].fileName;if(b<c.length-1){a+=",";f+=",";}h+='<span><a href="#" onclick="FileAttachDetail.show('+c[b].fileId+')">'+c[b].fileName+'</a> <img class="img-delete" src="'+__ctxPath+'/images/system/delete.gif" onclick="deleteAttach(this,'+c[b].fileId+')"/>&nbsp;|&nbsp;</span>';}j.setValue(a);d.setValue(f);Ext.DomHelper.append(e.body,h);}function deleteAttach(g,b){var e=Ext.getCmp("mail.fileIds").getValue();var d=Ext.getCmp("mail.filenames").getValue();var a="";var c="";if(e.indexOf(",")<0){Ext.getCmp("mail.fileIds").setValue("");}else{e=e.replace(","+b,"").replace(b+",","");Ext.getCmp("mail.fileIds").setValue(e);}Ext.get(g.parentNode).remove();if(Ext.getCmp("mail.fileIds").getValue()==""){Ext.getCmp("placeholder").show();}var f=Ext.getCmp("mail.mailId").getValue();if(f!=null&&f!=""&&f!="undefined"){Ext.Ajax.request({url:__ctxPath+"/communicate/attachMail.do",method:"post",params:{mailId:f,fileId:b,fileIds:a,filenames:c},success:function(){}});}else{Ext.Ajax.request({url:__ctxPath+"/system/multiDelFileAttach.do",params:{ids:b},method:"post",success:function(){Ext.ux.Toast.msg("信息提示","成功删除所选记录！");}});}}