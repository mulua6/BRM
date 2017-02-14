/**
 * Created by liuhe on 2017/1/16.
 */




/*book*/
function bookAdd() {
    $("#bookAdd").dialog({

        title: '添加图书',
        width: 300,
        height: 200,
        closed: false,
        cache: false,
        modal: true,
        buttons:'#book_add_bt'


    });
}

function bookEdit() {

    $("#bookEdit").dialog({

        title: '编辑图书',
        width: 300,
        height: 200,
        closed: false,
        cache: false,
        modal: true,
        buttons:'#book_edit_bt'


    });

    var book = $("#bookList").datagrid("getSelected");
    $("#bookEditForm").form("load",book);
}

function bookDelete() {

    $.messager.confirm("确定删除","确定删除吗？",function (dt) {

        if (dt){

            var book = $("#bookList").datagrid("getSelected");
            //TODO delete item
            $.messager.alert("提示","删除成功","info");
        }else{
        }
    })

}

/*reader*/
function readerAdd() {
    $("#readerAdd").dialog({

        title: '添加读者',
        width: 300,
        height: 200,
        closed: false,
        cache: false,
        modal: true,
        buttons:'#reader_add_bt'


    });
}

function readerEdit() {

    $("#readerEdit").dialog({

        title: '编辑读者',
        width: 300,
        height: 200,
        closed: false,
        cache: false,
        modal: true,
        buttons:'#reader_edit_bt'


    });

    var reader = $("#readerList").datagrid("getSelected");
    $("#readerEditForm").form("load",reader);
}

function readerDelete() {

    $.messager.confirm("确定删除","确定删除吗？",function (dt) {

        if (dt){

            var reader = $("#readerList").datagrid("getSelected");
            //TODO delete item
            $.messager.alert("提示","删除成功","info");
        }else{
        }
    })

}


/*----------borrow--return----------*/



function bookReturn() {

    //TODO add return book

    $.messager.alert("状态","归还成功","info");

    
}



/*--------------common-------------*/
function closeWin(dialogName) {
   $("#"+dialogName).dialog("close");
}



//修改前判断是否有选中的行数据
function getSelected(listNameId) {

    var selected = $("#"+listNameId).datagrid("getSelected");

    if(selected==null){
        $.messager.alert("提示","请选择要编辑的选项","error");
        return undefined;
    }else {
        return selected;
    }

}

//重新加载datagrid的数据
function reloadList(listNameId) {
    $("#"+listNameId).datagrid("reload");
}


