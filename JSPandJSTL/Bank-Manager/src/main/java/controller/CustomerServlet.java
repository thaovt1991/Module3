package controller;

import model.Customer;
import model.Transfer;
import service.CustomerService;
import service.CustomerServiceImpl;
import service.TransferService;
import service.TransferServiceImpl;
//import units.FormatForm ;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService = new CustomerServiceImpl();
    private TransferService transferService = new TransferServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "deposit":
                deposit(request, response);
                break;
            case "withdraw":
                withdraw(request, response);
                break;
            case "transfer":
                transfer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                break;
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "transfers_list":
                showTransferMoneyInformation(request, response);
                break;
            case "deposit":
                showDeposit(request, response);
                break;
            case "withdraw":
                showWithdraw(request, response);
                break;
            case "transfer":
                showTransfer(request, response);
                break;
            default:
                listCustomers(request, response);
                break;
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = this.customerService.findAll();
        request.setAttribute("customers", customers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String full_name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (full_name == "") {
            request.setAttribute("messageFullName", "* Khong duoc de trong ten ");
        }

        if (email == "") {
            request.setAttribute("messageEmail", "* Khong duoc de trong email ");
        }
//        if(){
//            request.setAttribute("messageEmail","* Khong duoc de trong email ");
//        }
        int id = 1;
        do {
            id = (int) (Math.random() * 1000);
        } while (customerService.findById(id) != null);
        if (full_name != "" && email != "") {
            Customer customer = new Customer(id, full_name, email, phone, address, 0);
            customerService.save(customer);
            request.setAttribute("message", " **** Them khach hang thanh cong ");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String full_name = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (full_name == null) {
            request.setAttribute("messageFullName", "* Khong duoc de trong ten ");
        }
        if (email == null) {
            request.setAttribute("messageEmail", "* Khong duoc de trong email ");
        }
        if (full_name != "" && email != "") {
            customer.setFullName(full_name);
            customer.setEmail(email);
            customer.setPhone(phone);
            customer.setAddress(address);
            this.customerService.update(id, customer);
            request.setAttribute("customer", customer);
            request.setAttribute("message", " **** Update thanh cong ");
            dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        } else
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("customer/delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.customerService.remove(id);
            dispatcher = request.getRequestDispatcher("customer/delete.jsp");
//            try {
//                response.sendRedirect("/customers");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showTransferMoneyInformation(HttpServletRequest request, HttpServletResponse response) {
        List<Transfer> transfers = this.transferService.findAll();
        request.setAttribute("transfers", transfers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/transfers_list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeposit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/deposit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deposit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        long amountDeposit = Long.parseLong(request.getParameter("transferAmount"));
        if (amountDeposit > 0) {
            customer.setBalance(customer.getBalance() + amountDeposit);
            customerService.update(id, customer);
            request.setAttribute("message", "Deposit success !");
        } else {
            request.setAttribute("customer", customer);
            request.setAttribute("messageError", "So tien nap phai lon hon 0 !");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/deposit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showWithdraw(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/withdraw.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void withdraw(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);

        if (customer.getBalance() <= 50000) {
            request.setAttribute("customer", customer);
            request.setAttribute("messageError", "So tien khong du de thuc hien giao dich !");
        } else {
            long amountDeposit = Long.parseLong(request.getParameter("transferAmount"));
            if (customer.getBalance() - 50000 >= amountDeposit && amountDeposit > 0) {
                customer.setBalance(customer.getBalance() - amountDeposit);
                customerService.update(id, customer);
                request.setAttribute("message", "Withdraw suscess !");
            } else {
                request.setAttribute("customer", customer);
                if (amountDeposit <= 0) {
                    request.setAttribute("messageError", "So tien rut phai lon hon 0 ");
                }
                if (amountDeposit > customer.getBalance() - 50000) {
                    request.setAttribute("messageError", "So tien khong du de thuc hien giao dich ");
                }
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/withdraw.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showTransfer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customerSender = customerService.findById(id);
        request.setAttribute("customer", customerSender);

        List<Customer> customersList = customerService.findAll();
        request.setAttribute("customers", customersList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/transfer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void transfer(HttpServletRequest request, HttpServletResponse response) {
        int idSender = Integer.parseInt(request.getParameter("id"));
        Customer customerSender = customerService.findById(idSender);
        String name_Serder = customerSender.getFullName();

        int idRecipient = 0;
        try {
            idRecipient = Integer.parseInt(request.getParameter("idRecipient"));
        } catch (Exception e) {
            idRecipient = 0;
        }
        Customer customerRecipient = customerService.findById(idRecipient);
        String name_Recipient = "";
        if (customerRecipient != null) {
           name_Recipient = customerRecipient.getFullName();
        }
        long balance_Sender = customerSender.getBalance();
//        int fees = Integer.parseInt(request.getParameter("fees"));
        int fees = 10;
        List<Customer> customersList = customerService.findAll();
        if (idRecipient == 0) {
            request.setAttribute("customer", customerSender);
            request.setAttribute("customers", customersList);
            request.setAttribute("messageError", "** Hay chon nguoi ban muon chuyen tien");
        } else {
            if (balance_Sender <= 50000) {
                request.setAttribute("customer", customerSender);
                request.setAttribute("customers", customersList);
                request.setAttribute("messageError", "** So tien khong du de thuc hien giao dich");
            } else {
                long amount_transfer = Long.parseLong(request.getParameter("transferAmount"));
                long totalTransfer = amount_transfer * (fees + 100) / 100;
                if (balance_Sender - 50000 >= totalTransfer && amount_transfer > 0) {
                    customerSender.setBalance(balance_Sender - totalTransfer);
                    customerService.update(idSender, customerSender);
                    customerRecipient.setBalance(customerRecipient.getBalance() + amount_transfer);
                    customerService.update(idRecipient, customerRecipient);
                    request.setAttribute("message", "** Giao dich chuyen khoan thanh cong !");

                    int idTransfer = 1;
                    do {
                        idTransfer = (int) (Math.random() * 10000);
                    } while (transferService.findById(idTransfer) != null);
                    Transfer transfer = new Transfer(idTransfer, idSender, name_Serder, idRecipient, name_Recipient, amount_transfer, fees);
                    transferService.save(transfer);
                } else {
                    if (amount_transfer <= 0) {
                        request.setAttribute("messageError", "** So tien giao dich phai lon hon 0");
                    }
                    if (totalTransfer > balance_Sender - 50000) {
                        request.setAttribute("messageError", "** So tien gaio dich vuot qua su du tai khoan");
                    }
                    request.setAttribute("customer", customerSender);
                    request.setAttribute("customers", customersList);
                }
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/transfer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
