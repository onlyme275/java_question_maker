import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.hero.model.Hero;
import com.hero.model.dao.HeroDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/hero")
@MultipartConfig
public class HeroServlet extends HttpServlet {

    private HeroDao dao = new HeroDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        String desc = req.getParameter("description");

        // IMAGE UPLOAD PART
        Part filePart = req.getPart("image");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Save path inside project (change if needed)
        String uploadPath = getServletContext().getRealPath("") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;

        filePart.write(filePath);

        // Store relative path for DB
        String imagePath = "uploads/" + fileName;

        Hero h = new Hero();
        h.setTitle(title);
        h.setDescription(desc);
        h.setImage(imagePath);

        try {
            dao.addHero(h);
            resp.sendRedirect("dashboard?page=adminhero");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}