SealShowPanel=Ext.extend(Ext.Window,{ekeyPanel:null,constructor:function(a){Ext.applyIf(this,a);this.initUI();SealShowPanel.superclass.constructor.call(this,{title:"在线电子印章预览",width:580,height:440,shim:false,modal:true,iconCls:"menu-seal",layout:"fit",maximizable:true,buttonAlign:"center",buttons:this.buttons,items:[this.ekeyPanel]});},afterRender:function(){SealShowPanel.superclass.afterRender.call(this);var a=this.ekeyPanel.openFormURL(this.fileId,null);a.IsShowStatus=false;if(0!=a.StatusCode){this.on("show",function(){this.close();},this);return;}},initUI:function(){Ext.useShims=true;this.buttons=[{xtype:"button",text:"关闭",iconCls:"btn-cancel",scope:this,handler:function(){this.close();}}];this.ekeyPanel=new NtkoSignPanel({border:true});}});