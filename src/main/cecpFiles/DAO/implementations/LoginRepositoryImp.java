package DAO.implementations;

import DAO.interfaces.LoginRepository;
import model.LoginModel;
import utility.PassSecurity;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

@Stateless
public class LoginRepositoryImp  implements LoginRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    PassSecurity passwordSec = new PassSecurity();
    final String ALGORITHM = "PBKDF2WithHmacSHA1";
    final int KEYLENGTH = (64*8);

    @Override
    public boolean authenticateUser(String userName, String password) throws NoSuchAlgorithmException, InvalidKeySpecException {

        LoginModel loggedUser = findLoginRecord(userName);

        String storedPassword = loggedUser.getPassword();
        String [] storedPasswordArray = storedPassword.split(":");
        byte [] salt = passwordSec.toByteArray(storedPasswordArray[0]);
        char [] passwordCharacter = password.toCharArray();
        int iteration = Integer.parseInt(storedPasswordArray[2]);

        PBEKeySpec spec = new PBEKeySpec(passwordCharacter, salt, iteration, KEYLENGTH);
        SecretKeyFactory skf = SecretKeyFactory.getInstance(ALGORITHM);
        byte [] hashedPassword = skf.generateSecret(spec).getEncoded();
        String generatedHash = passwordSec.toHex(salt) + ":" + passwordSec.toHex(hashedPassword) + ":" + iteration;

        if (generatedHash.equals(storedPassword)) return true;
        else return false;
    }

    @Override
    public LoginModel findLoginRecord(String userName){

        return em.find(LoginModel.class, userName);
    }
}
