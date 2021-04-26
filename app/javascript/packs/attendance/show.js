history.pushState(null, null, location.href);
window.addEventListener("popstate", (e) => {
  history.go(1);
});

const options = {
  enableHighAccuracy: true,
  maximumAge: -1,
  timeout: 10000,
};

attendance_button.onclick = function () {
  if (window.confirm('本当によろしいですか？')) {
  navigator.geolocation.getCurrentPosition(
    successFunc,
    errorFunc,
    options
  );
  } else {
    return false;
  }
};

function successFunc(position) {
  if (position.coords.accuracy > 1000) {
    alert("取得した位置情報の精度が悪いようです\nWiFiに接続している場合は切断して下さい")
  } else {
    let lat = position.coords.latitude; 
    let lng = position.coords.longitude;
    let form = document.getElementById("attendance_form");
    document.getElementById("attendance_lat").value = lat;
    document.getElementById("attendance_lng").value = lng;
    form.submit();
  }
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
