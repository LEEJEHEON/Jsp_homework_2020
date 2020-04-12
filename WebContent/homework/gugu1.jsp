<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>lecture1</title>
<style>
    table { border-collapse: collapse; }
    td { padding: 5px; border: solid 1px gray; }
</style>
</head>
<body>

<table>
  <% for (int i=1; i < 10; i++) { %>
    <tr>  
    <% for (int j=2; j < 10; j++) { %>
        <td><%= j%> x <%=i%> = <%= j*i%></td>
    <% } %>
    </tr>
  <% } %>
</table>

</body>
</html>
