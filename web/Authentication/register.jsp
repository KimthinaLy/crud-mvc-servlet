<%-- 
    Document   : register
    Created on : Jan 31, 2026, 8:20:27 PM
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
        <form action = "authentication?action=register" method = "POST">
            <fieldset>
                <legend>User Information</legend>

                <div class="form-row">
                    <label for="id">Id</label>
                    <input type="text" id="id" name="id" value = ${staff_id} readonly>
                </div>

                <div class="form-row">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username">
                </div>

                <div class="form-row">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password">
                </div>

                <div class="form-row">
                        <label for="role">Role</label>
                        <input type="text" id="role" name="role">
                </div>

                <input type="submit" value="Register" class="submit-button"/>
            </fieldset>   
        </form>
        <br>

        <a href="${pageContext.request.contextPath}/index.html">Cancel</a>
    </body>
</html>
