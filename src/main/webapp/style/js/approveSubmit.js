$().ready(function(){
	
	$("#agree").click(function(){
		$("#form").attr("action","workflowAction_approve.action?op=agree");
	});
	$("#disagree").click(function(){
		$("#form").attr("action","workflowAction_approve.action?op=disagree");
	});
	
});