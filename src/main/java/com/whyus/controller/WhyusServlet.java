package com.whyus.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

import com.whyus.model.Whyus;
import com.whyus.model.dao.WhyusDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/whyus")
@MultipartConfig
public class WhyusServlet extends HttpServlet {

    private WhyusDao dao = new WhyusDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String title = req.getParameter("title");
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

        Whyus w = new Whyus();
        w.setTitle(title);
        w.setDescription(desc);
        w.setImage(imagePath);

        try {
            dao.addWhyus(w);
            resp.sendRedirect("dashboard?page=adminwhyus");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
