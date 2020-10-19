package DAO.implementations;

import DAO.interfaces.AdminRepository;
import model.AdminModel;
import model.LoginModel;
import utility.PassSecurity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@Stateless
public class AdminRepositoryImp implements AdminRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    private PassSecurity passwdSec = new PassSecurity();

    @Override
    public AdminModel addAdminRecord(String firstName, String surname, String lastName,
                                     String address, String email, String phoneNumber,
                                     String hierarchy, String userName, String password,
                                     String confirmPassword)
            throws InvalidKeySpecException, NoSuchAlgorithmException {

        LoginModel loginModel = new LoginModel();
        loginModel.setUserName(userName);
        String hashedPassword = passwdSec.generatePasswordHash(password);
        loginModel.setPassword(hashedPassword);
        loginModel.setConfirmPassword(hashedPassword);
        final String ADDD = "Administrator";
        loginModel.setRole(ADDD);

        AdminModel admin = new AdminModel();
        admin.setFirstName(firstName);
        admin.setSurname(surname);
        admin.setLastName(lastName);
        admin.setAddress(address);
        admin.setEmail(email);
        admin.setPhoneNumber(phoneNumber);
        admin.setHierarchy(hierarchy);
        admin.setAdminLogin(loginModel);

        em.persist(loginModel);
        em.persist(admin);
        return null;
    }

    @Override
    public AdminModel saveAdminRecord(AdminModel admin) {
        em.merge(admin);
        return admin;
    }

    @Override
    public AdminModel findAdminRecord(int adminId) {
        return em.find(AdminModel.class, adminId);
    }

    @Override
    public LoginModel findLoginRecord(String userName){
        return em.find(LoginModel.class, userName);
    }

    @Override
    public LoginModel saveLoginRecord(LoginModel admin){
        em.merge(admin);
        return admin;
    }
}
