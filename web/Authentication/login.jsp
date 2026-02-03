<%-- 
    Document   : login
    Created on : Jan 31, 2026, 8:20:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baby Essential</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/general.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/inputForm.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/button.css"/>
    </head>
    <body>
        <form action = "authentication?action=login" method = "POST">
            <fieldset>
                <legend>Login Information</legend>
                <div class="form-row">
                <label for="username">Username</label>
                <input type="text" id="username" name="username">
                </div>
                
                <div class="form-row">
                <label for="password">Password</label>
                <input type="password" id="password" name="password">
                </div>
                
                <input type="submit" value="Login" class="submit-button"/>
            </fieldset>   
        </form>
        <br>
        <a href="${pageContext.request.contextPath}/index.html">Back</a>
    </body>
</html>
