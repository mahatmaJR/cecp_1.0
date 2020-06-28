package DAO.implementations;

import DAO.interfaces.CorporateEngagementRepository;
import model.CorporateEngagementModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;

@Stateless
public class CorporateEngagementRepositoryImp implements CorporateEngagementRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public CorporateEngagementModel newCorporateEngagementRecord(String companyName, String companyEmail, String contactPerson, String phoneNumber, String clientRequirement, Date dateRegistered) {

        CorporateEngagementModel corporateEngagement = new CorporateEngagementModel();

        corporateEngagement.setCompanyName(companyName);
        corporateEngagement.setCompanyEmail(companyEmail);
        corporateEngagement.setContactPerson(contactPerson);
        corporateEngagement.setPhoneNumber(phoneNumber);
        corporateEngagement.setClientRequirement(clientRequirement);
        corporateEngagement.setDateRegistered(dateRegistered);

        em.persist(corporateEngagement);

        return corporateEngagement;
    }

    @Override
    public CorporateEngagementModel saveCorporateEngagementRecord(CorporateEngagementModel corporateEngagement) {

        em.merge(corporateEngagement);

        return corporateEngagement;

    }
}
