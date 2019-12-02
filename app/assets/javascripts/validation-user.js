$(function() {
  $("#userForm").validate({
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
});