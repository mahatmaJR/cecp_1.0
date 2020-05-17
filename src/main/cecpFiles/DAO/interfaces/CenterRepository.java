package DAO.interfaces;

import model.CenterModel;
import model.CoachModel;
import model.TraineeModel;

import javax.ejb.Local;

@Local
public interface CenterRepository {
    CenterModel registerCenter (String centerName, String centerLocation);
    CenterModel saveCenter(CenterModel center);
    CenterModel findCenterById(int centerId);
    void addTraineeToCenter (int centerId, TraineeModel trainee);
    void  addCoachToCenter(int centerId, CoachModel coach);
}
