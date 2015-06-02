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
        if (data.error == true){
          window.alert("Error: " + data.errorText);
          $('.list').append('<div class="item">'+data.email+' generated an error</div>');
          $('.item:last-child').css('color', '#cc0000')
        }else{
          if (data.validity == true) {
            $('.list').append('<div class="item">'+data.email+' is real</div>');
            $('.item:last-child').css('color', '#00ff00')
          } else{
            $('.list').append('<div class="item">'+data.email+' is not real</div>');
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