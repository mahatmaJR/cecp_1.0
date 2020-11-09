package DAO.implementations;

import DAO.interfaces.QuestionRepository;
import model.QuestionModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class QuestionRepositoryImp implements QuestionRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public QuestionModel addNewMultipleQuestion(String questionNumber, String actualQuestion,
                                                String optionA,String optionB, String optionC,
                                                String optionD, String correctAnswer){

        QuestionModel multipleQuestion = new QuestionModel();

        multipleQuestion.setQuestionNumber(questionNumber);
        multipleQuestion.setActualQuestion(actualQuestion);
        multipleQuestion.setOptionA(optionA);
        multipleQuestion.setOptionB(optionB);
        multipleQuestion.setOptionC(optionC);
        multipleQuestion.setOptionD(optionD);
        multipleQuestion.setCorrectAnswer(correctAnswer);

        em.persist(multipleQuestion);
        System.out.println(multipleQuestion.getQuestionId());
        return multipleQuestion;



    }

    @Override
    public QuestionModel addNewEssayQuestion(String questionNumber, String actualQuestion, String essayOption){

        QuestionModel essayQuestion = new QuestionModel();
        essayQuestion.setQuestionNumber(questionNumber);
        essayQuestion.setActualQuestion(actualQuestion);
        essayQuestion.setEssayOption(essayOption);

        em.persist(essayQuestion);
        return essayQuestion;

    }

    @Override
    public QuestionModel saveQuestionRecord(QuestionModel question){
        em.merge(question);
        return question;
    }

    @Override
    public QuestionModel findQuestionRecord(int questionId){
        return em.find(QuestionModel.class, questionId);
    }



}
