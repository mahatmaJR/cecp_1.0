package service.resource;

import DAO.interfaces.AdminRepository;
import DAO.interfaces.CoachRepository;
import DAO.interfaces.LoginRepository;
import DAO.interfaces.TraineeRepository;
import model.AdminModel;
import model.CoachModel;
import model.LoginModel;
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
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@Path("/auth")
public class LoginService {

    @EJB
    AdminRepository adminRepo;

    @EJB
    CoachRepository coachRepo;

    @EJB
    LoginRepository loginRepo;

    @EJB
    TraineeRepository traineeRepo;

    @Path("/UserPortal")
    @POST
    public void checkingLoginDetail(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException, InvalidKeySpecException, NoSuchAlgorithmException {

        try {


            String userName = req.getParameter("username");
            String password = req.getParameter("password");
            HttpSession session = req.getSession();

            if (loginRepo.authenticateUser(userName, password)) {
                LoginModel model = loginRepo.findLoginRecord(userName);
                String ROLE = model.getRole();
                switch (ROLE){
                    case "Administrator" :

                        AdminModel admin = adminRepo.findLoginRecord(userName).getAdministrator();
                        session.setAttribute("id", userName);
                        session.setAttribute("loggedAdmin", admin);
                        session.setMaxInactiveInterval(5*60);
                        Cookie adminCookie = new Cookie("user", userName);
                        adminCookie.setMaxAge(5*60);
                        resp.addCookie(adminCookie);
                        req.setAttribute("loggedAdmin", admin);
                        resp.sendRedirect("/cecp/adminPanel");
                        System.out.println("Admin " + admin + " just logged in.");
                        break;

                    case "Master_Coaching" :

                        CoachModel coach = coachRepo.findLoginRecord(userName).getCoach();
                        session.setAttribute("id", userName);
                        session.setAttribute("loggedCoach", coach);
                        session.setMaxInactiveInterval(5*60);
                        Cookie coachCookie = new Cookie("user", userName);
                        coachCookie.setMaxAge(5*60);
                        resp.addCookie(coachCookie);
                        req.setAttribute("loggedCoach", coach);
                        resp.sendRedirect("/cecp/coachPortal");
                        System.out.println("Coach " + coach + " just logged in.");
                        break;

                    default :

                        TraineeModel trainee = traineeRepo.findLoginRecord(userName).getTrainee();
                        session.setAttribute("id", userName);
                        session.setAttribute("loggedTrainee", trainee);
                        session.setMaxInactiveInterval(5*60);
                        Cookie traineeCookie = new Cookie("user", userName);
                        traineeCookie.setMaxAge(5*60);
                        resp.addCookie(traineeCookie);
                        req.setAttribute("loggedTrainee", trainee);
                        resp.sendRedirect("/cecp/traineePortal");
                        System.out.println("Trainee " + trainee + " just logged in.");

                }
            } else {
                redirectToMessageDisplay(req, resp);
            }

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            e.printStackTrace();

        }



    }

    @Path("/messageDisplay")
    @POST
    public void redirectToMessageDisplay(@Context HttpServletRequest req, @Context HttpServletResponse res) throws WebApplicationException, IOException, ServletException {

        String msg = "Username and Password did not match";
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("/msgDisplay").forward(req, res);

    }

}
