package DAO.implementations;

import DAO.interfaces.ClientContactRepository;
import model.ClientContactModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

@Stateless
public class ClientContactRepositoryImp implements ClientContactRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public ClientContactModel newClientContactRecord(String userEmail, String userFullName, String subject, String message, Date dateRegistered) {

        ClientContactModel clientContact = new ClientContactModel();

        clientContact.setUserEmail(userEmail);
        clientContact.setUserFullName(userFullName);
        clientContact.setSubject(subject);
        clientContact.setMessage(message);
        clientContact.setDateRegistered(dateRegistered);

        em.persist(clientContact);

        return clientContact;

    }

    @Override
    public ClientContactModel saveClientContactRecord(ClientContactModel clientContact) {

        em.merge(clientContact);

        return clientContact;

    }
}
