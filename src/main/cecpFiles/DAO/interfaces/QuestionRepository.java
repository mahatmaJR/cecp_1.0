package DAO.interfaces;

import model.QuestionModel;

import javax.ejb.Local;

@Local
public interface QuestionRepository {

    public QuestionModel addNewMultipleQuestion(String questionNumber, String actualQuestion,
                                                String optionA, String optionB, String optionC,
                                                String optionD, String correctAnswer);
    public QuestionModel addNewEssayQuestion(String questionNumber, String actualQuestion, String essayOption);
    public QuestionModel saveQuestionRecord(QuestionModel question);
    public QuestionModel findQuestionRecord(int questionId);


}
