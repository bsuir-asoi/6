/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author moysy
 */
@WebServlet(urlPatterns = {"/MyServleter"})
public class MyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String inputWord = "", transWord = "";
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        inputWord="" + request.getParameter("inputWord");
        transWord="" + request.getParameter("trans");
        String newWord = MySQL.get(inputWord);

        
        if("null".equals(newWord)){
              out.println("<html>");
out.println("<head>");
out.println("<title>Servlet MyServlet</title>");
out.println("</head>"); 
out.println("<body bgcolor='#aaccff'");
out.println("<form>");
out.println("<h2> Нету в нашем словаре!!!</h2>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
    
        }
        
        if("".equals(inputWord)){
             out.println("<html>");
out.println("<head>");
out.println("<title>Servlet MyServlet</title>");
out.println("</head>"); 
out.println("<body bgcolor='#aaccff'");
out.println("<form>");
out.println("<h2> Вы ничего не ввели!!!</h2>");
out.println("</form>");
out.println("</body>");
out.println("</html>");
    
        }
        
        if(inputWord!=""){
        StringBuilder a = new StringBuilder();

        a.append("<!DOCTYPE html>\n" +
                "<html>\n" +
                "      <head>\n" +
                "        <title></title>\n" +
                "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                "    </head>\n" +
                "    <body bgcolor=\"#aaccff\">\n" +
                "        <Font color=\"green\" size=\"10\">\n" +
                "         Форма для работы со словарем\n" +
                "        </Font>\n" +
                "        <br>\n" +
                "        <br>\n" +
                "        <form name=\"frm\" method=\"Get\" action=\"MyServlet\">\n" +
                "            <Font color=\"blue\" size=\"6\">Слово:</Font><Input type=\"Text\" name=\"inputWord\" Value=\"" + inputWord + "\"/>\n" +
                "            <br>\n" +
                "            <br>\n" +
                "        <Font color=\"blue\" size=\"6\">Перевод:</Font><input type=\"text\" name =\"trans\" value=\""+newWord+"\"/disabled><br>\n" +
                "        <h4>Кликните здесь для получения перевода :<Input type=\"submit\" value=\"Перевести\"/>\n" +
                "        </h4>\n" +
                "           \n" +
                "        </form>\n" +
                "    </body>\n" +
                "</html>");

        inputWord = transWord = "";
        out.println(a);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
