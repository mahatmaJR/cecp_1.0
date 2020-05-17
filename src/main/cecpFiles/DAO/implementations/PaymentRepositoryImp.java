package DAO.implementations;

import DAO.interfaces.EnrollTraineeRepository;
import DAO.interfaces.PaymentRepository;
import DAO.interfaces.TraineeRepository;
import model.PaymentModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

@Stateless
public class PaymentRepositoryImp implements PaymentRepository {

    TraineeRepository traineeRepo;
    EnrollTraineeRepository enrollTraineeRepo;

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public PaymentModel newPaymentRecord(double paidAmount, Date datePaid, String paymentTransactionCode, int traineeId, int enrollmentId) {
        PaymentModel payment = new PaymentModel();
        payment.setPaidAmount(paidAmount);
        payment.setPaidDate(datePaid);
        payment.setPaymentTransactionCode(paymentTransactionCode);

        traineeRepo.findTraineeRecord(traineeId).addPaymentBeingMade(payment);

        enrollTraineeRepo.findEnrollmentRecord(enrollmentId).addPaymentsMadeForEnrollment(payment);

        em.persist(payment);

        return payment;
    }

    @Override
    public PaymentModel savePaymentRecord(PaymentModel payment) {
        return em.merge(payment);
    }

    @Override
    public PaymentModel findPaymentRecord(int paymentId) {
        return em.find(PaymentModel.class, paymentId);
    }
}
