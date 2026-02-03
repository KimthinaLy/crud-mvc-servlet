<%-- 
    Document   : viewDBTable
    Created on : Jan 30, 2026, 5:20:06 PM
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
        <title>Product Database</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/style/general.css"/>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/style/header.css"/>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/style/tableDesign.css"/>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/style/showDatabase.css"/>

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
            <section class="product-actions">
                <a class="btn" href="products?action=new">+ Add Product</a>
                <a class="btn" href="products?action=editTable">Update Product</a>
                <a class="btn btn-danger" href="products?action=deleteTable">- Remove Product</a>
            </section>

            <table>
                <tr>
                    <th>Product Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Qty On Hand</th>
                </tr>

                <c:if test="${not empty listProducts}">
                    <c:forEach items="${listProducts}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td>${p.price}</td>
                            <td>${p.quantityOnHand}</td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

            <div class="back-to-home-action">
                <img src="${pageContext.request.contextPath}/image/home-icon.png" width="70" height="70" alt="home-icon"/>
                <a href="products?">Back to Home</a>
            </div>  

        </main>
    </body>
</html>
