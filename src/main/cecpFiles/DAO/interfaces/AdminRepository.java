package DAO.interfaces;

import model.AdminModel;
import model.LoginModel;

import javax.ejb.Local;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@Local
public interface AdminRepository {
    AdminModel addAdminRecord(String firstName, String surname, String lastName, String address,
                              String email, String phoneNumber, String hierarchy, String userName,
                              String password, String confirmPassword) throws InvalidKeySpecException, NoSuchAlgorithmException;
    AdminModel saveAdminRecord(AdminModel admin);
    AdminModel findAdminRecord(int adminId);
    LoginModel findLoginRecord(String userName);
    LoginModel saveLoginRecord(LoginModel admin);

}
