package DAO.implementations;

import DAO.interfaces.CourseRepository;
import DAO.interfaces.ExamRepository;
import model.CourseModel;
import model.ExamModel;
import model.QuestionModel;
import model.TraineeResultModel;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ExamRepositoryImp implements ExamRepository {

    @EJB
    CourseRepository courseRepo;

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public ExamModel addNewExamRecord(String examName, String duration, String examDate, String timeScheduled, int courseId){
        ExamModel exam = new ExamModel();

        exam.setExamName(examName);
        exam.setDuration(duration);
        exam.setExamDate(examDate);
        exam.setTimeScheduled(timeScheduled);

        CourseModel course = courseRepo.findCourseById(courseId);
        exam.setCourse(course);

        em.persist(exam);
        return exam;
    }

    @Override
    public ExamModel saveExamRecord(ExamModel exam){
        em.merge(exam);
        return exam;
    }

    @Override
    public ExamModel findExamRecord(int examId) {
        return em.find(ExamModel.class, examId);
    }

    @Override
    public void addQuestionToExam(int examId, QuestionModel question){
        try {
            ExamModel exam = findExamRecord(examId);
            exam.addQuestion(question);

            em.merge(exam);

        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void addTraineeToExam(int examId, TraineeResultModel traineeResult){
        try{
            ExamModel exam = findExamRecord(examId);
            exam.addExamResult(traineeResult);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
