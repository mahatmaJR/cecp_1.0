package service.resource;

import DAO.interfaces.PaymentRepository;
import model.CoachModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;
import java.util.Date;

@Path("/payment")
public class PaymentService {

    @EJB
    PaymentRepository paymentRepo;

    @Path("/paymentRecord")
    @POST
    public void addPaymentRecord(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            String transactionCode = req.getParameter("transactionCode");
            Double paidAmount = Double.parseDouble(req.getParameter("paidAmount"));
            int traineeMakingPayment = Integer.parseInt(req.getParameter("traineeMakingPayment"));
            int enrollmentPaymentReference = Integer.parseInt(req.getParameter("enrollmentPaymentReference"));
            Date datePaid = new Date();

            paymentRepo.newPaymentRecord(paidAmount, datePaid,transactionCode, traineeMakingPayment, enrollmentPaymentReference);

            req.getRequestDispatcher("/adminPanel").forward(req, resp);

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            System.out.println(e);

        }
    }
}
