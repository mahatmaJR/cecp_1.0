package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "center_detail")
public class CenterModel implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "center_id")
    int centerId;

    @Column(name = "center_location")
    String centerLocation;

    @Column(name = "center_name")
    String centerName;

    @OneToMany(mappedBy = "center")
    Set<TraineeModel> trainees = new HashSet<>();

    @OneToMany(mappedBy = "coachCenter")
    Set<CoachModel> coaches = new HashSet<>();

    public int getCenterId() {
        return centerId;
    }

    public void setCenterId(int centerId) {
        this.centerId = centerId;
    }

    public String getCenterLocation() {
        return centerLocation;
    }

    public void setCenterLocation(String centerLocation) {
        this.centerLocation = centerLocation;
    }

    public String getCenterName() {
        return centerName;
    }

    public void setCenterName(String centerName) {
        this.centerName = centerName;
    }

    public Set<TraineeModel> getTrainees() {
        return trainees;
    }

    public void setTrainees(Set<TraineeModel> trainees) {
        this.trainees = trainees;
    }

    public Set<CoachModel> getCoaches() {
        return coaches;
    }

    public void setCoaches(Set<CoachModel> coaches) {
        this.coaches = coaches;
    }

    public void addTrainee (TraineeModel trainee){
        trainee.setCenter(this);
        trainees.add(trainee);
        this.setTrainees(trainees);
    }

    public void removeTrainee(TraineeModel trainee){
        trainee.setCenter(null);
        trainees.remove(trainee);
        this.setTrainees(trainees);
    }

    public void addCoach(CoachModel coach){
        coach.setCoachCenter(this);
        coaches.add(coach);
        this.setCoaches(coaches);
    }

    public void removeCoach(CoachModel coach){
        coach.setCoachCenter(null);
        coaches.remove(coach);
        this.setCoaches(coaches);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TraineeModel )) return false;
        return centerId != 0 && centerId == (((TraineeModel) o).getTraineeId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return this.centerName;
    }
}
