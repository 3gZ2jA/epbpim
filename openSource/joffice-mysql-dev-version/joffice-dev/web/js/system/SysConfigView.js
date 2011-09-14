Ext.ns("SysConfigView");var SysConfigView=function(){return new Ext.Panel({id:"SysConfigView",iconCls:"menu-system-setting",title:"系统配置",tbar:this.tbar(),autoScroll:true,items:[this.setup()]});};SysConfigView.prototype.tbar=function(){var a=new Ext.Toolbar();a.add(new Ext.Button({text:"保存",iconCls:"btn-save",handler:function(){var b=Ext.getCmp("mailConfigForm");if(b.getForm().isValid()){b.getForm().submit({method:"post",waitMsg:"正在提交数据...",success:function(c,e){Ext.ux.Toast.msg("操作信息","成功信息保存！");var d=Ext.getCmp("centerTabPanel");d.remove("SysConfigView");},failure:function(c,d){Ext.MessageBox.show({title:"操作信息",msg:"信息保存出错，请联系管理员！",buttons:Ext.MessageBox.OK,icon:"ext-mb-error"});}});}}}));a.add(new Ext.Button({text:"重置",iconCls:"btn-reseted",handler:function(){var b=Ext.getCmp("mailConfigForm");b.removeAll();SysConfigView.loadSysConfigData(b);}}));return a;};SysConfigView.prototype.setup=function(){var a=new Ext.FormPanel({id:"mailConfigForm",url:__ctxPath+"/system/saveSysConfig.do",defaultType:"textfield",bodyStyle:"padding-left:10%;",frame:false,border:false,layout:"form",items:[]});SysConfigView.loadSysConfigData(a);return a;};SysConfigView.loadSysConfigData=function(a){Ext.Ajax.request({url:__ctxPath+"/system/loadSysConfig.do",success:function(c,e){var w=Ext.util.JSON.decode(c.responseText);var l=w.data.adminConfig;var t=[];if(l){for(var q=0;q<l.length;q++){t.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:l[q].configName,width:100},{xtype:"textfield",width:300,allowBlank:false,id:l[q].configKey,name:l[q].configKey,value:l[q].dataValue},{xtype:"label",width:200,text:l[q].configDesc}]});}}var r={xtype:"fieldset",title:"行政管理配置",width:650,style:"padding-bottom:3px;",layout:"form",items:t};var v=w.data.codeConfig;var s=[];if(v){for(var q=0;q<v.length;q++){s.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:v[q].configName,width:100},{xtype:"combo",mode:"local",editable:false,triggerAction:"all",store:[["1","开启验证码"],["2","屏蔽验证码"]],width:300,allowBlank:false,hiddenName:v[q].configKey,value:v[q].dataValue},{xtype:"label",width:200,text:v[q].configDesc}]});}}var o={xtype:"fieldset",title:"验证码配置",width:650,style:"padding-bottom:3px;",layout:"form",items:s};var b=w.data.smsConfig;var u=[];if(b){for(var q=0;q<b.length;q++){if(b[q].dataType==2){u.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:b[q].configName,width:100},{xtype:"combo",mode:"local",editable:false,triggerAction:"all",store:[["1","打开"],["2","关闭"]],width:300,allowBlank:false,hiddenName:b[q].configKey,value:b[q].dataValue},{xtype:"label",width:200,text:b[q].configDesc}]});}else{u.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:b[q].configName,width:100},{xtype:"textfield",width:300,allowBlank:false,id:b[q].configKey,name:b[q].configKey,value:b[q].dataValue},{xtype:"label",width:200,text:b[q].configDesc}]});}}u.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"button",iconCls:"menu-mobile",text:"测试设备连接",handler:function(){new SmsMobileForm({}).show();}}]});}var n={xtype:"fieldset",title:"短信猫配置",width:650,style:"padding-bottom:3px;",layout:"form",items:u};var m=w.data.smsPortConfig;var x=[];if(m){for(var q=0;q<m.length;q++){x.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:m[q].configName,width:100},{xtype:"textfield",width:300,id:m[q].configKey,name:m[q].configKey,value:m[q].dataValue},{xtype:"label",width:200,text:m[q].configDesc}]});}x.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"button",iconCls:"menu-mobile",text:"测试手机端口",handler:function(){new SmsMobileForm({}).show();}}]});}var d={xtype:"fieldset",title:"短信端口配置",width:650,style:"padding-bottom:3px;",layout:"form",items:x};var p=w.data.suggestConfig;var j=[];if(p){j.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:p[1].configName,width:100},{xtype:"textfield",editable:false,width:300,allowBlank:false,id:p[1].configKey,name:p[1].configKey,value:p[1].dataValue},{xtype:"button",text:"选择",iconCls:"btn-add",handler:function(){UserSelector.getView(function(A,z){var i=Ext.getCmp(p[1].configKey);var y=Ext.getCmp(p[0].configKey);i.setValue(z);y.setValue(A);},true).show();}},{xtype:"label",width:100,text:p[1].configDesc},{xtype:"hidden",editable:false,width:300,allowBlank:false,id:p[0].configKey,name:p[0].configKey,value:p[0].dataValue}]});}var k={xtype:"fieldset",title:"意见箱配置",width:650,style:"padding-bottom:3px;",layout:"form",items:j};var f=w.data.dynamicPwdConfig;var h=[];if(f){h.push({xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"container",style:"padding-bottom:3px;",layout:"column",items:[{xtype:"label",style:"font-weight:bold;",text:f[0].configName,width:100},{xtype:"combo",mode:"local",editable:false,triggerAction:"all",store:[["1","打开"],["2","关闭"]],width:300,allowBlank:false,hiddenName:f[0].configKey,value:f[0].dataValue},{xtype:"label",width:200,text:f[0].configDesc}]},{xtype:"label",style:"font-weight:bold;",text:f[1].configName,width:100},{xtype:"textfield",width:300,allowBlank:false,id:f[1].configKey,name:f[1].configKey,value:f[1].dataValue},{xtype:"label",width:200,text:f[1].configDesc}]});}var g={xtype:"fieldset",title:"动态密码配置",width:650,style:"padding-bottom:3px;",layout:"form",items:h};a.add(r);a.add(o);a.add(n);a.add(d);a.add(k);a.add(g);a.doLayout();}});};