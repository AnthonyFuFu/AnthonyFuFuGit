<%@page contentType="text/html;charset=utf-8"  language="java" import="java.sql.*" errorPage=""%> 
<%@page import="org.json.JSONObject"%>
<%
//取得前端送來的資料 
int empno = Integer.parseInt(request.getParameter("empno"));
//int empno=7566;

//載入JDBC驅動程式類別 
//Class.forName("com.mysql.cj.jdbc.Driver");
//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JDBCSample?serverTimezone=Asia/Taipei","David", "123456");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei","root", "cga103g4");
//建立PreparedStatement物件 
PreparedStatement stmt = conn.prepareStatement("select * from emp where empno=?");
//代入資料    
stmt.setInt(1,empno);
//執行PreparedStatement
ResultSet rs = stmt.executeQuery();
//取回一筆資料
JSONObject emp = new JSONObject();//{}
//將資料轉成JSONObject		
if(rs.next()){
emp.put("ename",rs.getString("ename"));
emp.put("job",rs.getString("job"));
emp.put("sal",rs.getInt("sal"));
emp.put("hiredate",rs.getString("hiredate"));
}
//輸出JSONObject
out.print(emp);
//關閉ResultSet物件 	
rs.close();
//關閉Statement物件    
stmt.close();
//關閉Connection物件 	 
conn.close();
%>