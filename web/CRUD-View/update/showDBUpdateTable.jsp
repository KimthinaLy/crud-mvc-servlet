<%-- 
    Document   : showDBUpdateTable
    Created on : Jan 30, 2026, 4:51:41 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Database</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/general.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/tableDesign.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/updateTable.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/button.css"/>
    </head>
    <body>
        <header>
            <div class="flex-container">
                <div class="heading-title">Baby Essential Product Management System</div>
                <form action="authentication" method="post">
                    <input type="hidden" name="action" value="logout"/>
                    <button type="submit" class="logout-btn">Logout</button>
                </form>
            </div>
        </header>
        <hr>

        <main>

            <div class="action-flex-box">
                <div class="back-to-home-action">
                    <img src="${pageContext.request.contextPath}/image/home-icon.png" width="70" height="70" alt="home-icon"/>
                    <a href="products?">Back to Home</a>
                </div>
                <div class="view-product-action">
                    <img src="${pageContext.request.contextPath}/image/view-icon.png" width="70" height="70" alt="view-icon"/>
                    <a href="products?action=view">View Products in Database</a>
                </div>
            </div>


            <table>
                <tr>
                    <th>Product Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Qty On Hand</th>
                    <th class="update-action">Update Product</th>
                </tr>

                <c:forEach items="${listProducts}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.price}</td>
                        <td>${p.quantityOnHand}</td>
                        <td><a href="products?action=editForm&id=${p.id}" class="update-product">Update Product</a></td>
                    </tr>
                </c:forEach>
            </table>
        </main>
    </body>
</html>
