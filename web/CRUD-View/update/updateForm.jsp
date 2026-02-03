<%-- 
    Document   : updateForm
    Created on : Jan 30, 2026, 4:51:52 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Form</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/general.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/updateForm.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/button.css"/>
    </head>
    <body>
        <header>
            <h1>Product Information</h1>
        </header>

        <main>
            <c:if   test="${not empty product}" >

                <form action="products?action=update" method="post" onsubmit="return confirmUpdate(${product.id})">
                    <fieldset>
                        <legend>Product Information</legend>

                        <table>
                            <tr>
                                <th>Product Id</th>
                                <td><input type="hidden" name="id" value="${product.id}"></td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td><input type="text" id="name" name="name" value="${product.name}" class="input-field"></td>
                            </tr>
                            <tr>
                                <th>Price</th>
                                <td><input type="number" id="price" name="price" value="${product.price}" class="input-field"></td>
                            </tr>
                            <tr>
                                <th>Quantity On Hand</th>
                                <td><input type="number" id="qty_on_hand" name="quantity" value="${product.quantityOnHand}" class="input-field"></td>
                            </tr>
                        </table>
                        <input type="submit" value="Update" class="update-button">
                    </fieldset>
                </form>
            </c:if>

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
        </main>

        <script>
            function confirmUpdate(product_id) {
                const productId = product_id;
                const name = document.getElementById("name").value;
                const price = document.getElementById("price").value;
                const qty_on_hand = document.getElementById("qty_on_hand").value;
                const message =
                        "Please confirm the product information:\n\n" +
                        "Product ID: " + productId + "\n" +
                        "Product Name: " + name + "\n" +
                        "Price: " + price + "\n" +
                        "Stock Quantity: " + qty_on_hand + "\n\n" +
                        "Do you want to update this product?";
                return confirm(message);
            }
        </script>
    </body>
</html>
