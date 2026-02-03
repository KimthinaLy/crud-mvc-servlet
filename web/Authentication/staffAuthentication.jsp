<%-- 
    Document   : staffAuthentication
    Created on : Jan 31, 2026, 8:21:11 PM
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
        <form action = "authentication?action=confirmEmail" method = "POST">
            <fieldset>
                <legend>Staff Email</legend>

                <div class="form-row">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email">
                </div>

                <input type="submit" value="Continue" class="submit-button"/><br>
            </fieldset>   
        </form>
        <br>

        <a href="${pageContext.request.contextPath}/index.html">Back</a>
    </body>
</html>
