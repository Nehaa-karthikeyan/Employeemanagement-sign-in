
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Search() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?useSSL=false", "root",
                    "root");

            PreparedStatement ps = con.prepareStatement("select * from users where id = ?");

            ps.setInt(1, id);

            out.print("<div style='background-color: #f0f0f0; padding: 20px;'>"); // Background color and padding added
            out.print("<table width='100%' border='1' style='border-collapse: collapse;'>"); // Table width and border-collapse added
            out.print("<caption><strong>The required user:</strong></caption>");

            ResultSet rs = ps.executeQuery();

            ResultSetMetaData rsmd = rs.getMetaData();
            int totalColumn = rsmd.getColumnCount();
            out.print("<tr>");
            for (int i = 1; i <= totalColumn; i++) {
                out.print("<th>" + rsmd.getColumnName(i) + "</th>");
            }
            out.print("<tr>");
            while (rs.next()) {
                out.print("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3)
                        + "</td><td>" + rs.getString(4) + "</td></tr>");
            }
            out.print("</table>");
            out.print("</div>");

        } catch (Exception e) {
            out.print(e);
        }
    }
}





