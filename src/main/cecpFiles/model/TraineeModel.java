package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "trainee_detail")
public class TraineeModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "trainee_id")
    int traineeId;

    @Column(name = "first_name")
    String firstName;

    @Column(name = "surname")
    String surname;

    @Column(name = "last_name")
    String lastName;

    @Column(name = "address")
    String address;

    @Column(name = "email")
    String email;

    @Column(name = "phone_number")
    String phoneNumber;

    @Column(name = "cert_level")
    String certLevel;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "username_ref", referencedColumnName = "username")
    LoginModel loginModel;

    @OneToMany(mappedBy = "enrollingTrainee", fetch = FetchType.EAGER)
    Set<EnrollTraineeModel> enrolledClasses = new HashSet<>();

    @OneToMany(mappedBy = "traineeMakingPayment", fetch = FetchType.EAGER)
    Set<PaymentModel> paymentsMade = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "center_ref", referencedColumnName = "center_id")
    CenterModel center;

    @ManyToOne
    @JoinColumn(name = "coach_ref", referencedColumnName = "coach_id")
    CoachModel coach;

    public TraineeModel() {
        super();
    }

    public TraineeModel(String firstName, String surname, String lastName, String address, String email, String phoneNumber, String certLevel) {
        this.firstName = firstName;
        this.surname = surname;
        this.lastName = lastName;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.certLevel = certLevel;
    }

    public int getTraineeId() {
        return traineeId;
    }

    public void setTraineeId(int traineeId) {
        this.traineeId = traineeId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCertLevel() {
        return certLevel;
    }

    public void setCertLevel(String certLevel) {
        this.certLevel = certLevel;
    }

    public LoginModel getLoginModel() {
        return loginModel;
    }

    public void setLoginModel(LoginModel loginModel) {
        this.loginModel = loginModel;
    }

    public Set<EnrollTraineeModel> getEnrolledClasses() {
        return enrolledClasses;
    }

    public void setEnrolledClasses(Set<EnrollTraineeModel> enrolledClasses) {
        this.enrolledClasses = enrolledClasses;
    }

    public Set<PaymentModel> getPaymentsMade() {
        return paymentsMade;
    }

    public void setPaymentsMade(Set<PaymentModel> paymentsMade) {
        this.paymentsMade = paymentsMade;
    }

    public CenterModel getCenter() {
        return center;
    }

    public void setCenter(CenterModel center) {
        this.center = center;
    }

    public CoachModel getCoach() {
        return coach;
    }

    public void setCoach(CoachModel coach) {
        this.coach = coach;
    }

    public void addEnrollClass(EnrollTraineeModel enrollTraineeModel){
        enrollTraineeModel.setEnrollingTrainee(this);
        enrolledClasses.add(enrollTraineeModel);
        this.setEnrolledClasses(enrolledClasses);
    }

    public void removeEnrollClass(EnrollTraineeModel enrollTraineeModel){
        enrollTraineeModel.setEnrollingTrainee(null);
        enrolledClasses.remove(enrollTraineeModel);
        this.setEnrolledClasses(enrolledClasses);
    }

    public void addPaymentBeingMade(PaymentModel payment){
        payment.setTraineeMakingPayment(this);
        paymentsMade.add(payment);
        this.setPaymentsMade(paymentsMade);
    }

    public void removePaymentBeingMade(PaymentModel payment){
        payment.setTraineeMakingPayment(null);
        paymentsMade.remove(payment);
        this.setPaymentsMade(paymentsMade);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TraineeModel )) return false;
        return traineeId != 0 && traineeId == (((TraineeModel) o).getTraineeId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return this.surname;
    }
}
