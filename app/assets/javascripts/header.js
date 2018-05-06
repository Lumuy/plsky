function ajaxPost(){
  $.ajax({
    url: '/sms_verify',
    type: "POST",
    data: {
      "sms_verification": {
        "phone_number": $("#sms-phnum").val(),
      }
    },
    dataType: 'json',
    success: function(data){
      $('.signupbox').before('\
      <div class="alert alert-secondary alert-dismissible fade show" role="alert">\
        验证码发送成功\
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
          <span aria-hidden="true">&times;</span>\
        </button>\
      </div>');
    },
    error: function(data){
      $('.signupbox').before('\
      <div class="alert alert-secondary alert-dismissible fade show" role="alert">\
        验证码发送失败\
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">\
          <span aria-hidden="true">&times;</span>\
        </button>\
      </div>');
    }
  });
};

$(document).on('turbolinks:load', function(){
  $('#sms-verify').on('click', function(){
    var reg = /^\d{11}$/,
        pno = $("#sms-phnum").val();

    var diff,
        duration = 60,
        start = Date.now();

    if(reg.test(pno)){
      ajaxPost();
      function timer() {
        diff = duration - (((Date.now() - start) / 1000) | 0);
        if(diff > 0) {
          $('#sms-verify').text('需等待'+diff+'秒');
        } else if (diff == 0) {
          $('#sms-verify').prop('disabled', false);
          $('#sms-verify').text('获取验证码');
        };
      }
      $('#sms-verify').prop('disabled', true);
      t = setInterval(timer, 1000);
      setTimeout('clearInterval(t)', 60000);
    } else {
      $('#err-msg').append('<li>无效的手机号码</li>');
    };

  });
});
