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

    String error;

    @Path("/newEnrollmentDetail")
    @POST
    public void newEnrollmentDetail(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            Set<CourseModel> selectedCourses = new HashSet<>();
            String certLevel = req.getParameter("certLevel");
            int traineeId = Integer.parseInt(req.getParameter("traineeId"));
            String [] selectedCoursesId = req.getParameterValues("courseUnit");


            for (int i = 0; i < selectedCoursesId.length; i++) {
                if (selectedCoursesId[i] != null && selectedCoursesId[i] != "") {
                    CourseModel course = courseRepo.findCourseById(Integer.parseInt(selectedCoursesId[i]));
                    selectedCourses.add(course);
                }
            }
            enrollTraineeRepo.newEnrollmentRecord(certLevel, traineeId, selectedCourses);
            resp.sendRedirect("/cecp/traineePortal");

        } catch (Exception e) {

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified" + error;
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println( "Finally you caught me" + e + error);

        }
    }
}
