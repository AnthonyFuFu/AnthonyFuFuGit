<%@page contentType="text/html;charset=utf-8"%>
<%
  String memId = request.getParameter("memId");
  String memberData="";
  
  if( memId.equals("Sara"))
    memberData = "Sara Tung,1980-08-08,F,master's degree,Y,No.300, Jhongda Rd., Jhongli City, Taoyuan County 32001, Taiwan (R.O.C.)";
  else if( memId.equals("Amy"))
    memberData = "Amy Chuang,2000-01-01,F,doctor's degree,Y,No. 1, Sec. 4, Roosevelt Road, Taipei, 10617 Taiwan(R.O.C)";
  else
    memberData = "Not found";	
  out.print(memberData);
%>