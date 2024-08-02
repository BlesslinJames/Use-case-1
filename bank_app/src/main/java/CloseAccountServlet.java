import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingdb", "root", "qwerty");
            PreparedStatement ps = con.prepareStatement("DELETE FROM Customer WHERE account_no = ?");
            ps.setString(1, accountNo);
            ps.executeUpdate();

            session.invalidate();
            response.sendRedirect("customerLogin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
