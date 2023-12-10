/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dbaccess.MediaDAO;
import dbaccess.TradeDAO;
import dbaccess.Trade_CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Trade;
import model.Trade_Category;

/**
 *
 * @author overw
 */
public class LoadAllTradeController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String status = request.getParameter("status");
            ArrayList<Trade> listTrade = new ArrayList<>();
            ArrayList<Trade_Category> listCate = Trade_CategoryDAO.getAllTradeCate();

            String url = "DispatcherController?action=trade-page";
            if (status == null || status.isEmpty()) {
                request.setAttribute("CATE", listCate);
                String type = request.getParameter("type");
                String cateString = request.getParameter("filter");
                int cate = 0;
                if (cateString == null || cateString.isEmpty()) {
                    cate = 1;
                } else {
                    cate = Integer.parseInt(cateString.trim());
                }
                if (type == null || type.isEmpty()) {
                    if (cateString == null || cateString.isEmpty()) {
                        listTrade = TradeDAO.getAllTrade("Approved");
                    } else {
                        listTrade = TradeDAO.getAllTradeByCate(cate);
                    }
                } else if (type.equals("fee")) {
                    if (cateString == null || cateString.isEmpty()) {
                        listTrade = TradeDAO.getAllTradeByType(type.trim(), "Approved");
                    } else {
                        listTrade = TradeDAO.getAllTradeByTypeAndCate(type.trim(), "Approved", cate);
                    }
                } else if (type.equals("gift")) {
                    if (cateString == null || cateString.isEmpty()) {
                        listTrade = TradeDAO.getAllTradeByType(type.trim(), "Approved");
                    } else {
                        listTrade = TradeDAO.getAllTradeByTypeAndCate(type.trim(), "Approved", cate);
                    }
                }
                request.setAttribute("TRADES", listTrade);
            } else {
                listTrade = TradeDAO.getAllTrade("Created");
                request.setAttribute("TRADES", listTrade);
                url = "DispatcherController?action=staff-manage-trade";
            }
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
