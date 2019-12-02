$(function(){
  $("#itemForm").validate({
    rules : {
      "item[name]": {
        required: true
      }
    },
    messages: {
      "item[name]": {
        required: "商品名を入力してください"
      }
    }
  });
});