package model;

import javax.persistence.*;

@Entity
@Table(name = "login_detail")
public class LoginModel {
    @Id
    @Column(name = "username")
    String userName;

    @Column(name = "password")
    String password;

    @Column(name = "confirm_password")
    String confirmPassword;

    @Column(name = "user_role")
    String role;

    @OneToOne(mappedBy = "loginModel", fetch = FetchType.EAGER)
    TraineeModel trainee;

    @OneToOne(mappedBy = "coachLogin")
    CoachModel coach;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public TraineeModel getTrainee() {
        return trainee;
    }

    public void setTrainee(TraineeModel trainee) {
        this.trainee = trainee;
    }

    public CoachModel getCoach() {
        return coach;
    }

    public void setCoach(CoachModel coach) {
        this.coach = coach;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof LoginModel )) return false;
        return userName != null && userName.equals(((LoginModel) o).getUserName());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
