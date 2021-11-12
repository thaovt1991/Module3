import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name ="DiscountServlet", value = "/display-discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDes = req.getParameter("productDescription") ;
        Double price = Double.parseDouble(req.getParameter("listPrice")) ;
        Double rate = Double.parseDouble(req.getParameter("discountPercent")) ;
        double Discount_Amount = price * rate * 0.01 ;
        PrintWriter writer = resp.getWriter() ;
        writer.println("<html>");
        writer.println("Thong tin san pham : " + productDes);
        writer.println("<br>") ;
        writer.println("Discount Amount: " + Discount_Amount );
        writer.println("<br>") ;
        writer.println("Discount Price: " + (price - Discount_Amount));
        writer.println("</html>");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
