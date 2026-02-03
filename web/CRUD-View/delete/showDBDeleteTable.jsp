<%-- 
    Document   : showDBDeleteTable
    Created on : Jan 30, 2026, 4:51:18 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Database</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/general.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/tableDesign.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/deleteTable.css"/>
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
                    <th class="danger-action">- Remove Product</th>
                </tr>

                <c:forEach var="p" items = "${listProducts}">

                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.price}</td>
                        <td>${p.quantityOnHand}</td>
                        <td><a class="danger-remove" href="#" onclick="confirmDelete('${p.id}',
                                    '${fn:escapeXml(p.name)}',
                                    '${p.price}',
                                    '${quantityOnHand}'
                                    );
                            return false;">Remove</a></td>
                </tr>
                 </c:forEach>
            </table>

        </main>
        <script>
            function confirmDelete(id, name, price, stock) {
                const message =
                        "Please confirm the product information:\n\n" +
                        "Product ID: " + id + "\n" +
                        "Product Name: " + name + "\n" +
                        "Price: " + price + "\n" +
                        "Stock Quantity: " + stock + "\n\n" +
                        "Are you sure you want to delete this product?";
                if (confirm(message)) {
                    window.location.href = "products?action=delete&id=" + id;
                }
            }
        </script>
    </body>
</html>
