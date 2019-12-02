$(function() {
  $('form').on('submit', function(e) {
    $("#new_user").validate({
      rules : {
        "user[name]": {
          required: true
         }
      },
		  messages: {
        "user[name]":{
						required: "必須項目です。入力をお願いします。"
         }
        }
    });
    console.log('送信ボタンが押されました');
    e.preventDefault();
  });
});