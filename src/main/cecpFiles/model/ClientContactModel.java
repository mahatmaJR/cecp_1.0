package model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "client_contact_detail")
public class ClientContactModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "client_contact_id")
    int clientContactId;

    @Column(name = "user_email")
    String userEmail;

    @Column(name = "user_full_name")
    String userFullName;

    @Column(name = "subject")
    String subject;

    @Column(name = "message")
    String message;

    @Column(name = "date_registered")
    @Temporal(TemporalType.TIMESTAMP)
    Date dateRegistered;

    public int getClientContactId() {
        return clientContactId;
    }

    public void setClientContactId(int clientContactId) {
        this.clientContactId = clientContactId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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
        if (!(o instanceof ClientContactModel )) return false;
        return clientContactId != 0 && clientContactId == (((ClientContactModel) o).getClientContactId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return this.userFullName;
    }
}
