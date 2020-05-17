package service.resource;

import DAO.interfaces.TraineeRepository;
import model.TraineeModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/trainee")
public class TraineeService {

    @EJB
    TraineeRepository traineeRepo;

    @Path("/addTrainee")
    @POST
    public void addTrainee(@Context HttpServletRequest request, @Context HttpServletResponse response) throws IOException, ServletException {

        try {

            String firstName = request.getParameter("fName");
            String lastName = request.getParameter("lName");
            String surname = request.getParameter("surname");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("mobileNo");
            String certLevel = request.getParameter("certificationLevel");


            String userName = request.getParameter("username");
            String password = request.getParameter("pass");
            String confirmPassword = request.getParameter("confPass");
            String role = request.getParameter("certificationLevel");

            if (traineeRepo.findLoginRecord(userName) != null){

                redirectToAlertUserExist(request, response);

            }else if (!password.equals(confirmPassword)){

                redirectToAlertPasswordDintMatch(request, response);

            }else {

                TraineeModel trainee = traineeRepo.newTraineeRecord(firstName, surname, lastName, address, email, phoneNumber, certLevel, userName, password, confirmPassword, role);
                HttpSession session = request.getSession();
                session.setAttribute("loggedTrainee", trainee);
                session.setMaxInactiveInterval(10*60);
                Cookie coachCookie = new Cookie("user", userName);
                coachCookie.setMaxAge(10*60);
                response.addCookie(coachCookie);
                request.getRequestDispatcher("/traineePortal").forward(request, response);

            }

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/msgDisplay").forward(request, response);

        }

    }

    @Path("/messageDisplay")
    @POST
    public void redirectToAlertUserExist(@Context HttpServletRequest req, @Context HttpServletResponse res) throws WebApplicationException, IOException, ServletException {

        String msg = "A User Already Exist With That Username!";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("/msgDisplay").forward(req, res);
    }

    @Path("/messageDisplay")
    @POST
    public void redirectToAlertPasswordDintMatch(@Context HttpServletRequest req, @Context HttpServletResponse res) throws WebApplicationException, IOException, ServletException {

        String msg = "The passwords provided did not match!";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("/msgDisplay").forward(req, res);
    }

}
