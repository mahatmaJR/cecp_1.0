package service.resource;

import DAO.interfaces.CorporateEngagementRepository;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;
import java.util.Date;

@Path("/corporate")
public class CorporateEngagementService {

    @EJB
    CorporateEngagementRepository corporateEngagementRepo;

    @Path("/saveCorporateInfo")
    @POST
    public void saveCorporateInfo(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            String companyName = req.getParameter("companyName");
            String companyEmail = req.getParameter("companyEmail");
            String contactPerson = req.getParameter("contactPerson");
            String phoneNumber = req.getParameter("phoneNumber");
            String clientRequirement = req.getParameter("clientRequirement");
            Date dateRegistered = new Date();

            corporateEngagementRepo.newCorporateEngagementRecord(companyName, companyEmail, contactPerson, phoneNumber, clientRequirement, dateRegistered);

            String msg = "Thank you " + contactPerson + " for choosing CECP to improve your company's image. We will reach out to understand more of your requirements soon!";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);

        }catch (Exception e) {

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println(e);

        }

    }

}
