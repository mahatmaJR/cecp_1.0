package service.resource;

import DAO.interfaces.AdminRepository;
import model.AdminModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/admin")
public class AdminService {

    @EJB
    AdminRepository adminRepo;

    @Path("/addAdmin")
    @POST
    public void registerAdmin(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            String firstName = req.getParameter("fName");
            String lastName = req.getParameter("lName");
            String surname = req.getParameter("surname");
            String address = req.getParameter("address");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phoneNumber");
            String hierarchy = req.getParameter("hierarchy");

            String userName = req.getParameter("username");
            String password = req.getParameter("pass");
            String confirmPassword = req.getParameter("confPass");

            if (adminRepo.findLoginRecord(userName) != null){

                redirectToAlertUserExist(req, resp);

            }else if (!password.equals(confirmPassword)){

                redirectToAlertPasswordDintMatch(req, resp);

            }else {

                AdminModel admin = adminRepo.addAdminRecord(firstName, surname, lastName, address, email, phoneNumber, hierarchy, userName, password, confirmPassword);
                resp.sendRedirect("/cecp/login");

            }

        } catch (Exception e){

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
