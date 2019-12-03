$(document).on('turbolinks:load', function() {
  $(function() {
    $('.slider').slick({
      autoplay: true, //自動再生
      dots: true, //ドットのナビゲーションを表示
      infinite: true, //スライドのループ有効化
      speed: 1000, //切り替えのスピード（小さくすると速くなる）
      fade: true, //フェードの有効化
    });

  });
});