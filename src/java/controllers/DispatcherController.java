package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Kuuga
 */
public class DispatcherController extends HttpServlet {

    final String HOME_PAGE = "index.jsp";
    final String ADMIN_PAGE = "adminpage.jsp";
    final String STAFF_PAGE = "staffpage.jsp";
    final String MY_POST_PAGE = "manage-threads.jsp";
    final String STAFF_PAGE = "staffpage.jsp";
    final String MY_POST_PAGE = "manage-threads.jsp";
    final String LOGIN_PAGE = "login.jsp";
    final String REGISTER_PAGE = "signup.jsp";
    final String FORUMS_PAGE = "forums.jsp";
    final String TRADE_PAGE = "tradepage.jsp";
    final String TRADE_CHAT = "chat.jsp";
    final String TRADE_DETAIL_PAGE = "tradingpage.jsp";

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = HOME_PAGE;
            String action = request.getParameter("action");
            if (action == null || action.isEmpty()) {
                url = HOME_PAGE;
            } else if (action.equals("login")) {
                url = "LoginController";
            } else if (action.equals("login-page")) {
                url = LOGIN_PAGE;
            } else if (action.equals("logout")) {
                url = "LogoutController";
            } else if (action.equals("register")) {
                url = "RegisterController";
            } else if (action.equals("register-page")) {
                url = REGISTER_PAGE;
            } else if (action.equals("manage")) {
                String usid = request.getParameter("usname");
                if (usid == null || usid.isEmpty()) {
                    url = "LoadAllUserController?actions=getAll";
                } else {
                    url = "LoadAllUserController";
                }
            } else if (action.equals("forums")) {
                url = "LoadAllPostController";
            } else if (action.equals("forums-page")) {
                url = FORUMS_PAGE;
            } else if (action.equals("thread")) {
                url = "LoadPostController";
            } else if(action.equals("create-post")) {
                url = "CreatePostController";
            } else if(action.equals("trade")) {
                url = "LoadAllTradeController";
            } else if(action.equals("trade-details")) {
                url = "LoadTradeController";
            } else if(action.equals("trade-page")) {
                url = TRADE_PAGE;
            } else if(action.equals("trade-detail-page")) {
                url = TRADE_DETAIL_PAGE;
            } else if(action.equals("trade-chat")) {
                url = TRADE_CHAT;
            } else if(action.equals("comment")) {
                url = "CreateCommentController";
            } else if(action.equals("create-conversation")) {
                url = "CreateConversationController";
            } else if(action.equals("create-message")) {
                url = "CreateMessageController";
            }
            // Chuyển hướng đến trang tương ứng với chức năng đã chọn
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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