package DAO.interfaces;

import model.LoginModel;

import javax.ejb.Local;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@Local
public interface LoginRepository {
    boolean authenticateUser(String userName, String password) throws NoSuchAlgorithmException, InvalidKeySpecException;
    LoginModel findLoginRecord(String userName);
}
