package DAO.interfaces;

import model.PaymentModel;

import javax.ejb.Local;
import java.util.Date;

@Local
public interface PaymentRepository {
    PaymentModel newPaymentRecord(double paidAmount, Date datePaid, String paymentTransactionCode,  int traineeId, int enrollmentId);
    PaymentModel savePaymentRecord(PaymentModel payment);
    PaymentModel findPaymentRecord(int paymentId);
}