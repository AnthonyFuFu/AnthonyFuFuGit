<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>部門員工資料</title>
<style type="text/css">
	.empsTable th{
		background-color:#bfbfef;
	}
	.empsTable td{
		width:160px;
		border-bottom:1px dotted deeppink;
	}
</style>
</head>
<body>
<!-- 將部門資料放入選單中 -->
<select id='deptNo'>
	<option value='10'>ACCOUNTING</option>
	<option value='20'>RESEARCH</option>
	<option value='30'>SALES</option>
	<option value='40'>OPERATIONS</option>
	<option value='50'>MIS</option>
	<option value='60'>MANAGER</option>
	<option value='70'>HR</option>
</select>
<br>
<div id="showPanel"></div>

<script>
function showEmps(json){
	let emps = JSON.parse(json);
	let html;

	if (emps.length == 0) {
		html = "<center>此部門尚無員工資料</center>";
	} else {
		html = "<table class='empsTable'>";
		for(let i in emps){
			html += "<tr>";
			html += "<td>"+emps[i].ename+"</td>";
			html += "<td>"+emps[i].job+"</td>";
			html += "<td>"+emps[i].sal+"</td>";
			html += "<td>"+emps[i].hiredate+"</td>";
			html += "</tr>";
		}
		html += "</table>";
	}
	document.getElementById("showPanel").innerHTML = html;
}	

function getEmps(e){
	//取得欲查詢的部門代號
	let deptNo = e.target.value;
	let xhr = new XMLHttpRequest();
	xhr.onload = function () {
		if(xhr.status){
			showEmps(xhr.responseText);
		}else{
			alert(xhr.status);
		}
	}
	let url = "dept_getEmps.jsp?deptNo="+deptNo;
	xhr.open("get",url,true);
	xhr.send(null);
}	

window.addEventListener("load", function(){
	//------註冊下拉式選單
	document.getElementById("deptNo").onchange = getEmps;
})

</script>
</body>
</html>