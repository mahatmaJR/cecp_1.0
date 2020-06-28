package DAO.implementations;

import DAO.interfaces.EnrollTraineeRepository;
import DAO.interfaces.TraineeRepository;
import model.CourseModel;
import model.EnrollTraineeModel;
import model.TraineeModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

@Stateless
public class EnrollTraineeRepositoryImp implements EnrollTraineeRepository {

    TraineeRepository traineeRepo;

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public EnrollTraineeModel newEnrollmentRecord(String certLevel, int traineeId, Set<CourseModel> selectedCourses) {
        EnrollTraineeModel enrollment = new EnrollTraineeModel();
        Date enrollingDate = new Date();
        TraineeModel enrollingTrainee = traineeRepo.findTraineeRecord(traineeId);


        enrollment.setCertLevel(certLevel);
        enrollment.setDateEnrolled(enrollingDate);

        Iterator<CourseModel> courses = selectedCourses.iterator();
        while (courses.hasNext()){
            enrollment.addCourseToEnrollmentDetail(courses.next());
        }

        em.persist(enrollment);

        enrollingTrainee.addEnrollClass(enrollment);

        em.merge(enrollingTrainee);

        return enrollment;
    }

    @Override
    public EnrollTraineeModel saveEnrollmentRecord(EnrollTraineeModel enrollTraineeModel) {
        return em.merge(enrollTraineeModel);
    }

    @Override
    public EnrollTraineeModel findEnrollmentRecord(int enrollmentId) {
        return em.find(EnrollTraineeModel.class, enrollmentId);
    }
}
