package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "corporate_engagement_detail")
public class CorporateEngagementModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "corporate_engagement_id")
    int corporateEngagementId;

    @Column(name = "company_name")
    String companyName;

    @Column(name = "company_email")
    String companyEmail;

    @Column(name = "contact_person")
    String contactPerson;

    @Column(name = "phone_number")
    String phoneNumber;

    @Column(name = "client_requirement")
    String clientRequirement;

    @Column(name = "date_registered")
    @Temporal(TemporalType.TIMESTAMP)
    Date dateRegistered;

    public int getCorporateEngagementId() {
        return corporateEngagementId;
    }

    public void setCorporateEngagementId(int corporateEngagementId) {
        this.corporateEngagementId = corporateEngagementId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getClientRequirement() {
        return clientRequirement;
    }

    public void setClientRequirement(String clientRequirement) {
        this.clientRequirement = clientRequirement;
    }

    public Date getDateRegistered() {
        return dateRegistered;
    }

    public void setDateRegistered(Date dateRegistered) {
        this.dateRegistered = dateRegistered;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CorporateEngagementModel )) return false;
        return corporateEngagementId != 0 && corporateEngagementId == (((CorporateEngagementModel) o).getCorporateEngagementId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return this.companyName;
    }
}
