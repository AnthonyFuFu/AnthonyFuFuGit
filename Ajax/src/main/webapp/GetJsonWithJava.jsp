<%@page contentType="text/html;charset=utf-8"%> 
<%@page import="org.json.JSONObject"%>
<%
  /*
  建立json物件:emp,內含ename屬性(值:Linsanity)及phone屬性,
  其中phone屬性為一個json物件,內含屬性 O (值: 034257387 ),屬性 H (值: 03168168 ), 屬性 M (值: 0933168168)
  */

JSONObject emp = new JSONObject();
emp.put("ename","Linsanity");

JSONObject phone = new JSONObject();
phone.put("O","03-1234567");
phone.put("H","03-7654321");
phone.put("M","0911-168168");

emp.put("phone",phone);

//輸出JSON
out.print(emp);
%>