package com.about.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

import com.about.model.About;
import com.about.model.dao.AboutDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/about")
@MultipartConfig
public class AboutServlet extends HttpServlet {

    private AboutDao dao = new AboutDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String desc = req.getParameter("description");

        // IMAGE UPLOAD PART
        Part filePart = req.getPart("image");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Save path inside project
        String uploadPath = getServletContext().getRealPath("") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;

        filePart.write(filePath);

        // Store relative path for DB
        String imagePath = "uploads/" + fileName;

        About a = new About();
        a.setName(name);
        a.setDescription(desc);
        a.setImage(imagePath);

        try {
            dao.addAbout(a);
            resp.sendRedirect("dashboard?page=adminabout");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
