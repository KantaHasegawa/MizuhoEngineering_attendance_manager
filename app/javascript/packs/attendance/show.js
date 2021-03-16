// function set_csrftoken() { //CSRFのエラー対策
//   $.ajaxPrefilter(function (options, originalOptions, jqXHR) {
//     if (!options.crossDomain) {
//       const token = $('meta[name="csrf-token"]').attr("content");
//       if (token) {
//         return jqXHR.setRequestHeader("X-CSRF-Token", token);
//       }
//     }
//   });
// }

function successFunc(position) {
  // set_csrftoken();
  let lat = position.coords.latitude; //緯度
  let lng = position.coords.longitude; //経度

  document.getElementById('attendance_lat').value = lat;
  document.getElementById("attendance_lng").value = lng;
  form.submit();

    // $.ajax({
    //   type: "POST", // リクエストのタイプ
    //   url: "/attendances", // リクエストを送信するURL
    //   data: { lat: lat, lng: lng }, // サーバーに送信するデータ
    //   dataType: "json", // サーバーから返却される型
    // });
}

function errorFunc(error) {
  // エラーコードのメッセージを定義
  var errorMessage = {
    0: "原因不明のエラーが発生しました…。",
    1: "位置情報の取得が許可されませんでした…。",
    2: "電波状況などで位置情報が取得できませんでした…。",
    3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました…。",
  };

  // エラーコードに合わせたエラー内容をアラート表示
  alert(errorMessage[error.code]);
}

attendance_button.onclick = function () {
  navigator.geolocation.getCurrentPosition(successFunc, errorFunc);
};
