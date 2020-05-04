<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  div { margin-bottom: 10px; }
  input, select { padding: 5px; }
  button { padding: 0.4em 2em; }
</style>
<title>Insert title here</title>
</head>
<%
String num = request.getParameter("number");
if (num == null) num = "one";
%>

<body>

<form>
  <div>
    <input id="r1" name=number type="radio" value="one" checked />
    one
    <input id="r2" name=number type="radio" value="two"/>
    two
    <input id="r3" type="radio" name=number value="three" />
    three

  </div>
  
  <div>
    <input type="text" value="<%= num %>" />
  </div>
  
  <div>
    <button type="submit">Ok</button>
  </div>
</form>

</body>
</html>
