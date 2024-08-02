import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNo = request.getParameter("account_no");
        String password = request.getParameter("temporary_password");
        boolean isValidCustomer = validateCustomer(accountNo, password);

        if (isValidCustomer) {
            HttpSession session = request.getSession();
            session.setAttribute("account_no", accountNo);
            response.sendRedirect("customerDashboard.jsp");
        } else {
            response.sendRedirect("loginFailure.jsp?loginType=customer");
        }
    }

    private boolean validateCustomer(String accountNo, String password) {
        boolean status = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingdb", "root", "qwerty");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customer WHERE account_no=? AND temporary_password=?");
            ps.setString(1, accountNo);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
