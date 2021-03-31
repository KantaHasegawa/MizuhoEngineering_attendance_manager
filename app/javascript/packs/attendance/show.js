attendance_button.onclick = function () {
  navigator.geolocation.getCurrentPosition(successFunc, errorFunc);
};

function successFunc(position) {
  let lat = position.coords.latitude; //緯度
  let lng = position.coords.longitude; //経度
  let form = document.getElementById("attendance_form");
  document.getElementById("attendance_lat").value = lat;
  document.getElementById("attendance_lng").value = lng;
  form.submit();
}

function errorFunc(error) {
  var errorMessage = {
    0: "原因不明のエラーが発生しました…。",
    1: "位置情報の取得が許可されませんでした…。",
    2: "電波状況などで位置情報が取得できませんでした…。",
    3: "位置情報の取得に時間がかかり過ぎてタイムアウトしました…。",
  };
  alert(errorMessage[error.code]);
}
