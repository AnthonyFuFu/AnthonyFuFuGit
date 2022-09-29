<%@page contentType="text/html;charset=utf-8" %>	 
<% 
  response.setHeader("Pragma","no-cache");
  response.setHeader("Cache-Control","no-cache");
  response.setDateHeader("Expires",0);
  out.print("Hi!!!");
%>