$(document).on('turbolinks:load', function() {
  $(function(){
    $("#itemForm").validate({
      rules : {

        "item[name]": {
          required: true,
          maxlength: 40
        },
        "item[description]": {
          required: true,
          maxlength: 1000
        },
        "item[category_id]": {
          min: 1
        },
        "item[size_id]": {
          min: 1
        },
        "item[condition]": {
          min: 1
        },
        "item[delivery_attributes][delivery_cost]": {
          min: 1
        },
        "item[delivery_attributes][delivery_ways]": {
          min: 1
        },
        "item[delivery_attributes][delivery_days]": {
          min: 1
        },
        "item[price]": {
          required: true,
          range: [300, 9999999],
          digits: true
        }
      },
      messages: {

        "item[name]": {
          required: "商品名を入力してください",
          maxlength: "40文字以下で入力してください"
        },
        "item[description]": {
          required: "商品説明を入力してください",
          maxlength: "1000文字以下で入力してください"
        },
        "item[category_id]": {
          min: "カテゴリーを選択してください"
        },
        "item[size_id]": {
          min: "サイズを選択してください"
        },
        "item[condition]": {
          min: "商品の状態を選択してください"
        },
        "item[delivery_attributes][delivery_cost]": {
          min: "配送料の負担を選択してください"
        },
        "item[delivery_attributes][delivery_ways]": {
          min: "発送元の地域を選択してください"
        },
        "item[delivery_attributes][delivery_days]": {
          min: "配達までの日数を選択してください"
        },
        "item[price]": {
          required: "価格を入力してください",
          range: "300円以上9999999円以下で入力してください",
          digits: "整数で入力してください"
        }
      }
    });
  });
});