<%@page contentType="text/html;charset=utf-8"%>
<%
  String memId = request.getParameter("memId");
  String memName="";
  
  if( memId.equals("Sara"))
    memName = "董董";
  else if( memId.equals("Amy"))
    memName = "婷婷";
  else
    memName = "查無此人";
  out.print(memName);
%>