<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.chefskills.model.*"%>

<%
ChefSkillsVO chefSkillsVO = (ChefSkillsVO) request.getAttribute("chefSkillsVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>私廚專長資料新增 - addChefSkills.jsp</title>

<style>

</style>

<style>
table {
	width: 550px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>私廚專長資料新增 - addChefSkills.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>建立專長種類:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="ChefSkills.do" name="form1">
		<table>
			<tr>
				<td>私廚編號:</td>
				<td><input type="TEXT" name="chefid" size="45"
					value="<%=(chefSkillsVO == null) ? "" : chefSkillsVO.getChefid()%>" /></td>
			</tr>
			<tr>
				<td>專長編號:</td>
				<td><input type="TEXT" name="skillid" size="45"
					value="<%=(chefSkillsVO == null) ? "" : chefSkillsVO.getSkillid()%>" /></td>
			</tr>
			
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>

</html>