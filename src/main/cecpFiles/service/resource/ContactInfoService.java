package service.resource;

import DAO.interfaces.ClientContactRepository;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;
import java.util.Date;

@Path("/contact")
public class ContactInfoService {

    @EJB
    ClientContactRepository clientContactRepo;

    @Path("/saveContactInfo")
    @POST
    public void addContactInfo(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try{

            String userEmail = req.getParameter("enquirerEmail");
            String userFullName = req.getParameter("enquirerName");
            String subject = req.getParameter("subject");
            String message = req.getParameter("message");
            Date dateRegistered = new Date();

            clientContactRepo.newClientContactRecord(userEmail, userFullName, subject, message, dateRegistered);

            String msg = "Thank you " + userFullName + " for Choosing CECP to improve your image. We hope to hear more from you soon!";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println(e);

        }

    }
}
