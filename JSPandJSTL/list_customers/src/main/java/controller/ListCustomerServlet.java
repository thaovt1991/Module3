package controller;

import model.Customers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

 @WebServlet(name = "ListCustomerServlet", urlPatterns = "/list_customer")
public class ListCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req,resp);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customers> customers = new ArrayList<>();

        customers.add(new Customers("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "/image/img1.jpeg"));
        customers.add(new Customers("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "/image/img2.jpeg"));
        customers.add(new Customers("Nguyễn Thái Hóa", "1983-08-22", "Nam Định", "/image/img3.jpeg"));
        customers.add(new Customers("Trần Đăng Khoa", "1983-08-16", "Hà Tây", "/image/img4.jpeg"));
        customers.add(new Customers("Nguyễn Đình Thi", "1983-08-18", "Hà Nội", "/image/img5.jpg"));

          request.setAttribute("list", customers);

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);

    }

}
