/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.StaffDAO;
import dao.StaffDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.Staff;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet("/authentication")
public class AuthenticationController extends HttpServlet {

    private StaffDAO staffDAO = new StaffDAOImpl();
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null) {
                action = "login";
            }

            switch (action) {
                case "login" ->
                    showLoginPage(request, response);
                case "checkIfStaff" ->
                    showStaffEmailForm(request, response);
                default ->
                    response.sendRedirect(request.getContextPath() + "/authentication?action=login");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null) {
                action = "login";
            }
            switch (action) {
                case "login" ->
                    handleLogin(request, response);
                case "confirmEmail" ->
                    confirmStaffEmail(request, response);
                case "register" ->
                    handleRegister(request, response);
                case "logout" ->
                    handleLogout(request, response);
                default ->
                    response.sendRedirect(request.getContextPath() + "/authentication?action=login");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

// ================== Methods =================    
    private void showLoginPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RequestDispatcher rd = request.getRequestDispatcher("/Authentication/login.jsp");
        rd.forward(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userDAO.login(username, password);

        if (user == null) {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/Authentication/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/products");
        }
    }

    private void showStaffEmailForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RequestDispatcher rd = request.getRequestDispatcher("/Authentication/staffAuthentication.jsp");
        rd.forward(request, response);
    }

    private void confirmStaffEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");

        Staff s = staffDAO.checkStaffEmail(email);

        if (s == null) {
            request.setAttribute("error", "Only staff can register.");
            RequestDispatcher rd = request.getRequestDispatcher("/Authentication/staffAuthentication.jsp");
            rd.forward(request, response);
        } else {
            int staffId = s.getId();
            request.setAttribute("staff_id", staffId);
            RequestDispatcher rd = request.getRequestDispatcher("/Authentication/register.jsp");
            rd.forward(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User newUser = new User(id, username, password, role);
        userDAO.register(newUser);

        RequestDispatcher rd = request.getRequestDispatcher("/Authentication/login.jsp");
        rd.forward(request, response);
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        response.sendRedirect(request.getContextPath() + "/index.html");
    }
}
