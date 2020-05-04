<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = "";
String 에러메시지 = null;
request.setCharacterEncoding("UTF-8");
String radio=null;

if (request.getMethod().equals("POST")) {
    name =  request.getParameter("name");
    radio = request.getParameter("numder");
    
    
    if (name == null || name.length() == 0) 
        에러메시지 = "이름을 입력하세요";
    else if (radio == null) 
        에러메시지 = "성별을 입력하세요";
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
   button { padding: 0.4em 2em;}
   table { width: 500px; border-collapse: collapse; }
  thead tr { background-color: #eee; }
  td, th { border: 1px solid #aaa; padding: 5px; }
</style>
</head>
<body>
<div class="container">
	<form method="post">
	  <h1>회원 등록</h1>
	  <div>
	    <label>이름</label>
	    <input type="string" class="number" name="username" value="<%=name%>" />
	  </div>
	  <div>
	    <label>성별</label>
	    <input id="cmd" name=number type="radio" value="남자" />남자
	    <input id="cmd" name=number type="radio" value="여자"/>여자
	  </div>
	  
 		<div>
	      <button type="submit" name="cmd" value="Ok">회원 등록</button>
	    </div>
	    
 <% if (에러메시지 != null) { %>
  <div class="error">
    회원등록 실패: <%= 에러메시지 %>
  </div>
	<% } %>
	
	<table>
	  <tr>
	    <td>이름</td>
	    <td><%= name %></td>
	  </tr>
	  <tr>
	    <td>성별</td>
	    <td><%= radio %></td>
	  </tr>
	  <tr>
 	</table>

	  </form>

</div>
 </body>
 </html>