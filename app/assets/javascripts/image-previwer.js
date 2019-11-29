// $(document).on('turbolinks:load', function() {
//   $(function(){
//     function buildImageContent(image, image_id){
//       var html =`<li class='item-uploaded'>
//                   <figure class='item-uploaded__image'>
//                     <img src="${image.src}" >
//                   </figure>
//                   <div class='controlle-btns'>
//                     <input type="hidden" name="item[images][]" value="${image_id}" style="display: none;" class="item-images-input">
//                     <a class='controlle-btns__edit' href=''>編集</a>
//                     <input type="file" name="edit-image[]" style="display: none;" class="edit-image-file-input file-input">
//                     <a class='controlle-btns__delete' href=''>削除</a>
//                   </div>
//                 </li>`
//             return html;
//     }

//     $(document).on('change', '#item_images', function (e) {
//       var files = e.target.files;
//       var d = (new $.Deferred()).resolve();
//       $.each(files,function(i,file){
//         d = d.then(function() {
//           return Uploader.upload(file)})
//         .then(function(data){
//           return previewImage(file, data.image_id);
//         });
//       });
//       $('#item_images').val('');
//     });

//     $('.images-field').on('click','.btn-edit', function(e){
//       e.preventDefault();
//       $(this).parent().find('.edit-image-file-input').trigger("click");
//     });

//     $('.images-field').on('change','.edit-image-file-input', function(e){
//       var file = e.target.files[0];
//       var image_box = $(this).parent();
//       Uploader.upload(file).done(function(data){
//         replaceImage(file, data.image_id, image_box);
//       });
//     });
  
//     $('.images-field').on('click','.btn-delete', function(e){
//       e.preventDefault();
//       $(this).parent().remove();
//     });
  
//     var replaceImage = function(imageFile, image_id, element){
//       var reader = new FileReader();
//       var img = element.find('img');
//       var input = element.find('.item-images-input');
//       reader.onload = function(e){
//         input.attr({value: image_id});
//         img.attr("src", e.target.result);
//       };
//       reader.readAsDataURL(imageFile);
//     }

//     var previewImage = function(imageFile, image_id){
//       var reader = new FileReader();
//       var img = new Image();
//       var def =$.Deferred();
//       var $list = $(".item-image-list");
//       var insertHTML = '';

//       reader.onload = function(e){
//         img.src = e.target.result;
//         insertHTML = buildImageContent(img,image_id);
//         $list.append(insertHTML);
//         def.resolve(img);
//       };
//       reader.readAsDataURL(imageFile);
//       return def.promise();
//     }

//     var Uploader = {
//       upload: function(imageFile){
//         var def =$.Deferred();
//         var formData = new FormData();
//         formData.append('image', imageFile);
//         $.ajax({
//           type: "POST",
//           url: '/items/upload_image',
//           data: formData,
//           dataType: 'json',
//           processData: false,
//           contentType: false,
//           success: def.resolve
//         })
//         return def.promise();
//       }
//     }
//   })
// })
$(document).on('turbolinks:load', function() {
  $(function(){

    // プレビューHTML
    function previewImage(imageUrl){
      const previewHtml = 
      `<li class="sell-content__upload__wrap__preview__box" id="previewUpload-one">
      <img class="sell-content__upload__wrap__preview__img" as="image" src=${imageUrl}>
      </li>`
      return previewHtml
    }

    var first_images = $('.sell-content__upload__wrap__preview__box:visible').length; // 初期で表示されている画像の枚数をカウント
    if (first_images == 10){ //写真が10枚の時はファイルフィールドを隠す
      $('.sell-content__upload__wrap__box').hide(); 
    } else if ( first_images == 0 || first_images == 5 ) {
      $('.sell-content__upload__wrap__box').css('width', '100%');
    } else if ( first_images == 1 || first_images == 6 ) {
      $('.sell-content__upload__wrap__box').css('width', '79%');
    } else if ( first_images == 2 || first_images == 7 ) {
      $('.sell-content__upload__wrap__box').css('width', '59%');
    } else if ( first_images == 3 || first_images == 8 ) {
      $('.sell-content__upload__wrap__box').css('width', '39%');
    } else if ( first_images == 4 || first_images == 9 ) {
      $('.sell-content__upload__wrap__box').css('width', '19%');
    } else {
      $('.sell-content__upload__wrap__box').css('width', '100%');
    }


    // プレビュー画像にあわせてinputフィールドのサイズを変更
    $('#previewUpload').change(function(e){
      var files = e.target.files;
      var alreadyImages = $('.sell-content__upload__wrap__preview__box:visible').length;
      var countImages = alreadyImages+files.length
      if ( countImages == 0 || countImages == 5 ) {
        $('.sell-content__upload__wrap__box').css('width', '100%');
      } else if ( countImages == 1 || countImages == 6 ) {
        $('.sell-content__upload__wrap__box').css('width', '79%');
      } else if ( countImages == 2 || countImages == 7 ) {
        $('.sell-content__upload__wrap__box').css('width', '59%');
      } else if ( countImages == 3 || countImages == 8 ) {
        $('.sell-content__upload__wrap__box').css('width', '39%');
      } else if ( countImages == 4 || countImages == 9 ) {
        $('.sell-content__upload__wrap__box').css('width', '19%');
      } else {
        $('.sell-content__upload__wrap__box').css('width', '100%');
      }
    });

    $('#previewUpload').change(function(e){
      e.preventDefault();
      var files = e.target.files;
      var alreadyImages = $('.sell-content__upload__wrap__preview__box:visible').length;
      var countImages = alreadyImages+files.length
      $('#photo_upload').clone().appendTo('.input-image-box').hide()
      if (countImages > 10) {
          alert("画像のアップロードは10個までです");
          } else if (countImages == 10) {
          for (var i=0; i<files.length; i++) {
            const reader = new FileReader();  // ファイル読み込み
            reader.onload = function (e) {
            var imageUrl = e.target.result;   // URLを読み込み
            $('.sell-content__upload__wrap__box').before(previewImage(imageUrl))
            }
            reader.readAsDataURL(files[i]);};   // フォールバック処理
            $('.sell-content__upload__wrap__box').hide()
          } else if (countImages < 10) {
            for (var i=0; i<files.length; i++) {
              const reader = new FileReader();
              reader.onload = function (e) {
              var imageUrl = e.target.result;
              $('.sell-content__upload__wrap__box').before(previewImage(imageUrl))
              };
              reader.readAsDataURL(files[i]);
          };
        } else {
            alert("商品画像を登録してください");
        }
    });

        //一括削除ボタン
        $('#allDelete').on('click', function(){
          $('#new_item').find('input[type="file"]').val("");
          $('.sell-content__upload__wrap__preview').children('li').hide();
          $('.sell-content__upload__wrap__box').css('width', '100%');
        })

        //写真の削除ボタンが押された時
        $('#previewUpload').on('click', '#imageDelete', function(){
          //削除ボタンの押された写真の表示を消す
          $(this).parent().hide();
          //表示されている写真の合計枚数を数え、ファイルフィールドを復活させる
          afterImages = $('.sell-content__upload__wrap__preview__box:visible').length;
          if (afterImages < 10){
            $('.sell-content__upload__wrap__box').show();
          } //表示されている写真の合計枚数を数え、inputフィールドのサイズを変更する
          if ( afterImages == 0 || afterImages == 5 ) {
            $('.sell-content__upload__wrap__box').css('width', '100%');
          } else if ( afterImages == 1 || afterImages == 6 ) {
            $('.sell-content__upload__wrap__box').css('width', '79%');
          } else if ( afterImages == 2 || afterImages == 7 ) {
            $('.sell-content__upload__wrap__box').css('width', '59%');
          } else if ( afterImages == 3 || afterImages == 8 ) {
            $('.sell-content__upload__wrap__box').css('width', '39%');
          } else if ( afterImages == 4 || afterImages == 9 ) {
            $('.sell-content__upload__wrap__box').css('width', '19%');
          } else {
            $('.sell-content__upload__wrap__box').css('width', '100%');
          }
        });

        //新規ページの送信ボタンが押された時
        $('#new-send-btn').on('click', function(e){
          e.preventDefault();
          //初期クローンを削除する
          $('#photo_upload').eq(-1).remove();
          $('#new_item').submit();
        });

        //編集ページの送信ボタンが押された時
        $('#edit-send-btn').on('click', function(e){
          e.preventDefault();
          $('#photo_upload').eq(-1).remove();
          //削除ボタンが押された写真のidを取得する
          var deletePhotoIds = [];
          $('.sell-content__upload__wrap__preview__box:hidden').each(function(){
            deletePhotoIds.push($(this).data('image'));
          });
          $("#imageDelete").append(
            $('<input type="hidden" name="delete_images">').val(deletePhotoIds)
          ); 
          $('#new_item').submit();
        });

  });
});