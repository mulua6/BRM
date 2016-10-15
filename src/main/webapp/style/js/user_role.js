/**
 * 设置角色
 * 		 
 * 	 2.3.1.1  显示隐藏的div
	 2.3.1.2  动态显示用户名称
	 2.3.1.3  加载角色树
	 2.3.1.4  全选复选框的功能
	 2.3.1.5  角色树本身的复选框的规则
	 2.3.1.6  保存操作：建立用户和角色的关系
	 2.3.1.7  角色树的回显
 */

var role = {
	
	/**
	 * 所有的对事件的初始化全部放在该函数中
	 */
	event:{
		initEvent:function(){
			$("a").each(function (){
				if($(this).text() =="设置角色"){
					$(this).unbind("click");
					$(this).bind("click",function(){
						//显示div
						role.roleFun.divFun.showDiv();
						//给用户赋值
						role.roleFun.userFun.assignUser(this);
						//动态显示用户名称
						role.roleFun.userFun.showUser();
						//在显示出来角色树之前,有一个等待的效果
						role.roleFun.roleTreeFun.switchWaitingAndShowTree({
							loading:true
						});
						//显示角色树
						role.roleFun.roleTreeFun.loadRoleTree();
                        return false;
					});
					
					
				}
				
			});
			//全选复选框的事件
            $("#allchecked").unbind("change");
            $("#allchecked").bind("change", function(){
                alert("allchecked");
            });
            
            /**
             * 保存角色
             */
            $("#saveRole").unbind("click");
            $("#saveRole").bind("click", function(){
                alert("saleRole");
            });
		}
	},
	/**
	 * 数据的加载
	 */
	data:{
		user:{
			uid:'',
			username:''
		},
	},
	/**
     * 功能
     */
    roleFun:{
    	/**
         * div的功能
         */
        divFun: {
        	/**
             * 显示div
             */
            showDiv: function(){
                $("div:hidden").show();
            }
        },
        /**
         * 用户的功能
         */
        userFun: {
        	 /**
             * 动态显示用户
             */
        	showUser: function(){
        		$("#userImage").text("用户名："+role.data.user.username);
        	},
	        /**
	         * 给user赋值
	         */
        	assignUser: function(aObj){
        		role.data.user.username= $(aObj).parent().siblings("td:first").text();
        		role.data.user.uid = $(aObj).parent().siblings("input[type='hidden']").val();
        	}
        	
        },
        /**
         * 角色树的功能
         */
        roleTreeFun: {
        	setting: {
                isSimpleData: true,
                treeNodeKey: "rid",
                treeNodeParentKey: "pid",
                showLine: true,
				checkable:true,
                root: {
                    isRoot: true,
                    nodes: []
                }
            },
            /**
             * 加载角色树
             */
            loadRoleTree: function(){
            	$.post("roleJSONAction_showRoleTree.action",null,function(data){
					$("#roleTree").zTree(role.roleFun.roleTreeFun.setting,data);
					
					/**
					 * 把等待效果隐藏，显示树
					 */
					role.roleFun.roleTreeFun.switchWaitingAndShowTree({
						loading:false
					});
				});
            },
            /**
             * 保存功能
             */
            saveRole: function(){
            
            },
			/**
			 * 等待状态和显示树的状态的切换和全选复选框的状态的改变
			 */
			switchWaitingAndShowTree:function(switchJSON){
				if(switchJSON.loading){
					$("#loading").show();
					$("#roleTree").hide();
					
					$("#allchecked").attr("disabled","disabled");
				}else{
					$("#loading").hide();
					$("#roleTree").show();
					$("#allchecked").attr("disabled","");
				}
			}
            
        	
        	
        }
    }
	
};

$().ready(function(){
	role.event.initEvent();
});

