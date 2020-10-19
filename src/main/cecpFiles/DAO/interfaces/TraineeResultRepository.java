package DAO.interfaces;

import model.TraineeResultModel;

import javax.ejb.Local;

@Local
public interface TraineeResultRepository {
    public TraineeResultModel addNewTraineeResult(String traineeResult, int traineeId, int examId);
    public TraineeResultModel saveTraineeResult(TraineeResultModel resultModel);
    public TraineeResultModel findTraineeResult(int resultId);
}
