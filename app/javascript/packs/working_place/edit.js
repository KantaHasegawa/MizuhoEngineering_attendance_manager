$(document).ready(function () {
  // 画面表示時にselected以外をdisableにする
  $(".select_form option:not(:selected)").each(function (i, elem) {
    $(elem).prop("disabled", true);
  });
  $(".select_form").css("background-color", "#dcdcdc");
});
