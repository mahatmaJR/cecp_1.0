package service.resource;

import DAO.interfaces.CenterRepository;
import model.CoachModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/center")
public class CenterService {

    @EJB
    CenterRepository centerRepo;

    @Path("/addCenter")
    @POST
    public void addCenterRecord(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            String centerName = req.getParameter("centerName");
            String centerLocation = req.getParameter("centerLocation");

            centerRepo.registerCenter(centerName, centerLocation);

            resp.sendRedirect("/cecp/adminPanel");

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println(e);

        }



    }
}
