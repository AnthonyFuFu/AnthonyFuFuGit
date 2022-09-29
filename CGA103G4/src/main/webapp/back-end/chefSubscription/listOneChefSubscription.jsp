<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.chefsubscription.model.*"%>

<%
	ChefSubscriptionVO chefSubscriptionVO = (ChefSubscriptionVO) request.getAttribute("chefSubscriptionVO"); //ChefSubscriptionServlet.java(Concroller), 存入req的chefSubscriptionVO物件
%>

<html>
<head>
<title>私廚訂閱資料 - listOneChefSubscription.jsp</title>

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
	width: 1000px;
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


<table id="table-1">
	<tr><td>
		 <h3>私廚訂閱資料 - ListOneChefSubscription.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>私廚編號</th>
		<th>會員編號</th>
		
	</tr>
	<tr>
		<td><%=chefSubscriptionVO.getChefid()%></td>
		<td><%=chefSubscriptionVO.getMemid()%></td>
		
	</tr>
</table>

</body>
</html>