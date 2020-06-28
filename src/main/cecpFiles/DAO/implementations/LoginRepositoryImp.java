package DAO.implementations;

import DAO.interfaces.LoginRepository;
import model.LoginModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Stateless
public class LoginRepositoryImp  implements LoginRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public boolean authenticateUser(String userName, String password) {

        Query q = em.createQuery("SELECT M FROM LoginModel M WHERE M.userName = :userName AND M.password = :password");

        q.setParameter("userName", userName);
        q.setParameter("password", password);

        List<LoginModel> loginData  = q.getResultList();

        return loginData.size() > 0;
    }

    @Override
    public LoginModel findLoginRecord(String userName){
        return em.find(LoginModel.class, userName);
    }
}
