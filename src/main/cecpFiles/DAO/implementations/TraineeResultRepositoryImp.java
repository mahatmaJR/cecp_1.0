package DAO.implementations;

import DAO.interfaces.ExamRepository;
import DAO.interfaces.TraineeRepository;
import DAO.interfaces.TraineeResultRepository;
import model.ExamModel;
import model.TraineeModel;
import model.TraineeResultModel;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class TraineeResultRepositoryImp implements TraineeResultRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @EJB
    TraineeRepository traineeRepo;

    @EJB
    ExamRepository examRepo;

    @Override
    public TraineeResultModel addNewTraineeResult(String traineeResult, int traineeId, int examId){

        TraineeResultModel result = new TraineeResultModel();

        TraineeModel trainee = traineeRepo.findTraineeRecord(traineeId);
        result.setTrainee(trainee);

        ExamModel exam = examRepo.findExamRecord(examId);
        result.setExam(exam);

        result.setResult(traineeResult);

        em.persist(result);

        return result;
    }

    @Override
    public TraineeResultModel saveTraineeResult(TraineeResultModel resultModel){
        em.merge(resultModel);
        return resultModel;
    }

    @Override
    public TraineeResultModel findTraineeResult(int resultId){
        return em.find(TraineeResultModel.class, resultId);
    }



}
