FCKCommands.RegisterCommand("dradiobutton",new FCKDialogCommand("dradiobutton",FCKLang.RadioButtonProp,FCKPlugins.Items["dradiobutton"].Path+"fck_dradiobutton.html",340,160));var oSItem=new FCKToolbarButton("dradiobutton",FCKLang.RadioButtonProp,null,null,null,true,50);FCKToolbarItems.RegisterItem("dradiobutton",oSItem);FCK.ContextMenu.RegisterListener({AddItems:function(c,a,b){if(b=="INPUT"&&a.type=="radio"&&a.getAttribute("cfckradio")){c.RemoveAllItems();c.AddItem("Cut",FCKLang.Cut,7,FCKCommands.GetCommand("Cut").GetState()==FCK_TRISTATE_DISABLED);c.AddItem("Copy",FCKLang.Copy,8,FCKCommands.GetCommand("Copy").GetState()==FCK_TRISTATE_DISABLED);c.AddItem("Paste",FCKLang.Paste,9,FCKCommands.GetCommand("Paste").GetState()==FCK_TRISTATE_DISABLED);c.AddItem("dradiobutton",FCKLang.RadioButtonProp,50);}}});