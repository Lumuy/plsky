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

function imgCapPost() {
  $.ajax({
    url: '/registration/img_verify',
    type: "POST",
    data: {
      "_rucaptcha": $('#img-cap-content').val(),
    },
    dataType: 'json',
    success: function(data){
      $('#sms-verify').prop('disabled', false);
    },
    error: function(data){
    }
  });
};

$(document).on('turbolinks:load', function(){
  // 图片码自动检验
  $('#img-cap-content').on('change',function(){
    imgCapPost();
  });

  // 发送验证码
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

  // 刷新图片码
  $('.rucaptcha_image_box').on('click', function(){
    img = $('.rucaptcha_image_box').find('img:first');
    currentSrc = img.attr('src');
    img.attr(currentSrc.split('?')[0] + '?' + (new Date()).getTime());
  });
});
