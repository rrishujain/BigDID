/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tanmay
 */
public class login extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
         String name = request.getParameter("user");
         String pass = request.getParameter("pass");

         if(name.equals("admin") && pass.equals("pass")){
             
              HttpSession session = request.getSession(true);
              session.setAttribute("username", name);
              session.setAttribute("password", pass);
              response.sendRedirect("jsp/tab1.jsp");
         }
         else{
              response.sendRedirect("index.jsp");
         }
    }

  
}