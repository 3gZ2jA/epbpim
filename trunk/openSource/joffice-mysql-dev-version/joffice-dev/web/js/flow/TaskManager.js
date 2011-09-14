TaskManager=Ext.extend(Ext.Panel,{constructor:function(a){Ext.applyIf(this,a);this.initUIComponents();TaskManager.superclass.constructor.call(this,{id:"TaskManager",title:"任务管理",iconCls:"menu-task-manage",layout:"border",items:[this.searchPanel,this.gridPanel]});},initUIComponents:function(){this.searchPanel=new Ext.form.FormPanel({autoHeight:true,border:false,region:"north",layout:"hbox",layoutConfig:{align:"middle",pack:"left"},style:"background-color:white;padding:5px;",defaults:{margins:"0px 8px 0px 4px"},items:[{xtype:"label",text:"任务名称:"},{xtype:"textfield",name:"taskName",width:300},{xtype:"button",text:"查询",iconCls:"btn-search",scope:this,handler:this.search}]});this.store=new Ext.data.JsonStore({baseParams:{start:0,limit:25},url:__ctxPath+"/flow/allTask.do",root:"result",totalProperty:"totalCounts",fields:["taskName","activityName","assignee","createTime","dueDate","executionId","pdId","taskId","isMultipleTask"]});this.store.load();var b=new Ext.grid.CheckboxSelectionModel({singleSelect:false});var a=new Ext.grid.ColumnModel({columns:[b,new Ext.grid.RowNumberer(),{header:"taskId",dataIndex:"taskId",hidden:true},{header:"任务名称",dataIndex:"taskName",width:350},{header:"执行人",dataIndex:"assignee",renderer:function(g,f,c,h,e){var d=c.data.assignee;if(d==null||d==""){return'<font color="red">暂无执行人</font>';}else{return d;}},width:100},{header:"开始时间",dataIndex:"createTime",width:150},{header:"到期时间",dataIndex:"dueDate",width:150,renderer:function(c){if(c==""){return"无限制";}else{return c;}}}],defaults:{sortable:false,menuDisabled:true,width:150}});this.gridPanel=new Ext.grid.GridPanel({id:"allTaskGrid",region:"center",store:this.store,shim:true,trackMouseOver:true,loadMask:true,tbar:new Ext.Toolbar({items:[{text:"刷新",iconCls:"btn-refresh",scope:this,handler:this.refresh},"-",{text:"设置到期时间",scope:this,handler:this.setDueDate},"-",{text:"更改待办人",scope:this,handler:this.setHandler},"-",{text:"更改执行路径",scope:this,handler:this.setPath},"-",{text:"任务代办",scope:this,handler:this.handlerTask}]}),cm:a,bbar:new HT.PagingBar({store:this.store})});},search:function(){var a=this.searchPanel.getCmpByName("taskName");this.store.baseParams={start:0,limit:this.store.baseParams.limit,taskName:a.getValue()};this.store.reload();},refresh:function(){this.store.reload();},setDueDate:function(){var a=Ext.getCmp("allTaskGrid");var b=a.getSelectionModel().getSelections();if(b.length==0){Ext.ux.Toast.msg("操作信息","请选择任务记录!");return;}new TaskDueDateWindow().show();},setHandler:function(){var a=Ext.getCmp("allTaskGrid");var b=a.getSelectionModel().getSelections();if(b.length==0){Ext.ux.Toast.msg("操作信息","请选择任务记录!");return;}new TaskHandlerWindow().show();},setPath:function(){var a=Ext.getCmp("allTaskGrid");var b=a.getSelectionModel().getSelections();if(b.length==0){Ext.ux.Toast.msg("操作信息","请选择任务记录!");return;}new PathChangeWindow({taskId:b[0].data.taskId,taskGrid:a}).show();},handlerTask:function(){var b=Ext.getCmp("allTaskGrid");var d=b.getSelectionModel().getSelections();if(d.length==0){Ext.ux.Toast.msg("操作信息","请选择任务记录!");return;}if(d.length>1){Ext.ux.Toast.msg("操作信息","只能选择一条任务记录!");return;}var a=d[0];var e=App.getContentPanel();var c=e.getItem("ProcessNextForm"+a.data.taskId);if(c==null){c=new ProcessNextForm({taskId:a.data.taskId,activityName:a.data.activityName,agentTask:true});e.add(c);}e.activate(c);}});