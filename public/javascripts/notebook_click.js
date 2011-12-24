$(function() {
	
	$(".notebook-link").click(function() {
		var id = this.getAttribute("data");
		$("#notes-list").html(id);
	});
	
});