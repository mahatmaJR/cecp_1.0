package DAO.implementations;

import DAO.interfaces.TraineeRepository;
import model.LoginModel;
import model.TraineeModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Stateless
public class TraineeRepositoryImp implements TraineeRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public TraineeModel newTraineeRecord(String firstName, String surname, String lastName, String address,
                                         String email, String phoneNumber, String certLevel, String userName,
                                         String password, String confirmPassword, String role){

        LoginModel loginModel = new LoginModel();
        loginModel.setUserName(userName);
        loginModel.setPassword(password);
        loginModel.setConfirmPassword(confirmPassword);
        loginModel.setRole(role);

        TraineeModel trainee = new TraineeModel();
        trainee.setFirstName(firstName);
        trainee.setSurname(surname);
        trainee.setLastName(lastName);
        trainee.setAddress(address);
        trainee.setEmail(email);
        trainee.setPhoneNumber(phoneNumber);
        trainee.setCertLevel(certLevel);
        trainee.setLoginModel(loginModel);

        em.persist(loginModel);
        em.persist(trainee);
        return trainee;
    }

    @Override
    public TraineeModel saveTraineeRecord(TraineeModel trainee){
        em.merge(trainee);
        return trainee;
    }

    @Override
    public TraineeModel findTraineeRecord(int traineeId){
        TraineeModel traineeModel = em.find(TraineeModel.class, traineeId);
        return traineeModel;
    }

    @Override
    public LoginModel saveLoginData(LoginModel loginData){
        em.merge(loginData);
        return loginData;
    }

    ////consider boolean
    @Override
    public LoginModel findLoginRecord(String userName){
        return em.find(LoginModel.class, userName);
    }

}
