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
String s1 = request.getParameter("s1");
if (s1 == null) s1 = "one";
%>
<body>

<form>
  <div>
    <input id="r1" name=number type="radio" value="one" checked/>
    <label for="r1"><option <%= "one".equals(s1) ? "selected" : "" %>>one</option></label>
    <input id="r2" name=number type="radio" value="two"/>
    <label for="r2"><option <%= "two".equals(s1) ? "selected" : "" %>>two</option></label>
    <input type="radio" name=number value="three"/>
      <option <%= "three".equals(s1) ? "selected" : "" %>>three</option>

  </div>
  
  <div>
    <input type="text" value="<%= s1 %>" />
  </div>
  
  <div>
    <button type="submit">Ok</button>
  </div>
</form>

</body>
</html>
