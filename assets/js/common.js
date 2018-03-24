/**
 * @author Kishor Mali
 */


jQuery(document).ready(function(){
	
	/*jQuery(document).on("click", ".deleteUser", function(){
		var userId = $(this).data("userid"),
			hitURL = baseURL + "deleteUser",
			currentRow = $(this);
		
		var confirmation = confirm("Are you sure to delete this ?");
		
		if(confirmation)
		{
			jQuery.ajax({
			type : "POST",
			dataType : "json",
			url : hitURL,
			data : { userId : userId } 
			}).done(function(data){
				console.log(data);
				currentRow.parents('tr').remove();
				if(data.status = true) {  }
				else if(data.status = false) { alert("Deletion failed"); }
				else { alert("Access denied..!"); }
			});
		}
	});*/
	
	
	jQuery(document).on("click", ".searchList", function(){
		
	});
	
});
