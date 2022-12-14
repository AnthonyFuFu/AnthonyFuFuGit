<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%
MemberService memberSvc = new MemberService();
List<MemberVO> list = memberSvc.getAll();
pageContext.setAttribute("list", list);
MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<!DOCTYPE html>
<html lang="zh-Hant" dir="ltr">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>修改會員資料</title>
<link rel="stylesheet" href="./css/common/all.css">
<link rel="stylesheet" href="./css/common/header.css">
<link rel="stylesheet" href="./css/common/footer.css">
<link rel="stylesheet" href="./css/common/main.css">
<link rel="stylesheet" href="./css/index.css">
<link rel="shortcut icon" href="../assets/images/favicon.ico">
<link href="./assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet">
<link href="./assets/plugins/fullcalendar/vanillaCalendar.css" rel="stylesheet" type="text/css" />
<link href="./assets/plugins/morris/morris.css" rel="stylesheet">
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="./assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="./assets/css/style.css" rel="stylesheet" type="text/css">
<script src="./js/image.js"></script>
<script src="./js/nav.js"></script>
<style>
 table {
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	font-size:20px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }

  div.main_content {
	width: 50%;
	margin: 0 auto;
	font-size: 0;

	/*   border: 1px solid red; */
}


main.main {
/* 	   background-color: #ddd;  */
	width:800px;
	display: inline-block;
	vertical-align: top;
	font-size: 1rem;

	/*   border: 1px solid #999; */
}
</style>
</head>
<body>

	<header class="header">

		<div class="block">

			<nav class="nav">
				<a href="../index-front.jsp"><img src="./images/SeeFoodLogo.png"></a>
				<ul class="nav_list">
					<li><a href="../announce/announce.jsp" data-target="nav1"
						id="announce" class="nav">公告</a></li>
					<li><a href="../shop/shop.jsp" data-target="nav2" id="shop"
						class="nav">商城</a></li>
					<li><a href="../course/course.jsp" data-target="nav3"
						id="course" class="nav">料理課程</a></li>
					<li><a href="../chef/chef.jsp" data-target="nav4" id="chef"
						class="nav">私廚預約</a></li>
					<li><a href="../forum/forum.jsp" data-target="nav5" id="forum"
						class="nav">討論區</a></li>
					<li><a href="../service/service.jsp" data-target="nav6"
						id="social" class="nav">客服</a></li>

				</ul>

				<div class="sign_block">
					<input class="input" placeholder="找食譜"><input class="input"
						placeholder="找食材">
					<button class="button">
						<img src="./images/icon.png">
					</button>


					<c:choose>

						<c:when test="${empty account}">
							<a href="./member/frontEndLogin.jsp">登入</a>
						</c:when>
						<c:otherwise>
							<div class="btn-group mo-mb-2"
								style="height: 40px; right: 5px; top: 8px;">
								<button type="button" class="btn btn-warning dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">會員</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="./update_member_input.jsp">修改資料</a>
									<a class="dropdown-item" href="../creditCardInformation/CreditCardInformation.jsp">信用卡</a> <a
										class="dropdown-item" href="#">查看訂單</a> <a
										class="dropdown-item" href="#">查看商品</a> <a
										class="dropdown-item" href="#">查看優惠卷</a> <a
										class="dropdown-item" href="#">查看課程</a> <a
										class="dropdown-item" href="#">查看預約</a> <a
										class="dropdown-item" href="#">查看食譜</a> <a
										class="dropdown-item" href="#">查看通知</a> <a
										class="dropdown-item" href="./frontEndLogout.jsp">登出</a>

								</div>
							</div>

						</c:otherwise>
					</c:choose>

				</div>
				<ul class="navbar_list">
					<div class="navbar">
						<li class="announcebar">
							<div>
								<a href="#">最新消息</a>
							</div>
							<div>
								<a href="#">廣告瀏覽</a>
							</div>
							<div>
								<a href="#">關於我們</a>
							</div>
						</li>
						<li class="shopbar">
							<div>
								<a href="#">熱門推薦</a>
							</div>
							<div>
								<a href="#">商品分類</a>
							</div>
							<div>
								<a href="#">購物車</a>
							</div>
							<div>
								<a href="#">優惠方案</a>
							</div>
						</li>
						<li class="coursebar">
							<div>
								<a href="#">課程內容資訊</a>
							</div>
							<div>
								<a href="#">報名</a>
							</div>
						</li>
						<li class="chefbar">
							<div>
								<a href="#">私廚介紹</a>
							</div>
							<div>
								<a href="#">預約系統</a>
							</div>
						</li>
						<li class="forumbar">
							<div>
								<a href="#">食譜</a>
							</div>
							<div>
								<a href="#">上傳食譜</a>
							</div>
							<div>
								<a href="#">飲食交流</a>
							</div>
							<div>
								<a href="#">廚藝烹飪</a>
							</div>
							<div>
								<a href="#">廚具交流</a>
							</div>
							<div>
								<a href="#">收藏文章</a>
							</div>
						</li>
						<li class="socialbar">
							<div>
								<a href="http://www.facebook.com">幫助中心</a>
							</div>
							<div>
								<a href="http://instagram.com">聯絡客服</a>
							</div>
						</li>
					</div>
				</ul>
			</nav>
		</div>



	</header>
	<div class="main">
<div class="main_content">
<main class="main">
		<h1>資料修改:</h1>

		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<FORM METHOD="post" ACTION="Member.do" name="form1">
		

		
		<table>

			<c:forEach var="memberVO" items="${list}">

				<c:choose>

					<c:when test="${account == memberVO.memAccount}">
						<tr>
						
						
				<td><label for="memName">會員姓名:</label></td>
				<td><input type="TEXT" name="memName" size="45"
					value="${memberVO.memName}" id="memName" /></td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input type="TEXT" name="memAccount" size="45"
					value="${memberVO.memAccount}" id="memAccount" readonly/></td>
			</tr>
			<tr>
				<td><label for="memPassword">密碼:</label></td>
				<td><input type="password" name="memPassword" size="45"
					value="${memberVO.memPassword}" id="memPassword" /></td>
			</tr>
			<tr>
				<td><label for="checkmemPassword">確認密碼:</label></td>
				<td><input type="password"size="45"
					value="" id="checkmemPassword" required="required" oninput="setCustomValidity('');" 
					onchange="if(document.getElementById('memPassword').value != document.getElementById('checkmemPassword').value) 
					{setCustomValidity('密碼不符合');}"/></td>
			</tr>

			<tr>
				<td>性別:</td>
				<td>
				<label for="memGender">男</label>
				<input type="radio" name="memGender" size="45" value="m"  ${memberVO.memGender.equals("m") ? "checked" : ""}   /> 
				<label for="memGender">女</label>
				<input type="radio" name="memGender" size="45" value="f"  ${memberVO.memGender.equals("f") ? "checked" : ""}  />
				</td>
			</tr>
			<tr>
				<td><label for="memPhone">電話:</label></td>
				<td><input type="TEXT" name="memPhone" size="45"
					value="${memberVO.memPhone}" id="memPhone" /></td>
			</tr>
			<tr>
				<td><label for="memEmail">信箱:</label></td>
				<td><input type="TEXT" name="memEmail" size="45"
					value="${memberVO.memEmail}" id="memEmail" /></td>
			</tr>
			<tr>
				<td><label for="memAddres">地址:</label></td>
					<td>
       							    
  								  
				<input type="TEXT" name="memAddres" size="45"
					value="${memberVO.memAddres}" id="memAddres" /></td>
			</tr>
			<tr>
				<td><label for="memBirthday">生日:</label></td>
				<td><input name="memBirthday" id="memBirthday" type="text" ></td>
			</tr>
			<tr>
				<td>國家:</td>
				<td><input type="TEXT" name="memNation" size="45"
					value="${memberVO.memNation}" /></td>
			</tr>
			<tr>
			<td></td>
		<td><input type="submit" value="確認"> 
		<input type="hidden" name="memid" value="${memberVO.memid}"> 
		<input type="hidden" name="action" value="update"></td>
		</tr>
					</c:when>
					<c:otherwise>


					</c:otherwise>
				</c:choose>

			</c:forEach>
		</table>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
</FORM>
	</main>
	</div>
	</div>
	<%@ include file="../tools/footer.jsp"%>
	<script src="./assets/js/jquery.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>

</body>
<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link rel="stylesheet" type="text/css"
	href="datetimepicker/jquery.datetimepicker.css" />
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
$.datetimepicker.setLocale('zh');
$('#memBirthday').datetimepicker({
   theme: '',              //theme: 'dark',
    timepicker:false,       //timepicker:true,
    step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
    format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   value: '${memberVO.memBirthday}', // value:   new Date(),
   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
   //startDate:	            '2017/07/10',  // 起始日
   //minDate:               '-1970-01-01', // 去除今日(不含)之前
   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});

</script>
</html>