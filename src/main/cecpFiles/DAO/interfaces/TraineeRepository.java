package DAO.interfaces;

import model.LoginModel;
import model.TraineeModel;

import javax.ejb.Local;

@Local
public interface TraineeRepository{
    TraineeModel newTraineeRecord(String firstName, String surname, String lastName, String address, String email, String phoneNumber, String certLevel, String userName, String password, String confirmPassword, String role);
    TraineeModel saveTraineeRecord(TraineeModel trainee);
    TraineeModel findTraineeRecord(int traineeId);
    LoginModel saveLoginData(LoginModel loginData);
    LoginModel findLoginRecord(String userName);
}