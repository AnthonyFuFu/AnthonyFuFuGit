<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
 
</style>

<style>
  table {
	width: auto;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneEmp.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>管理員編號</th>
		<th>管理員姓名</th>
		<th>聯絡電話</th>
		<th>管理員照片</th>
		<th>帳號</th>
		<th>密碼</th>
		<th>管理員等級</th>
		<th>管理員狀態</th>
		<th>雇用日期</th>
		<th>管理員管理</th>
	</tr>
	<tr>
		<td><%=empVO.getEmpid()%></td>
		<td><%=empVO.getEmpName()%></td>
		<td><%=empVO.getEmpPhone()%></td>
<td><img src="<%= request.getContextPath() %>/EmpShowPic?empid=${empVO.empid}" width="100" heigh="100"></td>
		<td><%=empVO.getEmpAccount()%></td>
		<td><%=empVO.getEmpPassword()%></td>
		<td><%=empVO.getEmpLevel()%></td>
		<td><%=empVO.getEmpStatus()%></td>
		<td><%=empVO.getEmpHiredate()%></td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/emp.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="empid"  value="${empVO.empid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
	</tr>
</table>

</body>
</html>