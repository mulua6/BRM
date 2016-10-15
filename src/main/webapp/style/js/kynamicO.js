var kynamic = {
    /**
     * 给页面的元素追加事件
     */
    event: {
        initEvent: function(){
            /**
             * 给文件夹添加单击事件
             */
            $("#addFolder").unbind("click");
            $("#addFolder").bind("click", function(){
                kynamic.kynamicTree.addFolder();
            });
            
            /**
             * 给文件添加单击事件
             */
            $("#addFile").unbind("click");
            $("#addFile").bind("click", function(){
                kynamic.kynamicTree.addFile();
            });
            
            
            /**
             * 给节点添加修改单击事件
             */
            $("#updateNode").unbind("click");
            $("#updateNode").bind("click", function(){
                kynamic.kynamicTree.updateNode();
            });
            
            /**
             * 给节点添加删除单击事件
             */
            $("#deleteNode").unbind("click");
            $("#deleteNode").bind("click", function(){
                kynamic.kynamicTree.deleteNode();
            });
            
            /**
             * checkin事件
             */
            $("#checkin").unbind("click");
            $("#checkin").bind("click", function(){
                kynamic.version.checkin();
            });
            
            /**
             * checkout事件
             */
            $("#checkout").unbind("click");
            $("#checkout").bind("click", function(){
            
            });
        }
    },
    /**
     * 知识管理树的操作
     */
    kynamicTree: {
        kNode: '',
        /**
         * 加载知识管理树
         */
        loadKynamicTree: function(){
            $("#kynamicTree").dataTree({
                ajax: {
                    url: 'kynamicAction_showKynamicTree.action',
                    data: null
                },
                setting: {
                    treeNodeKey: 'kid',
                    keepParent: true,
                    callback: {
                        rightClick: function(event, treeId, treeNode){
                            //把当前点击的节点赋值给kNode
                            kynamic.kynamicTree.kNode = treeNode;
                            //获取当前的x和y坐标
                            var y = event.clientY;
                            var x = event.clientX;
                            if (treeNode.isParent) {//如果是文件夹节点
                                kynamic.kynamicTree.showRMenu({
                                    x: x,
                                    y: y,
                                    addFolder: true,
                                    addFile: true,
                                    updateNode: true,
                                    deleteNode: true
                                });
                            }
                            else {
                                kynamic.kynamicTree.showRMenu({
                                    x: x,
                                    y: y,
                                    addFolder: false,
                                    addFile: false,
                                    updateNode: true,
                                    deleteNode: true
                                });
                            }
                        },
                        /**
                         * 单击事件
                         */
                        click: function(event, treeId, treeNode){
                            /**
                             * 获取当前点击节点的ID值,从数据库中查找相应的版本信息
                             *    如果有版本信息,则显示版本信息列表
                             *    如果没有版本信息,则显示添加的div
                             */
                            //把当前点击的节点赋值给kNode
                            kynamic.kynamicTree.kNode = treeNode;
                            //显示所有的版本号
                            kynamic.version.showVersions();
                        }
                    }
                }
            });
        },
        /**
         * 显示右键菜单
         */
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
        },
        /**
         * 增加文件夹
         */
        addFolder: function(){
            kynamic.kynamicTree.addNode({
                isParent: true
            });
        },
        /**
         * 增加文件
         */
        addFile: function(){
            kynamic.kynamicTree.addNode({
                isParent: false
            });
        },
        /**
         * 增加节点
         */
        addNode: function(addJSON){
            /**
             * 1、弹出一个提示框，输入要添加的节点的名字
             * 2、获取当前点击的节点
             * 3、发出post请求，在kynamic表中插入一行数据
             * 4、获取从服务器返回到客户端的新节点的kid
             * 5、在js端新建一个节点，把新的节点追加到父节点上
             */
            var nodeName = window.prompt("请输入节点的名称");
            if (nodeName) {//该变量不等于null,也不等于""
                /**
                 * 判断nodeName是否已经存在，如果不存在，则添加，如果存在，则提示信息
                 */
                if (!window.zTreePlugin.getNodeByParam("name", nodeName)) {//不存在该节点
                    $.post("kynamicAction_saveKynamic.action", {
                        name: nodeName,
                        pid: kynamic.kynamicTree.kNode.kid,
                        isParent: addJSON.isParent
                    }, function(data){
                        /**
                         * 创建一个新的节点，把新的节点追加到当前节点上
                         */
                        var newNode = {
                            kid: data,
                            isParent: addJSON.isParent,
                            name: nodeName,
                            pid: kynamic.kynamicTree.kNode.kid
                        };
                        //把新的节点追加到父节点上
                        window.zTreePlugin.addNodes(kynamic.kynamicTree.kNode, newNode, true);
                    });
                }
                else {//提示
                    alert("不能添加，已经存在了");
                }
            }
        },
        /**
         * 修改节点
         */
        updateNode: function(){
            /**
             * 1、把要修改的节点的名称回显在弹出框中
             * 2、进行修改
             * 3、验证修改以后的名字是否有重复
             * 4、更新数据库中相应的值
             * 5、把节点的名称修改
             */
            var nodeName = window.prompt("请输入节点的名称", kynamic.kynamicTree.kNode.name);
            if (nodeName) {//nodeName必须有值
                if (!window.zTreePlugin.getNodeByParam("name", nodeName)) {//如果修改以后的值在树的名称是唯一的
                    //进行修改
                    $.post("kynamicAction_updateKynamic.action", {
                        kid: kynamic.kynamicTree.kNode.kid,
                        name: nodeName
                    }, function(data){
                        /**
                         * 把当前的名字修改一下
                         */
                        kynamic.kynamicTree.kNode.name = nodeName;
                        //把整个树刷新
                        window.zTreePlugin.refresh();
                    });
                }
                else {
                    alert("该名称已经被使用了");
                }
            }
        },
        /**
         * 删除
         */
        deleteNode: function(){
            /**
             * 判断当前的节点是否是文件节点
             *     如果是文件节点，则直接删除
             *     如果是文件夹节点，则判断该文件夹下是否有子节点
             *     		如果有，则提示不能删除
             *      	如果没有，直接删除
             */
            if (kynamic.kynamicTree.kNode.isParent) {//文件夹节点
                //判断该文件夹节点是否有子节点
                if (window.zTreePlugin.getNodeByParam("pid", kynamic.kynamicTree.kNode.kid)) {
                    alert("要删除的节点下有子节点，不能删除");
                }
                else {
                    $.post("kynamicAction_deleteNode.action", {
                        kid: kynamic.kynamicTree.kNode.kid
                    }, function(data){
                        window.zTreePlugin.removeNode(kynamic.kynamicTree.kNode);
                        //把整个树刷新
                        window.zTreePlugin.refresh();
                    });
                }
            }
            else {//文件节点
                $.post("kynamicAction_deleteNode.action", {
                    kid: kynamic.kynamicTree.kNode.kid
                }, function(data){
                    window.zTreePlugin.removeNode(kynamic.kynamicTree.kNode);
                    //把整个树刷新
                    window.zTreePlugin.refresh();
                });
            }
        }
    },
    /**
     * 版本的操作
     */
    version: {
        showVersions: function(){
            $.post("versionAction_showVersions.action", {
                kid: kynamic.kynamicTree.kNode.kid
            }, function(data){
                if (data.length == 0) {//没有版本号
                    /**
                     * 显示元素
                     */
                    kynamic.version.controlDIVAndCheck({
                        addVersion: true,
                        versionList: false,
                        checkin: true,
                        checkout: false
                    });
                }
                else {//说明有版本号
                    /**
                     * 显示元素
                     */
                    kynamic.version.controlDIVAndCheck({
                        addVersion: false,
                        versionList: true,
                        checkin: true,
                        checkout: false
                    });
                    
                    /**
                     * 把所有的版本的信息全部显示出来
                     */
                    //遍历所有的版本的信息
                    /**
                     * 把table下的html内容清空
                     */
                    $("#versionTable").empty();
                    for (var i = 0; i < data.length; i++) {
                        /**
                         * <tr>
                         <td width="232" height="26" align="center" valign="middle" bgcolor="#FFFFFF" style="border-bottom:1px solid #f3f8fd;">1</td>
                         <td width="232" align="center" valign="middle" bgcolor="#FFFFFF" style="border-bottom:1px solid #f3f8fd;">2010-5-24 09:56:33</td>
                         <td width="232" align="center" valign="middle" bgcolor="#FFFFFF" style="border-bottom:1px solid #f3f8fd;">删除</td>
                         </tr>
                         */
						//在for循环中声明变量只有一个
//                        (function(){
//                            var version = data[i].version;
//                            var updatetime = data[i].updatetime;
//                            
//                            //$("<a/>")利用jquery的方式创建一个超级链接
//                            var $aVersion = $("<a/>");
//							$aVersion.css("cursor","pointer");
//                            $aVersion.text(version);
//                            
//                            /**
//                             * 给列表的版本添加单击事件
//                             */
//                            $aVersion.unbind("click");
//                            $aVersion.bind("click", function(){
//                                alert(version);
//                            });
//                            
//                            var $aTD = $("<td/>");
//                            $aTD.attr("width", "232");
//                            $aTD.attr("align", "center");
//                            $aTD.attr("valign", "middle");
//                            $aTD.attr("bgcolor", "#FFFFFF");
//                            $aTD.attr("style", "border-bottom:1px solid #f3f8fd;");
//                            
//                            $aTD.append($aVersion);//<td><a>${version}</a></td>
//                            var $updatetimeTD = $("<td/>");
//                            $updatetimeTD.attr("width", "232");
//                            $updatetimeTD.attr("align", "center");
//                            $updatetimeTD.attr("valign", "middle");
//                            $updatetimeTD.attr("bgcolor", "#FFFFFF");
//                            $updatetimeTD.attr("style", "border-bottom:1px solid #f3f8fd;");
//                            
//                            $updatetimeTD.text(updatetime);//<td>${updatetime}</td>
//                            var $aDEL = $("<a/>");
//                            $aDEL.text("删除");
//                            var $delTD = $("<td/>");
//                            $delTD.attr("width", "232");
//                            $delTD.attr("align", "center");
//                            $delTD.attr("valign", "middle");
//                            $delTD.attr("bgcolor", "#FFFFFF");
//                            $delTD.attr("style", "border-bottom:1px solid #f3f8fd;");
//                            $delTD.append($aDEL);//<td><a>删除</a></td>
//                            var $tr = $("<tr/>");
//                            $tr.append($aTD);
//                            $tr.append($updatetimeTD);
//                            $tr.append($delTD);
//                            
//                            $("#versionTable").append($tr);
//                        })();
							var version = data[i].version;
                            var updatetime = data[i].updatetime;
                            
                            //$("<a/>")利用jquery的方式创建一个超级链接
                            var $aVersion = $("<a/>");
							$aVersion.css("cursor","pointer");
                            $aVersion.text(version);
							$aVersion.data("version",version);
                            
                            /**
                             * 给列表的版本添加单击事件
                             */
                            $aVersion.unbind("click");
                            $aVersion.bind("click", function(){
                                alert($(this).data("version"));
                            });
                            
                            var $aTD = $("<td/>");
                            $aTD.attr("width", "232");
                            $aTD.attr("align", "center");
                            $aTD.attr("valign", "middle");
                            $aTD.attr("bgcolor", "#FFFFFF");
                            $aTD.attr("style", "border-bottom:1px solid #f3f8fd;");
                            
                            $aTD.append($aVersion);//<td><a>${version}</a></td>
                            var $updatetimeTD = $("<td/>");
                            $updatetimeTD.attr("width", "232");
                            $updatetimeTD.attr("align", "center");
                            $updatetimeTD.attr("valign", "middle");
                            $updatetimeTD.attr("bgcolor", "#FFFFFF");
                            $updatetimeTD.attr("style", "border-bottom:1px solid #f3f8fd;");
                            
                            $updatetimeTD.text(updatetime);//<td>${updatetime}</td>
                            var $aDEL = $("<a/>");
                            $aDEL.text("删除");
                            var $delTD = $("<td/>");
                            $delTD.attr("width", "232");
                            $delTD.attr("align", "center");
                            $delTD.attr("valign", "middle");
                            $delTD.attr("bgcolor", "#FFFFFF");
                            $delTD.attr("style", "border-bottom:1px solid #f3f8fd;");
                            $delTD.append($aDEL);//<td><a>删除</a></td>
                            var $tr = $("<tr/>");
                            $tr.append($aTD);
                            $tr.append($updatetimeTD);
                            $tr.append($delTD);
                            
                            $("#versionTable").append($tr);
                        
                    }
                }
            });
        },
        /**
         * 控制div和checkin,checkout的显示
         */
        controlDIVAndCheck: function(json){
            if (json.addVersion) {
                $("#addVersion").show();
            }
            else {
                $("#addVersion").hide();
            }
            if (json.versionList) {
                $("#versionList").show();
            }
            else {
                $("#versionList").hide();
            }
            if (json.checkin) {
                $("#checkin").show();
            }
            else {
                $("#checkin").hide();
            }
            if (json.checkout) {
                $("#checkout").show();
            }
            else {
                $("#checkout").hide();
            }
        },
        /**
         * checkin
         */
        checkin: function(){
            /**
             * 从js端传递到后台的数据有
             *    title
             *    content
             *    flag
             *    kid
             */
            var parameter = {
                title: $("input[name='title']").val(),
                content: $("textarea[name='content']").val(),
                flag: '1',
                kid: kynamic.kynamicTree.kNode.kid
            };
            $.post("versionAction_checkin.action", parameter, function(data){
                alert(data);
            });
        },
        /**
         * checkout
         */
        checkout: function(){
        
        }
		
		
		/**
		 * 作业：
		 *    1、checkout:
		 *       把数据库的version表的flag由1变成2
		 *    2、当点击某一个版本号的时候，应该显示具体的该版本的title和content信息
		 *       如果flag='1' title和content是不可编辑的
		 *       如果flag="2"  title和 content是可编辑的
		 *    3、删除某一个版本号
		 */
    }
};
$().ready(function(){
    /**
     * 声明右键事件
     */
    kynamic.event.initEvent();
    
    kynamic.kynamicTree.loadKynamicTree();
    
    $("#rMenu").hover(function(){//当鼠标移进该区域时做的事情
    }, function(){//当鼠标移出该区域时做的事情
        $("#rMenu").hide();//隐藏右键菜单
    });
});
