(function($){
	$.muluaConfirm = function(){
	
		$.each($("a"), function(){
			
			if($(this).text()=="删除"){
				$(this).click(function(){
					if(window.confirm("您确认要删除吗?")){
						return true;
					}else{
						return false;
					}
				});
			}
			
		});
	}		
})($);
