package DAO.implementations;

import DAO.interfaces.CenterRepository;
import model.CenterModel;
import model.CoachModel;
import model.TraineeModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class CenterRepositoryImp implements CenterRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public CenterModel registerCenter(String centerName, String centerLocation) {
        CenterModel center = new CenterModel();
        center.setCenterName(centerName);
        center.setCenterLocation(centerLocation);

        em.persist(center);
        return center;
    }

    @Override
    public CenterModel saveCenter(CenterModel center) {
        em.merge(center);
        return center;
    }

    @Override
    public CenterModel findCenterById(int centerId) {
        return em.find(CenterModel.class, centerId);
    }

    @Override
    public void addTraineeToCenter (int centerId, TraineeModel trainee){
        try {
            CenterModel center = findCenterById(centerId);
            center.addTrainee(trainee);

            em.merge(center);
        }catch (Exception e){
            System.out.println(e);
        }

    }

    @Override
    public void  addCoachToCenter(int centerId, CoachModel coach){
        try {
            CenterModel center = findCenterById(centerId);
            center.addCoach(coach);

            em.merge(center);
        }catch (Exception e){
            System.out.println(e);
        }

    }
}
