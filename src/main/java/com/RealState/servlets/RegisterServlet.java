package com.RealState.servlets;

import java.io.*;
import java.nio.file.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import org.json.simple.*;
import org.json.simple.parser.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        
        // Create JSON object with user data
        JSONObject userData = new JSONObject();
        userData.put("firstName", firstName);
        userData.put("lastName", lastName);
        userData.put("email", email);
        userData.put("phone", phone);
        userData.put("password", password);
        
        // Determine which file to update based on user type
        String filePath;
        if ("agent".equals(userType)) {
            filePath = getServletContext().getRealPath("/WEB-INF/agent.json");
        } else {
            filePath = getServletContext().getRealPath("/WEB-INF/buyer.json");
        }
        
        File jsonFile = new File(filePath);
        
        // Create JSON array to store users
        JSONArray userList = new JSONArray();
        
        // If file exists, read existing data
        if (jsonFile.exists()) {
            try (FileReader reader = new FileReader(jsonFile)) {
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(reader);
                userList = (JSONArray) obj;
            } catch (Exception e) {
                // If parsing fails, start with empty array
                userList = new JSONArray();
            }
        }
        
        // Add new user to the array
        userList.add(userData);
        
        // Ensure directory exists
        jsonFile.getParentFile().mkdirs();
        
        // Write updated JSON back to file
        try (FileWriter file = new FileWriter(jsonFile)) {
            file.write(userList.toJSONString());
            file.flush();
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save user data");
            return;
        }
        
        // Redirect to success page or login page
        response.sendRedirect("login.jsp?registered=true");
    }
}