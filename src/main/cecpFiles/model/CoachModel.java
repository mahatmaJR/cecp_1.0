package model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "coach_detail")
public class CoachModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "coach_id")
    int coachId;

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

    @Column(name = "mcc_cert_number")
    String mccCertNumber;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "username_ref", referencedColumnName = "username")
    LoginModel coachLogin;

    @OneToMany(mappedBy = "coach", fetch = FetchType.EAGER)
    Set<TraineeModel> trainees = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "center_ref", referencedColumnName = "center_id")
    CenterModel coachCenter;

    public CoachModel(){}

    public CoachModel(String surname){
        this.surname = surname;
    }

    public int getCoachId() {
        return coachId;
    }

    public void setCoachId(int traineeId) {
        this.coachId = traineeId;
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

    public String getMccCertNumber() {
        return mccCertNumber;
    }

    public void setMccCertNumber(String mccCertNumber) {
        this.mccCertNumber = mccCertNumber;
    }

    public LoginModel getCoachLogin() {
        return coachLogin;
    }

    public void setCoachLogin(LoginModel coachLogin) {
        this.coachLogin = coachLogin;
    }

    public Set<TraineeModel> getTrainees() {
        return trainees;
    }

    public void setTrainees(Set<TraineeModel> trainees) {
        this.trainees = trainees;
    }

    public CenterModel getCoachCenter() {
        return coachCenter;
    }

    public void setCoachCenter(CenterModel coachCenter) {
        this.coachCenter = coachCenter;
    }

    public void addTrainee(TraineeModel trainee){
        trainee.setCoach(this);
        trainees.add(trainee);
        this.setTrainees(trainees);
    }

    public void removeTrainee(TraineeModel trainee){
        trainee.setCoach(null);
        trainees.remove(trainee);
        this.setTrainees(trainees);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TraineeModel )) return false;
        return coachId != 0 && coachId == (((TraineeModel) o).getTraineeId());
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
