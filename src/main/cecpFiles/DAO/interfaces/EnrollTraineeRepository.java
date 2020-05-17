package DAO.interfaces;

import model.CourseModel;
import model.EnrollTraineeModel;

import javax.ejb.Local;
import java.util.Set;

@Local
public interface EnrollTraineeRepository {
    EnrollTraineeModel newEnrollmentRecord(String certLevel, int traineeId, Set<CourseModel> selectedCourses);
    EnrollTraineeModel saveEnrollmentRecord(EnrollTraineeModel enrollTraineeModel);
    EnrollTraineeModel findEnrollmentRecord(int enrollmentId);
}
