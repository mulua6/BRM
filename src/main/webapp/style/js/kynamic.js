var kynamic1 = {

    event: {
        initEvent: function(){
			//先加载知识树
			kynamic1.method.kynamicFun.loadTree();
			
        }
		
    },
    data: {},
    method: {
        kynamicFun: {
            loadTree: function(){
                $("#kynamicTree").dataTree({
                    url: 'kynamicAction_showKynamicTree.action',
                    data: {pid:0},
                    setting: {
                        treeNodeKey: 'kid'
                    },
                    allLoad: true
                });
                
            }
            
        },
		showRMenu: function(rMenuJSON){
        
            $("#rMenu ul").show();
            $("#rMenu").css({
                "top": rMenuJSON.y + "px",
                "left": rMenuJSON.x + "px",
                "display": "block"
            });
            
            if (rMenuJSON.addFolder) {
                $("#addFolder").show();
            }
            else {
                $("#addFolder").hide();
            }
            
            if (rMenuJSON.addFile) {
                $("#addFile").show();
            }
            else {
                $("#addFile").hide();
            }
            
            if (rMenuJSON.updateNode) {
                $("#updateNode").show();
            }
            else {
                $("#updateNode").hide();
            }
            
            if (rMenuJSON.deleteNode) {
                $("#deleteNode").show();
            }
            else {
                $("#deleteNode").hide();
            }
        }
    }
}

$().ready(function(){
	kynamic1.event.initEvent();

});
