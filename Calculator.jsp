<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    double num1 = 0, num2 = 0, result = 0;
    String operator = request.getParameter("operator");

    try {
        if (request.getParameter("num1") != null && request.getParameter("num2") != null) {
            num1 = Double.parseDouble(request.getParameter("num1"));
            num2 = Double.parseDouble(request.getParameter("num2"));

            switch (operator) {
                case "+": result = num1 + num2; break;
                case "-": result = num1 - num2; break;
                case "*": result = num1 * num2; break;
                case "/": result = (num2 != 0) ? num1 / num2 : Double.NaN; break;
                case "%": result = (num2 != 0) ? num1 % num2 : Double.NaN; break;
                default: operator = "";
            }
        }
    } catch (Exception e) {
        result = Double.NaN; // Handle errors
    }
    
    DecimalFormat df = new DecimalFormat("#.##");
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP Calculator</title>
    <link rel="stylesheet" type="text/css" href="cal1.css">
</head>
<body>
    <div class="calculator">
        <h2>Simple JSP Calculator</h2>
        <form method="post">
            <input type="text" name="num1" value="<%= request.getParameter("num1") != null ? request.getParameter("num1") : "" %>" required>
            <select name="operator">
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
                <option value="%">%</option>
            </select>
            <input type="text" name="num2" value="<%= request.getParameter("num2") != null ? request.getParameter("num2") : "" %>" required>
            <br>
            <button type="submit">Calculate</button>
            <button type="reset" onclick="window.location.href='calculator.jsp'">Clear</button>
        </form>
        <h3>Result: <%= df.format(result) %></h3>
    </div>
</body>
</html>
