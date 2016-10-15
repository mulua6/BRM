var privilege = {
		
	event:{
		initEvent:function(){
			$("a").each(function(){
				var me = this;
				if($(this).text() =="设置权限"){
					
					$(this).unbind("click");
					$(this).bind("click",function(){
					//把隐藏的div显示出来
					privilege.method.divFun.showDiv();
					//把页面上rid和name的值赋值给priviege.data.role
					privilege.method.roleFun.assignRole(this);
					//显示角色名称
					privilege.method.roleFun.showRoleName();
					//因为在这个时候，树肯定没有加载，所以显示等待图片，隐藏树
					privilege.method.privilegeTreeFun.switchWaitingAndShowTree({lodding:true});
					//加载树
					privilege.method.privilegeTreeFun.loadTree();
					return false;
					});
				}
			});
			
			$("#savePrivilege").unbind("click");
			$("#savePrivilege").bind("click",function(){
				privilege.method.privilegeTreeFun.savePrivilege();
			});
		}
	},
	method:{
		
		divFun:{
			showDiv:function(){
				$("div:hidden").show();
			},
		},
		roleFun:{
			assignRole:function(me){
				privilege.data.role.name = $(me).parent().siblings("td:first").text();
				privilege.data.role.rid  = $(me).parent().siblings("input[type='hidden']").val();
			},
			showRoleName:function(){
				$("#roleImage").text("当前角色："+privilege.data.role.name);
			}
		},
		privilegeTreeFun:{
			zTreePlugin:'',
			setting: {
				isSimpleData: true,
				treeNodeKey: "id",
				treeNodeParentKey: "pid",
				showLine: true,
				checkable: true,
				root: {
					isRoot: true,
					nodes: []
				}
			},
			
			switchWaitingAndShowTree:function(switchJSON){
				if(switchJSON.loading){//说明角色树还没有加载完毕
					$("#loading").show();
					$("#privilegeTree").hide();
				}else{
					$("#loading").hide();
					$("#privilegeTree").show();
				}
			},
			loadTree:function(){
				
				$.post("privilegeAction_findPrivilegeByid.action",
				{rid:privilege.data.role.rid},
				function(data){
					privilege.method.privilegeTreeFun.zTreePlugin = $("#privilegeTree").zTree(privilege.method.privilegeTreeFun.setting,data);
					//privilege.method.privilegeTreeFun.zTreePlugin.expandAll(true);
					//把加载图片隐藏  显示树
					privilege.method.privilegeTreeFun.switchWaitingAndShowTree({lodding:false});
				}
				)
			},
			savePrivilege:function(){
				var checkedNodes = privilege.method.privilegeTreeFun.zTreePlugin.getCheckedNodes(true);
				var checkedStr = "";
				for(var i=0;i<checkedNodes.length;i++){
					if(i==checkedNodes.length-1){
						checkedStr = checkedStr + checkedNodes[i].id;
					}else{
						checkedStr = checkedStr + checkedNodes[i].id+",";
					}
				}
				var parameter = {
					rid:privilege.data.role.rid,
					checkedids:checkedStr
				};
				$.post("privilegeAction_savePrivilege",parameter,function(data){
					alert("操作成功");
				});		
			}
			
		}
		
	},
	
	
	
	data:{
		role:{
			rid:'',
			name:''
		}
	}
	
}

$().ready(function(){
	privilege.event.initEvent();
	
});
