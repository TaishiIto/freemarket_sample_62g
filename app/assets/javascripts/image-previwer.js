$(function(){
  let nums = 0
  let dNums = 0 
  let deleteImages = []

  function previewImage(imageUrl){
    let previewHtml = 
    `<li class="item-uploaded" id="item-uploaded" >
      <img class="item-uploaded__img" as="image" src=${imageUrl}>
      <a class='item-uploaded__delete' data-delete=""  href=''>削除</a>
    </li>`
    return previewHtml
  }

  let first_images = $('.item-uploaded:visible').length; 
  if (first_images == 10){ 
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

    $('#item_images').clone().appendTo('.input-image-box').hide();
    if (countImages > 10) {
      alert("画像のアップロードは10個までです");
    }else if(countImages <= 10) {
      for ( var i=0; i<files.length; i++) {
        let reader = new FileReader();
        let file = files[i];

        reader.onload = function (e) {
          let imageUrl = e.target.result;
          $('.upload-area').before(previewImage(imageUrl));
          nums = $('.item-uploaded').length
          let newInput = $(`<input name="item[images][]" class="img-upload__field" data-nums="${nums}" type="file" id="item_images">`);
          $('.item-uploaded__delete:last').attr('data-delete', (nums-1));
          $(`input[data-nums="${nums - 1}"]`).hide();
          $(".upload-area__dropbox").append(newInput);
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

  $('.item-image-list').on('click', '.item-uploaded__delete', function(e){
    e.preventDefault();
    $(this).parent().hide();
    if ($(this).data("uploaded")){
      deleteImages.push($(this).data("uploaded"));
      $("#delete-uploaded-img").val(deleteImages);
    }else{
      dNums = $(this).data("delete");
      $(`input[data-nums="${dNums}"]`).remove();
    }
    afterImages = $('.item-uploaded:visible').length;
    if (afterImages < 10){
      $('.upload-area').show();
    } 
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
});