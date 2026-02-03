/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import model.Product;
import dao.ProductDAO;
import dao.ProductDAOImpl;
import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet("/products")
public class ProductController extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                showCRUDMenu(request, response);
            } else {
                switch (action) {
                    case "view" ->
                        listProducts(request,response);
                    case "new" ->
                        showForm(request, response);
                    case "editTable" ->
                        showEditTable(request, response);
                    case "editForm" ->
                        showEditForm(request, response);
                    case "deleteTable" ->
                        showDeleteTable(request, response);
                    case "delete" ->
                        deleteProduct(request, response);
                    default ->
                        showCRUDMenu(request, response);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "insert" ->
                    insertProduct(request, response);
                case "update" ->
                    updateProduct(request, response);
                default ->
                    response.sendRedirect("products");

            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    // =================== Method ======================
    private void showCRUDMenu(HttpServletRequest request, HttpServletResponse response) throws Exception {
            RequestDispatcher rd = request.getRequestDispatcher("/CRUD-View/CRUD-Menu.html");
            rd.forward(request, response);
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Product> listProducts = productDAO.getAllProducts();
        request.setAttribute("listProducts", listProducts);

        RequestDispatcher rd = request.getRequestDispatcher("/CRUD-View/read/viewDBTable.jsp");
        rd.forward(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RequestDispatcher rd = request.getRequestDispatcher("/CRUD-View/create/inputForm.jsp");
        rd.forward(request, response);
    }

    private void showEditTable(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Product> listProducts = productDAO.getAllProducts();
        request.setAttribute("listProducts", listProducts);
        RequestDispatcher rd = request.getRequestDispatcher("/CRUD-View/update/showDBUpdateTable.jsp");
        rd.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int productId = Integer.parseInt(request.getParameter("id"));
        Product p = productDAO.getProductById(productId);

        request.setAttribute("product", p);

        RequestDispatcher rd = request.getRequestDispatcher("/CRUD-View/update/updateForm.jsp");
        rd.forward(request, response);
    }

    private void showDeleteTable(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Product> listProducts = productDAO.getAllProducts();
        request.setAttribute("listProducts", listProducts);
        RequestDispatcher rd = request.getRequestDispatcher("/CRUD-View/delete/showDBDeleteTable.jsp");
        rd.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int productId = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(productId);
        showDeleteTable(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Product p = extractProductFromRequest(request);
        productDAO.insertProduct(p);
        listProducts(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Product p = extractProductFromRequest(request);
        productDAO.updateProduct(p);

        showEditTable(request, response);
    }

    // ================= Helper =================
    private Product extractProductFromRequest(HttpServletRequest request) throws Exception {
        Product p = new Product();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        p.setId(id);
        p.setName(name);
        p.setPrice(price);
        p.setQuantityOnHand(quantity);

        return p;
    }
}
