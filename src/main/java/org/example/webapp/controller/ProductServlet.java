package org.example.webapp.controller;

import org.example.webapp.dao.ProductDAO;
import org.example.webapp.models.Product;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = ProductDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/view/products.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            Product product = new Product(0, name, price);
            ProductDAO.addProduct(product);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            Product product = new Product(id, name, price);
            ProductDAO.updateProduct(product);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductDAO.deleteProduct(id);
        }
        response.sendRedirect("products");
    }
}