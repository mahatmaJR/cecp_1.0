package DAO.interfaces;

import model.CorporateEngagementModel;

import javax.ejb.Local;
import java.util.Date;

@Local
public interface CorporateEngagementRepository {
    CorporateEngagementModel newCorporateEngagementRecord(String companyName, String companyEmail, String contactPerson, String phoneNumber, String clientRequirement, Date dateRegistered);
    CorporateEngagementModel saveCorporateEngagementRecord(CorporateEngagementModel corporateEngagement);
}