package service.resource;

import DAO.interfaces.CourseRepository;
import DAO.interfaces.EnrollTraineeRepository;
import model.CourseModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Path("/enroll")
public class EnrollmentService {

    @EJB
    EnrollTraineeRepository enrollTraineeRepo;

    @EJB
    CourseRepository courseRepo;

    @Path("/newEnrollmentDetail")
    @POST
    public void newEnrollmentDetail(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {
        try{
            String certLevel = req.getParameter("certLevel");
            int traineeId = Integer.parseInt(req.getParameter("traineeId"));
            String [] selectedCoursesId = req.getParameterValues("courseUnit");

            Set<CourseModel> selectedCourses = new HashSet<>();

            for (String s : selectedCoursesId) {
                CourseModel course = courseRepo.findCourseById(Integer.parseInt(s));
                selectedCourses.add(course);
            }
            enrollTraineeRepo.newEnrollmentRecord(certLevel, traineeId, selectedCourses);

            req.getRequestDispatcher("/traineePortal").forward(req, resp);

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println(e);

        }

    }
}
