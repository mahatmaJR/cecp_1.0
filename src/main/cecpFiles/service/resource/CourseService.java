package service.resource;

import DAO.interfaces.CourseRepository;
import model.CoachModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/course")
public class CourseService {
    @EJB
    CourseRepository courseRepo;

    @Path("/addCourse")
    @POST
    public void addCourseRecord(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            String courseName = req.getParameter("courseName");
            String certLevel = req.getParameter("certLevel");
            String courseDescription = req.getParameter("courseDescription");

            courseRepo.registerCourse(courseName, certLevel, courseDescription);

            req.getRequestDispatcher("/adminPanel").forward(req, resp);

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            e.printStackTrace();

        }
    }
}
