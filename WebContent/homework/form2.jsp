<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
	div.container { width: 400px; margin: 20px auto; }
	form div { margin-bottom: 10px; }
	input { width: 150px; padding: 4px; }
	select { width: 70px; padding: 4px; }
	button { padding: 0.4em 2em;}
</style>
<title>Insert title here</title>
</head>
<body>
<%

String cmd = request.getParameter("cmd");
if (cmd == null) cmd = "one";
%>
	<form method="get">
		
		  <div>
	      <select name="cmd"> 
	      <option value="one" <%= "one".equals(cmd) ? "selected" : "" %>>one</option>
	      <option value="two" <%= "two".equals(cmd) ? "selected" : "" %>>two</option>
	      <option value="three" <%= "three".equals(cmd) ? "selected" : "" %>>three</option>
	       </select>
	      </div>
	      
	      <div>
	      <input type="text" name="name" value=<%=cmd %>>
	      </div>
	      
	      <div>
	      <button type="submit" name="cmd" value="Ok">Ok</button>
	      </div>
	</form>
</body>
</html>