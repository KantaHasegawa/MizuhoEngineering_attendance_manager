# 株式会社ミズホエンジニアリング勤怠管理システム
<p>このアプリケーションは<a href="http://www.mizuho-engi.jp">株式会社ミズホエンジニアリング</a>の位置情報連携勤怠管理システムです。</p>
<p>現在は使用しておらず、代わりに以下の新システムを使用しております</p>
<a href="https://nanikiru.page/">デモサイト</a> <br>
<a href="https://github.com/KantaHasegawa/MizuhoEngineeringTimecardSystem-FrontEnd">GitHub: MizuhoEngineeringTimecardSystem-FrontEnd</a> <br>
<a href="https://github.com/KantaHasegawa/MizuhoEngineeringTimecardSystem-BackEnd">Github: MizuhoEngineeringTimecardSystem-BackEnd</a> <br>
<p></p>
 
<p>現場仕事が多い土木の勤怠管理を楽にするために開発しました。</p>

![Web キャプチャ_5-12-2021_225451_mizuhodemo page](https://user-images.githubusercontent.com/66783124/144749958-d7259e0a-a137-4b6e-8846-42e3c722069d.jpeg)
![Web キャプチャ_5-12-2021_225524_mizuhodemo page](https://user-images.githubusercontent.com/66783124/144749965-8070a1d2-f660-4b9e-8a6d-ccf7474617dc.jpeg)
![Web キャプチャ_5-12-2021_22566_mizuhodemo page](https://user-images.githubusercontent.com/66783124/144749966-5e4d8f02-522d-4c79-832b-3547cb0e958f.jpeg)


<h2>使い方</h2>
<p>ユーザーは管理者と管理者以外に分かれており、それぞれ利用できる機能が違います</p>
<h3>管理者以外のユーザー</h3>
<p>管理者以外のユーザーは出勤退勤ボタンを押すだけのシンプルな機能が利用できます</p>
<p>管理者が設定した勤務地の半径1kmでボタンを押すと出勤退勤に成功します</p>
<h3>管理者</h3>
<p>管理者はユーザーの登録、勤務地の登録、ユーザーの勤務状況の閲覧、Excel出力の機能、出勤退勤のメール通知が利用できます</p>
<p>ユーザーと勤務地を登録した後、それぞれを紐づけすることができます</p>
<p>こうすることでユーザーは紐づけされた勤務地内以外での出勤退勤を制限されます</p>
<p>デモサイトにはemail: "admin@gmail.com" password: "adminadmin" で管理者ログインすることができます</p>
<p>管理者でないユーザーとしてemail: "test(n)@gmail.com" password: "testtest(n)" を用意しています</p>
<h2>Versions</h2>
<p>Rails 6.0.3.5</p>
<p>ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]</p>
