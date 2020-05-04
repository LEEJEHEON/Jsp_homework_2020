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
  table { border-collapse: collapse; margin-top: 5px;}
  td { padding: 5px; border: solid 1px gray; width:130px;}
 </style>
</head>
<body>
<% 
String s1 = request.getParameter("number");
int number = (s1 == null) ? 0 : Integer.parseInt(s1);
%>

<form>
	<input type="text" name="number" value=<%=number %>>
	<button type="submit" name="cmd" value="단">단</button>
	
<table>
	
    <% for (int i=1; i < 10; i++) { %>
    <tr>  <td>  <%= number%> x <%=i%> = <%= number*i%></td></tr>
    <% } %>
    
</table>

</form>


</body>
</html>