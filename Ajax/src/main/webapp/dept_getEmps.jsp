<%@page contentType="text/html;charset=utf-8"  language="java" import="java.sql.*" errorPage=""%>
<%@page import="org.json.*"%>
<%
//載入JDBC驅動程式類別 
// Class.forName("com.mysql.cj.jdbc.Driver");
// Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sample","user", "password"); 
//Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useUnicode=yes&characterEncoding=utf8&useSSL=true&serverTimezone=Asia/Taipei","root","cga103g4");
//取得前端送來的資料
int deptNo = Integer.parseInt(request.getParameter("deptNo"));
//int deptNo = 30;
//準備好sql指令
PreparedStatement stmt = conn.prepareStatement("select * from emp where deptNo=?");
//代入資料
stmt.setInt(1,deptNo);
//執行sql指令
ResultSet rs = stmt.executeQuery();

//----------------準備打算輸出的JSON資料
//先產生JSON陣列物件
JSONArray emps = new JSONArray();//[]
  //當讀的到一列資料時
  while(rs.next()){
    //產生一個JSON物件
	  //該列資料所需欄位加到該物件中
    JSONObject emp = new JSONObject();//{}
    emp.put("ename",rs.getString("ename"));
    emp.put("job",rs.getString("job"));
    emp.put("sal",rs.getInt("sal"));
    emp.put("hiredate",rs.getString("hiredate"));
    //將此列物件放入jsonArray中
    emps.put(emp);
  }
out.print(emps);//[{},{}...]
rs.close();
stmt.close();
conn.close();
//----------------輸出JSON資料
%>