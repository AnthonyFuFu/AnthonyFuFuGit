<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%
	MemberService memberSvc = new MemberService();
    List<MemberVO> list = memberSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>�Ҧ��|����� - listAllMember.jsp</title>
<link rel="shortcut icon" href="../assets/images/favicon.ico">
<link href="../assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet">
<link href="../assets/plugins/fullcalendar/vanillaCalendar.css" rel="stylesheet" type="text/css" />
<link href="../assets/plugins/morris/morris.css" rel="stylesheet">
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../assets/css/icons.css" rel="stylesheet" type="text/css">
<link href="../assets/css/style.css" rel="stylesheet" type="text/css">
<link href="../chef/css/other.css" rel="stylesheet" type="text/css">

</head>
<body bgcolor='white'>
	<!-- Navigation Bar -->
	<%@ include file="../tools/header.jsp"%>

	<div class="wrapper">
		<div class="container-fluid">
			<!-- 			Page-Title -->
			<div class="row">
				<div class="col-sm-12">
					<div class="page-title-box">
						<div class="btn-group pull-right">
							<ol class="breadcrumb hide-phone p-0 m-0">
								<li class="breadcrumb-item"><a href="#">Zoter</a></li>
								<li class="breadcrumb-item"><a href="#">Tables</a></li>
								<li class="breadcrumb-item active">Editable</li>
							</ol>
						</div>
						<h4 class="page-title">Editable</h4>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">

							<div class="main_content">
								<aside class="aside">
									<div class="btn-group mo-mb-2" 
                     			style="top: 0px; left: 0px;">
                                <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false" style="width:140px">�|����T </button>
                                    <div class="dropdown-menu">
                                    <a class="dropdown-item" href='../member/select_page.jsp'>�j�M�|��</a>
                                    <a class="dropdown-item" href='../member/listAllMember.jsp'>�|���C��</a>
                                    </div>
                                </div>

                                <div class="btn-group mo-mb-2"
                                style="top: 20px; left: 0px;">
                                <button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false" style="width:140px">�H�Υd��T </button>
                                    <div class="dropdown-menu">
                                    <a class="dropdown-item" href='../creditCardInformation/select_page.jsp'>�j�M�H�Υd</a>
                                    <a class="dropdown-item" href='../creditCardInformation/listAllCreditCardInformation.jsp'>�H�Υd�C��</a>
                                    </div>
                                </div>
                                

								</aside>

								<main class="main">


<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���m�W</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�ʧO</th>
		<th>�q��</th>
		<th>�H�c</th>
		<th>�a�}</th>
		<th>�ͤ�</th>
		<th>���A</th>
		<th>��a</th>
		<th>�ק�</th>

	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${memberVO.memid}</td>
			<td>${memberVO.memName}</td>
			<td>${memberVO.memAccount}</td>
			<td>${memberVO.memPassword}</td>
<%-- 			<td>${memberVO.memGender}</td> --%>
			<c:if test="${memberVO.memGender == 'm'}">
				<td>�k</td>	
			</c:if>
			<c:if test="${memberVO.memGender == 'f'}">
				<td>�k</td>
			</c:if>
			<td>${memberVO.memPhone}</td> 
			<td>${memberVO.memEmail}</td>
			<td>${memberVO.memAddres}</td>
			<td>${memberVO.memBirthday}</td>
<%-- 			<td>${memberVO.memStatus}</td> --%>
			<c:if test="${memberVO.memStatus == 0}">
				<td>�ҥ�</td>	
			</c:if>
			<c:if test="${memberVO.memStatus == 1}">
				<td>���v</td>
			</c:if>
			<td>${memberVO.memNation}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/member/Member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="memid"  value="${memberVO.memid}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
	</main>
							</div>
						</div>
						<!-- end container -->
					</div>
					<!-- end wrapper -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</div>
	<!-- end wrapper -->
	<!-- Footer -->
	<%@ include file="../tools/footer.jsp"%>
	<!-- End Footer -->
	<!-- jQuery -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/popper.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/modernizr.min.js"></script>
	<script src="../assets/js/waves.js"></script>
	<script src="../assets/js/jquery.nicescroll.js"></script>
	<script
		src="../assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="../assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="../assets/plugins/skycons/skycons.min.js"></script>
	<script src="../assets/plugins/tiny-editable/mindmup-editabletable.js"></script>
	<script src="../assets/plugins/tiny-editable/numeric-input-example.js"></script>
	<script src="../assets/plugins/fullcalendar/vanillaCalendar.js"></script>
	<script src="../assets/plugins/raphael/raphael-min.js"></script>
	<script src="../assets/plugins/morris/morris.min.js"></script>
	<script src="../assets/js/app.js"></script>
</body>
</html>