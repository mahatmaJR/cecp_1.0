package DAO.interfaces;

import model.CoachModel;
import model.LoginModel;
import model.TraineeModel;

import javax.ejb.Local;

@Local
public interface CoachRepository {
    CoachModel newCoachRecord(String firstName, String surname, String lastName, String address, String email, String phoneNumber, String certLevel, String mccCertNo, String userName, String password, String confirmPassword, String role);
    CoachModel saveCoachRecord(CoachModel trainee);
    CoachModel findCoachRecord(int coachId);
    LoginModel saveLoginData(LoginModel loginData);
    LoginModel findLoginRecord(String userName);
    void addTraineeToCoach(int coachId, TraineeModel trainee);
}
