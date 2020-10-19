package DAO.implementations;

import DAO.interfaces.CoachRepository;
import model.CoachModel;
import model.LoginModel;
import model.TraineeModel;
import utility.PassSecurity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@Stateless
public class CoachRepositoryImp implements CoachRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    private PassSecurity passwdSec = new PassSecurity();

    @Override
    public CoachModel newCoachRecord(String firstName, String surname, String lastName,
                                     String address, String email, String phoneNumber,
                                     String certLevel, String mccCertNo, String userName,
                                     String password, String confirmPassword, String role)
            throws InvalidKeySpecException, NoSuchAlgorithmException {
        LoginModel loginModel = new LoginModel();
        loginModel.setUserName(userName);
        String hashedPassword = passwdSec.generatePasswordHash(password);
        loginModel.setPassword(hashedPassword);
        loginModel.setConfirmPassword(hashedPassword);
        loginModel.setRole(role);

        CoachModel coach = new CoachModel();
        coach.setFirstName(firstName);
        coach.setSurname(surname);
        coach.setLastName(lastName);
        coach.setAddress(address);
        coach.setEmail(email);
        coach.setPhoneNumber(phoneNumber);
        coach.setCertLevel(certLevel);
        coach.setMccCertNumber(mccCertNo);
        coach.setCoachLogin(loginModel);

        em.persist(loginModel);
        em.persist(coach);
        return coach;
    }

    @Override
    public CoachModel saveCoachRecord(CoachModel coach) {
        em.merge(coach);
        return coach;
    }

    @Override
    public CoachModel findCoachRecord(int coachId) {
        CoachModel coach = em.find(CoachModel.class, coachId);
        return coach;
    }

    ////consider boolean
    @Override
    public LoginModel saveLoginData(LoginModel loginData) {
        em.merge(loginData);
        return loginData;
    }

    @Override
    public LoginModel findLoginRecord(String userName) {
        return em.find(LoginModel.class, userName);
    }

    @Override
    public void addTraineeToCoach(int coachId, TraineeModel trainee){

            CoachModel coach = findCoachRecord(coachId);
            coach.addTrainee(trainee);

            em.merge(coach);

    }

}
