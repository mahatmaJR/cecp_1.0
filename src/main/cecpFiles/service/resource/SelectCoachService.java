package service.resource;

import DAO.interfaces.CenterRepository;
import DAO.interfaces.CoachRepository;
import DAO.interfaces.TraineeRepository;
import model.TraineeModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/select")
public class SelectCoachService {

    @EJB
    TraineeRepository traineeRepo;

    @EJB
    CoachRepository coachRepo;

    @EJB
    CenterRepository centerRepo;

    @Path("/coachDetail")
    @POST
    public void selectedCoachByTrainee(@Context HttpServletRequest req, @Context HttpServletResponse res) throws ServletException, IOException {

        try {
            int coachId = Integer.parseInt(req.getParameter("coachId"));
            int traineeId = Integer.parseInt( req.getParameter("sessionTraineeId"));

            TraineeModel trainee = traineeRepo.findTraineeRecord(traineeId);

            coachRepo.addTraineeToCoach(coachId, trainee);
        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, res);
            System.out.println(e);

        }

    }

    @Path("/centerDetail")
    @POST
    public void selectedCenterByTrainee(@Context HttpServletRequest req, @Context HttpServletResponse res) throws ServletException, IOException {

        try{
            int centerId = Integer.parseInt(req.getParameter("centerId"));
            int traineeId = Integer.parseInt( req.getParameter("sessionTraineeId"));

            TraineeModel trainee = traineeRepo.findTraineeRecord(traineeId);

            centerRepo.addTraineeToCenter(centerId, trainee);

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, res);
            System.out.println(e);

        }

    }

}
