PathChangeWindow=Ext.extend(Ext.Window,{constructor:function(a){Ext.applyIf(this,a);this.initUIComponents();PathChangeWindow.superclass.constructor.call(this,{title:"更改执行路径",width:800,height:400,layout:"border",maximizable:true,items:[this.leftPanel,this.rightPanel]});},initUIComponents:function(){this.leftPanel=new Ext.Panel({autoScroll:true,width:400,collapsible:true,title:"流程示意图",html:'<img src="'+__ctxPath+"/jbpmImage?taskId="+this.taskId+"&rand="+Math.random()+'"/>',region:"west",split:true});this.rightPanel=new Ext.form.FormPanel({title:"更改执行路径",region:"center",layout:"form",autoScroll:true,bodyStyle:"padding:4px",defaults:{anchor:"98%,98%"},tbar:new Ext.Toolbar({items:[{xtype:"button",iconCls:"btn-save",text:"保存",scope:this,handler:this.save}]}),items:[{xtype:"hidden",name:"userIds"},{fieldLabel:"跳转节点",allowBlank:false,xtype:"combo",name:"destName",allowBlank:false,editable:false,lazyInit:false,anchor:"90%,90%",triggerAction:"all",store:new Ext.data.ArrayStore({autoLoad:true,url:__ctxPath+"/flow/freeTransProcessActivity.do?taskId="+this.taskId,fields:["signalName","destName"]}),displayField:"destName",valueField:"signalName"},{xtype:"compositefield",fieldLabel:"下一步执行人",items:[{xtype:"textfield",name:"userNames",anchor:"98%,98%"},{xtype:"button",text:"选择执行人",scope:this,handler:this.setHandler}]}]});},setHandler:function(){var a=this.rightPanel;UserSelector.getView(function(b,c){a.getCmpByName("userIds").setValue(b);a.getCmpByName("userNames").setValue(c);}).show();},save:function(){var g=this;var c=this.rightPanel;var b=c.getCmpByName("userIds").getValue();var k=c.getCmpByName("destName");var j=k.getValue();var f="";var h=k.getStore();for(var e=0;e<h.getCount();e++){var d=h.getAt(e);if(j==d.data.signalName){f=d.data.destName;break;}}if(c.getForm().isValid()){var a=this.taskGrid;c.getForm().submit({url:__ctxPath+"/flow/nextProcessActivity.do",method:"post",waitMsg:"正在提交处理，请稍等",params:{taskId:this.taskId,flowAssignId:b,signalName:j,destName:f},success:function(i,l){Ext.ux.Toast.msg("操作信息","成功保存！");if(!a){a=Ext.getCmp("allTaskGrid");}a.getStore().reload();g.close();},failure:function(i,l){Ext.ux.Toast.msg("操作信息","操作出错，请联系管理员！");g.close();}});}}});