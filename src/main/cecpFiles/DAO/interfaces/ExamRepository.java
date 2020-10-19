package DAO.interfaces;

import model.ExamModel;
import model.QuestionModel;
import model.TraineeResultModel;

import javax.ejb.Local;
import java.util.Date;

@Local
public interface ExamRepository {
    public ExamModel addNewExamRecord(String examName, String duration, String examDate, String timeScheduled, int courseId);
    public ExamModel saveExamRecord(ExamModel exam);
    public ExamModel findExamRecord(int examId);
    public void addQuestionToExam(int examId, QuestionModel question);
    public void addTraineeToExam(int examId, TraineeResultModel traineeResult);
}
