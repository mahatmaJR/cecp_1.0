package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "payment_detail")
public class PaymentModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "payment_id")
    int paymentId;

    @Column(name = "paid_amount")
    double paidAmount;

    @Column(name = "paid_date")
    @Temporal(TemporalType.TIMESTAMP)
    Date paidDate;

    @Column(name = "payment_transaction_code")
    String paymentTransactionCode;

    @ManyToOne
    @JoinColumn(name = "trainee_ref", referencedColumnName = "trainee_id")
    TraineeModel traineeMakingPayment;

    @ManyToOne
    @JoinColumn(name = "enrollment_ref", referencedColumnName = "enrollment_id")
    EnrollTraineeModel enrollmentPaymentReference;

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public Date getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Date paidDate) {
        this.paidDate = paidDate;
    }

    public String getPaymentTransactionCode() {
        return paymentTransactionCode;
    }

    public void setPaymentTransactionCode(String paymentTransactionCode) {
        this.paymentTransactionCode = paymentTransactionCode;
    }

    public TraineeModel getTraineeMakingPayment() {
        return traineeMakingPayment;
    }

    public void setTraineeMakingPayment(TraineeModel traineeMakingPayment) {
        this.traineeMakingPayment = traineeMakingPayment;
    }

    public EnrollTraineeModel getEnrollmentPaymentReference() {
        return enrollmentPaymentReference;
    }

    public void setEnrollmentPaymentReference(EnrollTraineeModel enrollmentReference) {
        this.enrollmentPaymentReference = enrollmentReference;
    }
}
