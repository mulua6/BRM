(function($){
	/**
	 * dataTree:
	 *    1、传进来一个config,就可以创建树
	 *         创建树有两种方案
	 *            config.allLoad  true
	 *                1、一次性创建树
	 *            config.allLoad  false
	 *                2、点击事件创建树
	 *         传递进来一些参数，改变setting中的一些值
	 *            config.setting
	 */
	/**
	 * 插件方法
	 * @param {Object} config
	 */
    $.fn.dataTree = function(config){
		var me = this;
		var param =  {
			treePlugin:'',
			treeObj:me,
			url:'',
			data:'',
			setting:{
				
			},
			callback:'',
			allLoad:true
		};
		/**
		 * 如果json结构是一个比较复杂的结构，则必须深度进行复制,extend函数的第一个参数为true
		 */
		$.extend(true,param,$(this).dataTree.defaults,config);
		
		//把param缓存在树的容器中
		me.data("param",param);
		
		if(param.allLoad){//一次性全部加载树
			$.fn.dataTree.method.loadAllNode(param);
		}else{//点击事件加载树
			$.fn.dataTree.method.loadSubNode(param);
		}
    }
	/**
	 * 默认的配置
	 */
    $.fn.dataTree.defaults = {
        setting: {
            isSimpleData: true,
            treeNodeKey: "id",
            treeNodeParentKey: "pid",
            showLine: true,
            root: {
                isRoot: true,
                nodes: []
            },
			callback:{
				expand:function(event, treeId, treeNode){
					/**
					 * 从树的容器中获取配置信息
					 */
					var param = $("#"+treeId).data("param");
					/**
					 * 把配置信息的data中的pid修改成当前的值
					 */
					param.data.pid = treeNode.mid;
					
					$.fn.dataTree.method.loadSubNode(param,treeNode);
				}
			}
        },
		//默认情况为一次性全部创建树
		allLoad:true
    };
	
	/**
	 * 关于树的所有的方法都在这里
	 */
	/**
	 * 关于插件内部调用的方法
	 * @param {Object} config
	 */
	$.fn.dataTree.method = {
		/**
		 * 一次性加载所有的节点
		 * @param {Object} config
		 */
		loadAllNode:function(config){
			/**
			 * 这是一个回调函数
			 * @param {Object} data
			 */
			config.callback = function(data){
				//处理的内容是一次性生成树
				$(config.treeObj).zTree(config.setting,data);
			}
			$.fn.dataTree.method.loadData(config);
		},
		/**
		 * 提交ajax请求，加载数据
		 */
		loadData:function(config){
			$.post(config.url,null,function(data){
				config.callback(data);
			});
		},
		/**
		 * 点击事件加载树
		 */
		loadSubNode:function(config,treeNode){
			if(config.data.pid==0){//说明要加载根节点
				config.callback = function(data){
					//加载根节点的需求就是创建树
					config.treePlugin = $(config.treeObj).zTree(config.setting,data);
				}
				$.fn.dataTree.method.loadData(config);
			}else{//给父节点追加子节点
				config.callback = function(data){
					/**
					 * 把子节点追加到父节点上
					 */
					 if (!config.treePlugin.getNodeByParam("pid", treeNode.mid)) {//如果点击的节点下不存在子节点
						 config.treePlugin.addNodes(treeNode, data, true);
					 }
				}
				$.fn.dataTree.method.loadData(config);
			}
		}
	};
})($);

$().ready(function(){
//	$("#tree").dataTree({
//		url:'menuitemAction_showAllMenuitem.action',
//		data:null,
//		setting:{
//			treeNodeKey:'mid'
//		},
//		allLoad:true
//	});
	$("#tree").dataTree({
		url:'privilegeAction_showAllMenuitems.action',
		data:{
			pid:0
		},
		setting:{
			treeNodeKey:'id'
		},
		allLoad:true
	});
});
