var JobSelector={getView:function(d,b){var a=this.initUIComponent(b);var c=new Ext.Window({id:"jobSelectorWin",title:"职位选择器",iconCls:"menu-job",layout:"fit",region:"center",maximizable:true,modal:true,width:600,minWidth:400,height:425,minHeight:425,items:[a],buttonAlign:"center",buttons:[{text:"确定",iconCls:"btn-ok",handler:function(){var g="";var j="";if(b==null||b==true){var h=Ext.getCmp("jobSelectorJobTreePanel").getSelectionModel().getSelectedNode();if(h!=null&&h.id>0){g=h.id;j=h.text;}}else{var e=Ext.getCmp("JobSelectorEditorGridPanel").getStore();for(var f=0;f<e.getCount();f++){g+=e.getAt(f).data.jobId+",";j+=e.getAt(f).data.jobName+",";}g=g.substring(0,g.length-1);j=j.substring(0,j.length-1);}if(d!=null){d.call(this,g,j);}c.close();},scope:this},{text:"取消",iconCls:"btn-cancel",handler:function(){c.close();}}]});return c;},initUIComponent:function(d){var c=d!=null&&d==true?"center":"west";var a=new Ext.tree.TreePanel({id:"jobSelectorJobTreePanel",layout:"form",region:c,width:200,collapsible:true,autoScroll:true,split:true,title:"岗位信息列表",tbar:new Ext.Toolbar({defaultType:"button",items:[{text:"刷新",iconCls:"btn-refresh",handler:function(){Ext.getCmp("jobSelectorJobTreePanel").root.reload();}},{text:"展开",iconCls:"btn-expand",handler:function(){Ext.getCmp("jobSelectorJobTreePanel").expandAll();}},{text:"收起",iconCls:"btn-collapse",handler:function(){Ext.getCmp("jobSelectorJobTreePanel").collapseAll();}}]}),loader:new Ext.tree.TreeLoader({url:__ctxPath+"/hrm/treeLoadJob.do"}),root:new Ext.tree.AsyncTreeNode({expanded:true}),rootVisible:false,listeners:{"dblclick":this.nodeDBClick}});var g=new Ext.grid.CheckboxSelectionModel();var f=new Ext.grid.EditorGridPanel({id:"JobSelectorEditorGridPanel",title:"已选中的职位列表",layout:"form",region:"center",width:"100%",autoWidth:true,height:"100%",autoHeight:true,border:false,autoScroll:true,viewConfig:{forceFit:true,enableRowBody:false,showPreview:false},store:new Ext.data.ArrayStore({fields:["jobId","jobName"]}),trackMouseOver:true,sm:g,columns:[g,new Ext.grid.RowNumberer(),{header:"jobId",dataIndex:"jobId",hidden:true},{header:"职位名称",dataIndex:"jobName",anchor:"90%"}]});f.addListener("dblclick",function(k,m){var k=Ext.getCmp("JobSelectorEditorGridPanel");var l=k.getSelectionModel().getSelections();var h=k.getStore();for(var j=0;j<l.length;j++){k.stopEditing();h.remove(l[j]);}});var e=new Ext.Panel({layout:"border",region:"center",width:"100%",height:"100%",border:false,autoScroll:true,items:[new Ext.Panel({region:"west",frame:true,width:40,layout:{type:"vbox",pack:"center",align:"stretch"},defaultType:"button",items:[{iconCls:"add-all",text:"",scope:this,handler:this.addAll},{iconCls:"rem-all",text:"",scope:this,handler:this.removeAll}]}),{region:"center",autoScroll:true,items:[f]}]});var b=new Ext.Panel({layout:"border",region:"center",autoScroll:true,border:false,anchor:"98%,98%",items:[a]});if(d!=null&&d==false){b.add(e);b.doLayout();}return b;},nodeDBClick:function(f){if(f!=null&&f.id>0){var e=Ext.getCmp("JobSelectorEditorGridPanel");var b=e.getStore();var h=e.getSelectionModel().getSelections();var c=false;for(var d=0;d<b.getCount();d++){if(b.getAt(d).data.jobId==f.id){c=true;break;}}if(!c){var g={jobId:f.id,jobName:f.text};var a=new b.recordType(g);e.stopEditing();b.add(a);}}},addAll:function(){var a=Ext.getCmp("jobSelectorJobTreePanel");var e=Ext.getCmp("JobSelectorEditorGridPanel");var g=a.getSelectionModel().getSelectedNode();if(g!=null&&g.id>0){var c=e.getStore();var h=true;for(var d=0;d<c.getCount();d++){if(c.getAt(d).data.jobId==g.id){h=false;break;}}if(h){var f={jobId:g.id,jobName:g.text};var b=new c.recordType(f);e.stopEditing();c.add(b);}}},removeAll:function(){var c=Ext.getCmp("JobSelectorEditorGridPanel");var d=c.getSelectionModel().getSelections();var a=c.getStore();for(var b=0;b<d.length;b++){c.stopEditing();a.remove(d[b]);}}};