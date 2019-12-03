$(document).on('turbolinks:load', function() {
  $(function(){
    $("#new_user").validate({
      rules : {
        "user[name]": {
          required: true,
          maxlength: 20
        },
        "user[email]": {
          required: true,
          email: true
        },
        "user[password]": {
          required: true,
          rangelength: [7,128]
        },
        "user[family_name_kanji]": {
          required: true,
          maxlength: 20
        },
        "user[first_name_kanji]": {
          required: true,
          maxlength: 20
        },
        "user[family_name_kana]": {
          required: true,
          maxlength: 20
        },
        "user[first_name_kana]": {
          required: true,
          maxlength: 20
        },
        "birthday[birthday(1i)]": {
          required: true
        },
        "birthday[birthday(2i)]": {
          required: true
        },
        "birthday[birthday(3i)]": {
          required: true
        },
        "user[phone_number]": {
          required: true,
          digits: true
        },
        "user[address_attributes][zip_code]": {
          required: true,
          digits: true,
          maxlength: 7,
          minlength: 7
        },
        "user[address_attributes][prefecture_id]": {
          required: true,
          min: 1,
          max: 47
        },
        "user[address_attributes][city]": {
          required: true
        },
        "user[address_attributes][house_number]": {
          required: true
        }
      },
      messages: {
        "user[name]": {
          required: "ニックネームを入力してください",
          maxlength: "20文字以内で入力してください"
        },
        "user[email]": {
          required: "メールアドレスを入力してください",
          email: "無効なメールアドレスです"
        },
        "user[password]": {
          required: "パスワードを入力してください",
          rangelength: "7文字以上128文字以内で入力してください"
        },
        "user[family_name_kanji]": {
          required: "姓を入力してください",
          maxlength: "20文字以内で入力してください"
        },
        "user[first_name_kanji]": {
          required: "名を入力してください",
          maxlength: "20文字以内で入力してください"
        },
        "user[family_name_kana]": {
          required: "セイを入力してください",
          maxlength: "20文字以内で入力してください"
        },
        "user[first_name_kana]": {
          required: "メイを入力してください",
          maxlength: "20文字以内で入力してください"
        },
        "birthday[birthday(1i)]": {
          required: "未入力(年)"
        },
        "birthday[birthday(2i)]": {
          required: "未入力(月)"
        },
        "birthday[birthday(3i)]": {
          required: "未入力(日)"
        },
        "user[phone_number]": {
          required: "電話番号を入力してください",
          digits: "半角の数字で入力してください"
        },
        "user[address_attributes][zip_code]": {
          required: "郵便番号を入力してください",
          digits: "-(ハイフン)抜きの半角数字で入力してください",
          maxlength: "郵便番号(7文字)を入力してください",
          minlength: "郵便番号(7文字)を入力してください"
        },
        "user[address_attributes][prefecture_id]": {
          required: "都道府県名を選択してください",
          min: "都道府県名を選択してください",
          max: "未定は入力できません"
        },
        "user[address_attributes][city]": {
          required: "市区町村名を入力してください"
        },
        "user[address_attributes][house_number]": {
          required: "番地を入力してください"
        }
      }
    });
  });
});