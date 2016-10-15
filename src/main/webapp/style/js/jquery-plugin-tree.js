(function($){
	/**
	 * {
			ajax:{
				url:'menuitemAction_showAllMenuitem.action',
				data:null
			},
			setting:{
				treeNodeKey: "mid"
			}
		}
	 * @param {Object} config
	 */
	$.fn.dataTree = function(config){
		//me就是树的容器
		var me = this;
		window.zTreePlugin;//给window对象动态添加了一个属性
		var param = {
			setting:{}
		};
		/**
		 * 如果defauts.setting中和config.setting中有相同的选项，后者覆盖前者
		 * 然后把覆盖后的结果赋值到param.setting中
		 */
		$.extend(param.setting,$(this).dataTree.defaults.setting,config.setting);
		/**
		 * 第一个参数为url
		 * 第二个参数为data
		 * 第三个是回调函数
		 */
		$.post(config.ajax.url,config.ajax.data,function(data){
			/**
			 * 创建树
			 */
			window.zTreePlugin =  me.zTree(param.setting,data);
		});
	}
	$.fn.dataTree.defaults = {
		setting: {
            isSimpleData: true,
            treeNodeKey: "id",
            treeNodeParentKey: "pid",
            showLine: true,
            root: {
                isRoot: true,
                nodes: []
            }
        }
	};
})($);

