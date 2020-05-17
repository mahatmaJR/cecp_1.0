package DAO.interfaces;

import model.LoginModel;

import javax.ejb.Local;

@Local
public interface LoginRepository {
    boolean authenticateUser(String userName, String password);
    LoginModel findLoginRecord(String userName);
}
