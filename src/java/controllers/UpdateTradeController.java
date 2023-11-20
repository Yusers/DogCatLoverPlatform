/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dbaccess.MediaDAO;
import dbaccess.Post_CategoryDAO;
import dbaccess.TradeDAO;
import java.util.Arrays;
import dbaccess.Trade_CategoryDAO;
import dbaccess.Trade_MediaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.stream.Collectors;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import model.Media;
import model.Trade;
import model.Trade_Category;

/**
 *
 * @author overw
 */
public class UpdateTradeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String id = request.getParameter("id");
            int post_id = Integer.parseInt(id.trim());
            String title = request.getParameter("title");
            String category = request.getParameter("category");
            int cate_id = Integer.parseInt(request.getParameter("cate_id"));
            String content = request.getParameter("content");
            String author = request.getParameter("author");
            String condition = request.getParameter("condition");
            String type = request.getParameter("type");
            String priceString = request.getParameter("price");
            String url = "DispatcherController?action=my-post";
            String listValues = request.getParameter("listValues");
            List<String> listMedia = List.of(listValues.split(","));
            List<Integer> listMediaId = parseNumericList(listMedia);
            Trade_Category existed = Trade_CategoryDAO.getTradeCategory(category);

            int price = 0;
            boolean flag = false;

            request.setAttribute("ACTION", "Update");
            int rs = 0;
            String urlImg;
            out.print("List media: " + listMediaId + "<br/>");
            if (content.length() >= 20) {
                if (category.trim().length() < 1) {
                    request.setAttribute("ERR_CONTENT", "Phần loại bài viết không đc để trống và khoảng trắng và trên 10 ký tự!");
                    flag = true;
                } else if (condition.trim().length() < 10) {
                    request.setAttribute("ERR_CONTENT", "Phần tình trạng không đc để trống và khoảng trắng và trên 10 ký tự!");
                    flag = true;
                } else if (type.equals("fee")) {
                    if (priceString.trim().length() < 1) {
                        request.setAttribute("ERR_CONTENT", "Vui lòng điền giá!");
                        flag = true;
                    } else {
                        String formattedPrice = priceString.replaceAll(",", "").trim(); // Remove commas
                        price = Integer.parseInt(formattedPrice); // Parse the integer
                        if (price <= 1000) {
                            request.setAttribute("ERR_CONTENT", "Vui lòng điền giá trên 1000 vì đây là hình thức trả phí!");
                            flag = true;
                        }
                    }
                }
                if (flag) {
                    request.getRequestDispatcher("DispatcherController?action=trade-details&id=" + id + "&edit=true&type=" + type).forward(request, response);
                }
                flag = false;
                ArrayList<String> urls = new ArrayList<>();
                ArrayList<String> fileNames = new ArrayList<>();
                Collection<Part> fileParts = request.getParts();
                for (Part filePart : fileParts) {
                    String fileName = getFileName(filePart);
                    if (!fileName.isEmpty()) {
                        String filePath = getServletContext().getRealPath("/") + "/img/" + fileName;
                        filePart.write(filePath);

                        String contextPath = request.getContextPath();
                        urlImg = "http://localhost:8080" + contextPath + "/img/" + fileName;

                        urls.add(urlImg);
                        fileNames.add(fileName);
                        out.print("url: " + url + "<br/>");
                        out.print("filename: " + fileName + "<br/>");
                        flag = true;
                    } else {
                        // User did not upload a file
                        // Handle this case if needed
                        out.print("nothing update");
                    }
                }
                out.print("flag: " + flag + "<br/>");
                rs = 0;
                if (flag) {
                    ArrayList<Media> listM = new ArrayList<>();
                    for (int i = 0; i < urls.size(); i++) {
                        urlImg = urls.get(i);
                        String fileName = fileNames.get(i);
                        // Check if the file is not empty before updating
                        if (listMediaId.isEmpty() || listMediaId.size() > 0) {
                            MediaDAO.insertMedia(urlImg, fileName);
                            listM.add(MediaDAO.getMediaByName(fileName));
                        } else {
                            MediaDAO.updateMedia(listMediaId.get(i), urlImg, fileName);
                            // Only update trade_media if a new file is uploaded
                            rs = Trade_MediaDAO.updateTradeMedia(Trade_MediaDAO.getTradeMediaByTradeIdAndMediaId(post_id, listMediaId.get(i)).getId(), post_id, listMediaId.get(i));
                        }
                    }

                    for (Media media : listM) {
                        rs = Trade_MediaDAO.insertTradeMedia(post_id, media.getId());
                    }
                }
                if (rs > 0) {
                    request.setAttribute("MSG", "Tạo thành công!");
                } else {
                    request.setAttribute("MSG", "Tạo thất bại!");
                }

                if (existed != null) {
                    TradeDAO.updateTrade(new Trade(post_id, author, title, content, "Created", existed.getId(), type, price, condition));
                    flag = true;
                } else {
                    rs = Trade_CategoryDAO.createTradeCategory(category);
                    if (rs > 0) {
                        TradeDAO.updateTrade(new Trade(post_id, author, title, content, "Created", Trade_CategoryDAO.getTradeCategory(category).getId(), type, price, condition));
                        flag = true;
                    } else {
                        flag = false;
                    }
                }
            } else {
                flag = false;
                url = "DispatcherController?action=trade-edit-page";
            }
            if (flag) {
                request.setAttribute("STATUS", true);
                request.setAttribute("MSG", "update successfully!");
            } else {
                request.setAttribute("STATUS", false);
                request.setAttribute("MSG", "update successfully!");
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return "";
    }

    public static List<Integer> parseNumericList(List<String> inputList) {
        List<Integer> values = new ArrayList<>();

        for (String item : inputList) {
            // Remove any non-numeric characters and trim spaces
            String cleanedItem = item.replaceAll("[^0-9]", "").trim();

            try {
                // Parse the cleaned item as an Integer
                int intValue = Integer.parseInt(cleanedItem);
                values.add(intValue);
            } catch (NumberFormatException e) {
                // Handle the case where parsing as an Integer fails
                System.err.println("Failed to parse as Integer: " + cleanedItem);
            }
        }

        return values;
    }

}
