$(document).ready(function(){
  $("#sms-verify").on('click', function(event){
    event.preventDefault();
    $.ajax({
      dataType: 'json',
      type: "POST",
      url: '/sms_verify',
      data: {
        "sms_verification": {
          "phone_number": $("#sms-phnum").val(),
        }
      },
      success: function(data){
        alert('success');
      },
      error: function(data){
        alert('failed');
      }
    });
  });
});
