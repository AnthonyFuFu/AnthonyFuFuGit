<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="zh-Hant" dir="ltr">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
  <title>《See Food》官方網站</title>
  <link rel="stylesheet" href="./css/common/all.css">
  <link rel="stylesheet" href="./css/common/header.css">
  <link rel="stylesheet" href="./css/common/footer.css">
  <link rel="stylesheet" href="./css/common/main.css">
  <link rel="stylesheet" href="./css/index.css">
  <script src="./js/image.js"></script>
</head>

<body>

  <header class="header">

    <div class="block">

      <nav class="nav">
        <a href="./index.html"><img src="./images/SeeFoodLogo.png"></a>
        <ul class="nav_list">
          <li><a href="./announce/announce.html" data-target="nav1" id="announce" class="nav">公告</a></li>
          <li><a href="./shop/shop.html" data-target="nav2" id="shop" class="nav">商城</a></li>
          <li><a href="./course/course.html" data-target="nav3" id="course" class="nav">料理課程</a></li>
          <li><a href="./chef/chef.html" data-target="nav4" id="chef" class="nav">私廚預約</a></li>
          <li><a href="./forum/forum.html" data-target="nav5" id="forum" class="nav">討論區</a></li>
          <li><a href="./service/service.html" data-target="nav6" id="social" class="nav">客服</a></li>
        </ul>

        <div class="sign_block">
          <input class="input" placeholder="找食譜"><input class="input" placeholder="找食材"><button class="button"><img
              src="./images/icon.png"></button>
              ${account}
<!--           <a href="./frontEndLogin.html">登入</a> -->
<%--           <h3> 歡迎:<font color=red> ${account} </font>您好</h3> --%>
        </div>
        <ul class="navbar_list">
          <div class="navbar">
            <li class="announcebar">
              <div><a href="#">最新消息</a></div>
              <div><a href="#">廣告瀏覽</a></div>
              <div><a href="#">關於我們</a></div>
            </li>
            <li class="shopbar">
              <div><a href="#">熱門推薦</a></div>
              <div><a href="#">商品分類</a></div>
              <div><a href="#">購物車</a></div>
              <div><a href="#">優惠方案</a></div>
            </li>
            <li class="coursebar">
              <div><a href="#">課程內容資訊</a></div>
              <div><a href="#">報名</a></div>
            </li>
            <li class="chefbar">
              <div><a href="#">私廚介紹</a></div>
              <div><a href="#">預約系統</a></div>
            </li>
            <li class="forumbar">
              <div><a href="#">食譜</a></div>
              <div><a href="#">上傳食譜</a></div>
              <div><a href="#">飲食交流</a></div>
              <div><a href="#">廚藝烹飪</a></div>
              <div><a href="#">廚具交流</a></div>
              <div><a href="#">收藏文章</a></div>
            </li>
            <li class="socialbar">
              <div><a href="http://www.facebook.com">幫助中心</a></div>
              <div><a href="http://instagram.com">聯絡客服</a></div>
            </li>
          </div>
        </ul>

      </nav>
    </div>
    <li class="black_block"></li>
    <div class="picture -on">
      <a href="#"><img id="image01" src="./images/01.jpg"></a>
      <a href="#"><img id="image02" src="./images/02.jpg"></a>
      <a href="#"><img id="image03" src="./images/03.jpg"></a>
      <a href="#"><img id="image04" src="./images/04.jpg"></a>
      <a href="#"><img id="image05" src="./images/05.jpg"></a>
      <a href="#"><img id="image06" src="./images/06.jpg"></a>
      <a href="#"><img id="image07" src="./images/07.jpg"></a>
      <a href="#"><img id="image08" src="./images/08.jpg"></a>
      <a href="#"><img id="image09" src="./images/09.jpg"></a>

      <div class="leftright">
        <div id="left"></div>
        <div id="right"></div>
      </div>

    </div>

  </header>

  <div class="main">

    <div class="container nav0 -on" id="indexPage">

      <div id="indexPageContent">

        <div class="title">
          這裡是首頁
        </div>

        <div class="sectionOne">
          分區一
        </div>

        <div class="horizen"></div>

        <div class="sectionTwo">
          分區二
        </div>

        <div class="horizen"></div>

        <div class="sectionThree">
          分區三
        </div>

      </div>

    </div>

  </div>


  <footer class="footer">
    <div class="us">
      <a href="#" class="pic"><img src="./images/SeeFoodLogo.png"></a><br>
      <li><a href="#" class="pic"><img src="./images/fb.png"></a></li>
      <li><a href="#" class="pic"><img src="./images/ig.png"></a></li>
      <li><a href="#" class="pic"><img src="./images/tw.png"></a></li>
      <li><a href="#" class="pic"><img src="./images/yt.png"></a></li>
      <div class="about_us">
        <li><a href="#" class="footer_contain">關於SeeFood</a></li>
        <li><a href="#" class="footer_contain">公司資訊</a></li>
        <li><a href="#" class="footer_contain">徵才資訊</a></li>
        <li><a href="#" class="footer_contain">廣告合作</a></li>
      </div>
    </div>

    <div class="copyright">
      <li>copyright&copy;2022 seefood</li>
    </div>

    <div class="another">
      <li><a href="#" class="footer_contain">客服資訊</a></li>
      <li><a href="#" class="footer_contain">信箱:SeeFood@gmail.com</a></li>
    </div>

  </footer>


</body>

</html>