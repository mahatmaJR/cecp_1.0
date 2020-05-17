package model;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "enroll_trainee_detail")
public class EnrollTraineeModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "enrollment_id")
    int enrollmentId;

    @Column(name = "cert_level")
    String certLevel;

    @Column(name = "date_enrolled")
    @Temporal(TemporalType.TIMESTAMP)
    Date dateEnrolled;

    @OneToMany(mappedBy = "enrollmentPaymentReference")
    Set<PaymentModel> paymentsForEnrollment = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "enrolling_trainee_ref", referencedColumnName = "trainee_id")
    TraineeModel enrollingTrainee;

    @ManyToMany
    @JoinTable(
            name = "enrolled_course",
            joinColumns = {@JoinColumn(name = "enrollment_id")},
            inverseJoinColumns = {@JoinColumn(name = "course_id")}
    )
    Set<CourseModel> courses = new HashSet<>();

    public int getEnrollmentId() {
        return enrollmentId;
    }

    public void setEnrollmentId(int enrollmentId) {
        this.enrollmentId = enrollmentId;
    }

    public String getCertLevel() {
        return certLevel;
    }

    public void setCertLevel(String certLevel) {
        this.certLevel = certLevel;
    }

    public Date getDateEnrolled() {
        return dateEnrolled;
    }

    public void setDateEnrolled(Date dateEnrolled) {
        this.dateEnrolled = dateEnrolled;
    }

    public Set<PaymentModel> getPaymentsForEnrollment() {
        return paymentsForEnrollment;
    }

    public void setPaymentsForEnrollment(Set<PaymentModel> paymentsForEnrollment) {
        this.paymentsForEnrollment = paymentsForEnrollment;
    }

    public TraineeModel getEnrollingTrainee() {
        return enrollingTrainee;
    }

    public void setEnrollingTrainee(TraineeModel enrollingTrainee) {
        this.enrollingTrainee = enrollingTrainee;
    }

    public Set<CourseModel> getCourses() {
        return courses;
    }

    public void setCourses(Set<CourseModel> courses) {
        this.courses = courses;
    }

    public void addCourseToEnrollmentDetail(CourseModel course){
        course.getEnrollTraineeModelCourse().add(this);
        courses.add(course);
        this.setCourses(courses);
    }

    public void addPaymentsMadeForEnrollment(PaymentModel payment){
        payment.setEnrollmentPaymentReference(this);
        paymentsForEnrollment.add(payment);
        this.setPaymentsForEnrollment(paymentsForEnrollment);
    }
}
