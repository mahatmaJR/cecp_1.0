package service.resource;

import DAO.interfaces.CoachRepository;
import model.CoachModel;

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

@Path("/coach")
public class CoachService {

    @EJB
    CoachRepository coachRepo;

    @Path("/addCoach")
    @POST
    public void registerCoach(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws IOException, ServletException {

        try {

            String firstName = req.getParameter("fName");
            String lastName = req.getParameter("lName");
            String surname = req.getParameter("surname");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phoneNumber");
            String certLevel = req.getParameter("certLevel");
            String mccCertNo = req.getParameter("mcCertNo");

            String userName = req.getParameter("username");
            String password = req.getParameter("pass");
            String confirmPassword = req.getParameter("confPass");
            String role = req.getParameter("certificationLevel");

            if (coachRepo.findLoginRecord(userName) != null){

                redirectToAlertUserExist(req, resp);

            }else if (!password.equals(confirmPassword)){

                redirectToAlertPasswordDintMatch(req, resp);

            }else {

                CoachModel coach = coachRepo.newCoachRecord(firstName, surname, lastName, address, email, phoneNumber, certLevel, mccCertNo, userName, password, confirmPassword, role);
                HttpSession session = req.getSession();
                session.setAttribute("loggedCoach", coach);
                session.setMaxInactiveInterval(10*60);
                Cookie coachCookie = new Cookie("user", userName);
                coachCookie.setMaxAge(10*60);
                resp.addCookie(coachCookie);
                req.getRequestDispatcher("/coachPortal").forward(req, resp);

            }

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println(e);

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
