
$(document).on('turbolinks:load', function() {
  $(function(){
    
    // プレビューHTML
    function previewImage(imageUrl){
      let previewHtml = 
      `<li class="item-uploaded" id="item-uploaded" >
        <img class="item-uploaded__img" as="image" src=${imageUrl}>
        <a class='item-uploaded__delete' href=''>削除</a>
      </li>`
      return previewHtml
    }
    let first_images = $('.item-uploaded:visible').length; // 初期で表示されている画像の枚数をカウント

    if (first_images == 10){ //写真が10枚の時はファイルフィールドを隠す
      $('.upload-area').hide(); 
    } else if ( first_images == 0 || first_images == 5 ) {
      $('.upload-area').css('width', '100%');
    } else if ( first_images == 1 || first_images == 6 ) {
      $('.upload-area').css('width', '78%');
    } else if ( first_images == 2 || first_images == 7 ) {
      $('.upload-area').css('width', '58%');
    } else if ( first_images == 3 || first_images == 8 ) {
      $('.upload-area').css('width', '38%');
    } else if ( first_images == 4 || first_images == 9 ) {
      $('.upload-area').css('width', '18%');
    } else {
      $('.upload-area').css('width', '100%');
    }


    // プレビュー画像にあわせてinputフィールドのサイズを変更
    $('.item-image-list').change(function(e){
      let files = e.target.files;
      let alreadyImages = $('.item-uploaded:visible').length;
      let countImages = alreadyImages+files.length

      if ( countImages == 0 || countImages == 5 ) {
        $('.upload-area').css('width', '100%');
      } else if ( countImages == 1 || countImages == 6 ) {
        $('.upload-area').css('width', '78%');
      } else if ( countImages == 2 || countImages == 7 ) {
        $('.upload-area').css('width', '58%');
      } else if ( countImages == 3 || countImages == 8 ) {
        $('.upload-area').css('width', '38%');
      } else if ( countImages == 4 || countImages == 9 ) {
        $('.upload-area').css('width', '18%');
      } else {
        $('.upload-area').css('width', '100%');
      }
    });

    $('.item-image-list').change(function(e){
      e.preventDefault();
      let files = e.target.files;
      let alreadyImages = $('.item-uploaded:visible').length;
      let countImages = alreadyImages+files.length;
      const MAX_SIZE = 114;
      let canvasList = new Array()

      $('#item_images').clone().appendTo('.input-image-box').hide();

      if (countImages > 10) {
        alert("画像のアップロードは10個までです");

      }else if(countImages <= 10) {

        for ( var i=0; i<files.length; i++) {
          let image = new Image();
          let reader = new FileReader();
          let file = files[i];
      
          let canvas = document.createElement('canvas')
      
          reader.onload = function (e) {
            let imageUrl = e.target.result;
            $('.upload-area').before(previewImage(imageUrl));

            image.onload = function () {
              let width,
                height;
      
              if (image.width > image.height) {
                // 横長の画像は横のサイズを指定値にあわせる
                let ratio = image.height / image.width;
                width = MAX_SIZE;
                height = MAX_SIZE * ratio;
                marginTop = (MAX_SIZE - height) / 2

              } else {
                // 縦長の画像は縦のサイズを指定値にあわせる
                let ratio = image.width / image.height;
                width = MAX_SIZE * ratio;
                height = MAX_SIZE;
                marginLeft = (MAX_SIZE - width) / 2
              }

              canvas.setAttribute('width', MAX_SIZE)
              canvas.setAttribute('height', MAX_SIZE)
              console.log($.toBlob(canvas));
              canvasList.push(canvas)
              
            }
            image.src = imageUrl
          }
          reader.readAsDataURL(file);
        }

        
        if (countImages == 10){
        $('.upload-area').hide(); 
        }
        
      }else {
        alert("商品画像を登録してください");
      }
    });

        //一括削除ボタン
        $('#allDelete').on('click', function(){
          $('#new_item').find('input[type="file"]').val("");
          $('.item-image-list').children('li').hide();
          $('.upload-area').css('width', '100%');
        })

        //写真の削除ボタンが押された時
        $('.item-image-list').on('click', '.item-uploaded__delete', function(e){
          e.preventDefault();
          //削除ボタンの押された写真の表示を消す
          $(this).parent().hide();
          //表示されている写真の合計枚数を数え、ファイルフィールドを復活させる
          afterImages = $('.item-uploaded:visible').length;
          if (afterImages < 10){
            $('.upload-area').show();
          } //表示されている写真の合計枚数を数え、inputフィールドのサイズを変更する

          if ( afterImages == 0 || afterImages == 5 ) {
            $('.upload-area').css('width', '100%');
          } else if ( afterImages == 1 || afterImages == 6 ) {
            $('.upload-area').css('width', '78%');
          } else if ( afterImages == 2 || afterImages == 7 ) {
            $('.upload-area').css('width', '58%');
          } else if ( afterImages == 3 || afterImages == 8 ) {
            $('.upload-area').css('width', '38%');
          } else if ( afterImages == 4 || afterImages == 9 ) {
            $('.upload-area').css('width', '18%');
          } else {
            $('.upload-area').css('width', '100%');
          }
        });

        //新規ページの送信ボタンが押された時
        $('#new-send-btn').on('click', function(e){
          e.preventDefault();
          //初期クローンを削除する
          $('#item_images').eq(-1).remove();
          $('#new_item').submit();
        });

        //編集ページの送信ボタンが押された時
        $('#edit-send-btn').on('click', function(e){
          e.preventDefault();
          $('#item_images').eq(-1).remove();
          //削除ボタンが押された写真のidを取得する
          let deletePhotoIds = [];
          $('.item-uploaded:hidden').each(function(){
            deletePhotoIds.push($(this).data('image'));
          });

          $("#imageDelete").append(
            $('<input type="hidden" name="delete_images">').val(deletePhotoIds)
          ); 
          $('#new_item').submit();
        });
  });
});
