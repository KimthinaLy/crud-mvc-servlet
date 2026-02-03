<%-- 
    Document   : inputForm
    Created on : Jan 31, 2026, 5:39:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Entry Form</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/general.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/inputForm.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/button.css"/>
    </head>
    <body>
        <header>
            <h1>Product Entry</h1>
        </header>
        
        <main>
            <h2>Add new product:</h2>
            
            <form action="products?action=insert" method="POST"  onsubmit ="return confirmSubmit();">
                <fieldset>
                    <legend>Product Information</legend>
                    
                    <div class="form-row">
                        <label for="product-id">Product Id <span class="required">*</span></label>
                        <input type="text" id="product-id" name="id" required autofocus>
                    </div>
                    
                    <div class="form-row">
                        <label for="name">Product Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-row">
                        <label for="price">Price</label>
                        <input type="number" id="price" name="price" required>
                    </div>   
                    
                    <div class="form-row">
                        <label for="stock">Stock Quantity</label>
                        <input type="number" id="stock" name="quantity" required>
                    </div>
                    
                    <input type="submit" value="Add Product" class="submit-button" /><br>
                </fieldset>
            </form>
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
            function confirmSubmit(){
                const productId = document.getElementById("product-id").value;
                const name = document.getElementById("name").value;
                const price = document.getElementById("price").value;
                const stock = document.getElementById("stock").value;            
                const message =
                            "Please confirm the product information:\n\n" +
                            "Product ID: " + productId + "\n" +
                            "Product Name: " + name + "\n" +
                            "Price: " + price + "\n" +
                            "Stock Quantity: " + stock + "\n\n" +
                            "Do you want to submit this product?";
                return confirm(message);
            }
        </script>
    </body>
</html>
