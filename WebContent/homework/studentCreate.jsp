<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="homework.form2.*" %>
<%
int userid=0;
String name = "";
String studentNumber="";
int year=0;
int department;
String 에러메시지 = null;
request.setCharacterEncoding("UTF-8");

if (request.getMethod().equals("POST")) {
    userid =  Integer.parseInt(request.getParameter("userid"));
    name =  request.getParameter("name");
    studentNumber = request.getParameter("studentNumber");
    
    year = Integer.parseInt(request.getParameter("year"));
    String s = request.getParameter("department");
    department = Integer.parseInt(s);
    
    if (userid==0) 
       	 에러메시지 = "ID를 입력하세요";
    else if (studentNumber == null || studentNumber.length() == 0) 
      	  에러메시지 = "학번을 입력하세요";
    else if (name == null || name.length() == 0) 
        에러메시지 = "이름을 입력하세요";
    else if (year ==0) 
        에러메시지 = "학년을 입력하세요";
    else {	// 마지막 상황
        Student user = new Student(userid, studentNumber, name, department, year);
        session.setAttribute("user", user);
        response.sendRedirect("studentCreate_success.jsp");
        return;
    }    
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<style>
  body { font-family: 굴림체; font-size: 10pt; }
  div.container { width: 400px; margin: 20px auto; }
  form, form div { margin-bottom: 20px; }
  label { display: block; }   
  input.text { width: 200px; padding: 5px; }
  input.number { width: 100px; padding: 5px; }
  select { width: 150px; padding: 5px; }
  .btn { padding: 0.7em 2em; border: 1px solid #aaa; border-radius: 4px; 
         background: linear-gradient(#fff, #ddd); color: black;       
         font-family: 굴림체; font-size: 10pt; line-height: 1em;   
         text-decoration: none; cursor: pointer; display: inline-block; }
  .btn:active {
      -ms-transform: translateY(2px);
      -webkit-transform: translateY(2px);
      transform: translateY(2px);
      background: #ccc;  }
   hr { margin-top: 80px; }
   div.info { margin: 10px; padding: 10px 20px; background-color: #dff; border: 1px solid #8ff; }
   div.error { margin: 10px; padding: 10px 20px; background-color: #fdd; border: 1px solid #faa; }
</style>
</head>
<body>

<div class="container">


<form method="post">
  <h1>학생 등록</h1>
  <div>
    <label>ID</label>
    <input type="number" class="number" name="userid" value="<%= userid %>" />
  </div>
  <div>
    <label>학번</label>
    <input type="number" class="text" name="studentNumber"/>
  </div>
  <div>
    <label>이름</label>
    <input type="text" class="text" name="name" />
  </div>
  <div>
    <label>학과</label>
    <select class="form-control" name="department">
      <option value="1">소프트웨어공학과</option>
      <option value="2" >컴퓨터공학과</option>
      <option value="3" >정보통신공학과</option>
      <option value="4" >글로컬IT공학과</option>
    </select>
  </div>
  <div>
    <label>학년</label>
    <input type="number" class="number" name="year" value="<%= year %>" />
  </div>
  
  <button type="submit" class="btn">
      <i class="fas fa-user-plus"></i> 학생 등록
  </button>
</form>

<% if (에러메시지 != null) { %>
  <div class="error">
    학생등록 실패: <%= 에러메시지 %>
  </div>
<% } %>
</div>
</body>
</html>
