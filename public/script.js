$(document).ready(function(){
	$('#button').click(function(){
		var myEmail = $('input[name=checkListItem]').val();
		$.ajax({
			dataType: 'json',
			url: '/api/validate.json',
			type: "POST",
			data: {email: myEmail},
			success: function(data){
				debugger;
				if (data.validFormat == false){
					window.alert("Email Address: " + data.email+" is not in a valid format.\n\n\nPlease submit address in following format:\n\nrealname@realdomain.com");
				}else{
					if (data.validity == true) {
						$('.list').append('<div class="item">'+data.email+' is valid</div>');
						$('.item:last-child').css('color', '#00ff00')
					} else{
						$('.list').append('<div class="item">'+data.email+' is not valid</div>');
						$('.item:last-child').css('color', '#cc0000')
					};
				};
			},
			error: function(jqXHR, textStatus, errorThrown){
				debugger
				window.alert('Error '+ jqXHR.status +': ' + jqXHR.statusText)
			}
		});
	});
});