<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.chef.model.*"%>
<%@ page import="com.member.model.*" %>
<%
String chefName = (String) session.getAttribute("chefName");
System.out.print("JSP:"+ chefName);
%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Appointment</title>
<link href='./lib/main.css' rel='stylesheet' />

<link rel="stylesheet" href="../css/common/all.css">
  <link rel="stylesheet" href="../css/common/header.css">
  <link rel="stylesheet" href="../css/common/footer.css">
  <link rel="stylesheet" href="../css/common/main.css">
  <link rel="stylesheet" href="../css/chef.css">
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="../assets/css/style.css" rel="stylesheet" type="text/css">
  <script src="../js/chef.js"></script>
  <script src="../js/nav.js"></script>
<!-- Calendar -->
<script src='./lib/main.js'></script>
<script src="./lib/locales-all.js"></script>
<!--     <script src="./js/fullcalendar.js"></script> -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.shadow {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	background: rgba(0, 0, 0, .3);
	transition: all .3s;
	z-index: -1;
}

.shadow.show {
	z-index: 1;
	opacity: 1;
}

.shadow.show .model {
	transform: translate(-50%, -50%);
}

.model {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -60%);
	width: 650px;
	background: #fff;
	border-radius: 6px;
	transition: all .3s;
}

.model .tit {
	display: flex;
	line-height: 30px;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}

.model .tit .close {
	margin-left: auto;
	cursor: pointer;
}

.model .content {
	padding: 10px;
}

body, div, li {
	margin: 0;
	padding: 0
}

#div1 {
        width: 200px;
        height: 100px;
        position: absolute;
        top: 50px;
        left: 50px;
        border-style: outset;
        border-width: 1px;
        border-color: #2C3E50;
        word-break: keep-all;
    }

    #div2 {
        width: 100px;
        height: 30px;
        background: #2C3E50;
        position: relative;
        top: -10px;
        left: -10px;
        line-height: 30px;
        font-size: 16px;
        color: #FFFFFF;
        text-align: center;
        font-weight: bold;
    }

</style>
</head>

<body>
<%@ include file="./tools/header.jsp"%>
	<div id='calendar'></div>
<!-- 	<div id="div1"> -->
<!--         <div id="div2">OOO??????</div> -->
<!--         ???????????????????????? ????????????:11:00~13:00 ????????????:17:00~20:00 -->
<!--     </div> -->
	<div class="shadow" id="shadow">
		<div class="model">
			<div class="tit">
				<div class="close" id="model-close">??????</div>
			</div>
			<iframe class="content" width="570" align="center" height="400"
				frameborder="0" scrolling="no" src="./make_appointment.jsp"></iframe>
		</div>
	</div>

	<script>
	
    document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
		let chefid = localStorage.getItem("chefid");
		localStorage.setItem('chefName','${chefName}');
    	let MyPoint = "/front-end/chefAppointment/chefapp.do?action=getAllById&chefid="+chefid;
    	let host = window.location.host;
    	let path = window.location.pathname;
    	let webCtx = path.substring(0, path.indexOf('/', 1));
    	let URL = "http://" + host + webCtx + MyPoint;
    	let shadow = document.getElementById('shadow');
    	
    	//????????????iframe??????
    	shadow.addEventListener('click', function(e) {
    		let target = e.target;
    		let _class = target.className;
    		if (_class.includes('shadow') || _class.includes('close')) {
    			shadow.className = 'shadow'
    		}
    		return false
    	}, false)
    	
    	//??????????????????
    	fetch(URL).then(response => response.json("jsons"))
    		.then(jsons => {
    			let calendar = new FullCalendar.Calendar(calendarEl, {
    				headerToolbar: {
    					left: 'prev,next,today',
    					center: 'title',
    					right: 'dayGridMonth,timeGridWeek'
    				},
    				locale: 'zh-tw',
    				navLinks: true, // can click day/week names to navigate views
    				selectable: true,
    				selectMirror: true,
    				eventClick: function(arg) {
						//??????????????????
						let title = arg.event._def.title;
                        //???????????????????????????
    					let schDate = new Date(arg.event._instance.range.start);
    					const options = {
    						year: 'numeric',    // ???: ??????4??????
    						month: '2-digit',   // ???: ??????2??????
    						day: '2-digit',     // ???: ??????2??????
    					};
    					let dateStr = schDate.toLocaleDateString('zh-tw', options).replaceAll('/', '-');
                        // if(arg.)
						if(title === '??????'){
							let time = '0';
							localStorage.setItem('date',dateStr);
							localStorage.setItem('time',time);
							shadow.className = 'shadow show'; //????????????
							return false;
						}else if(title === '??????'){
							let time = '1';
							localStorage.setItem('date',dateStr);
							localStorage.setItem('time',time);
							shadow.className = 'shadow show'; //????????????
							return false;
						}else{
							
						}
    				},
    				editable: false,
    				dayMaxEvents: true,
    				events: jsons,
    				dayCellContent: function(arg) {
    					return arg.date.getDate();
    				}
    			});
    			calendar.render();
    		});
   });
    </script>
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/popper.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
</body>

</html>