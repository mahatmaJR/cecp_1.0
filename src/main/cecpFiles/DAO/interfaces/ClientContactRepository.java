package DAO.interfaces;

import model.ClientContactModel;

import javax.ejb.Local;
import java.util.Date;

@Local
public interface ClientContactRepository {

    ClientContactModel newClientContactRecord(String userEmail, String userFullName, String subject, String message, Date dateRegistered);
    ClientContactModel saveClientContactRecord(ClientContactModel clientContact);
}
