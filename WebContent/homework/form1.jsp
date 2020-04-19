<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
  button { padding: 0.4em 3em; margin-top: 10px; }
  form div { margin-bottom: 10px; }
  input { width: 200px; padding: 4px; }

 </style>
<title>Insert title here</title>
</head>
<body>
<% 
String s1 = request.getParameter("number");
int number = (s1 == null) ? 0 : Integer.parseInt(s1);
String cmd = request.getParameter("cmd");
if ("+".equals(cmd)) number ++;
%>
	<form>
	<input type="text" name="number" value=<%=number %>>
	<button type="submit" name="cmd" value="+">++</button>
	</form>
</body>
</html>