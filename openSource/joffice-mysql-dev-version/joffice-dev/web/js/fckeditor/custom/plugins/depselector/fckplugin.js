FCKCommands.RegisterCommand("depselector",new FCKDialogCommand("depselector",FCKLang.DepSelectorDlgTitle,FCKPlugins.Items["depselector"].Path+"fck_depselector.html",380,210));var oSItem=new FCKToolbarButton("depselector",FCKLang.DepSelectorBtn);oSItem.IconPath=FCKPlugins.Items["depselector"].Path+"department.png";FCKToolbarItems.RegisterItem("depselector",oSItem);FCK.ContextMenu.RegisterListener({AddItems:function(c,a,b){if(b=="INPUT"&&a.getAttribute("isdepsel")){c.RemoveAllItems();c.AddItem("Cut",FCKLang.Cut,7,FCKCommands.GetCommand("Cut").GetState()==FCK_TRISTATE_DISABLED);c.AddItem("Copy",FCKLang.Copy,8,FCKCommands.GetCommand("Copy").GetState()==FCK_TRISTATE_DISABLED);c.AddItem("Paste",FCKLang.Paste,9,FCKCommands.GetCommand("Paste").GetState()==FCK_TRISTATE_DISABLED);c.AddItem("depselector",FCKLang.DepSelectorDlgTitle,FCKToolbarItems.GetItem("depselector").IconPath);}}});