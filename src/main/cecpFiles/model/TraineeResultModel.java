package model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "trainee_result")
public class TraineeResultModel implements Serializable {

    @Id
    @Column (name = "result_id")
    int resultId;

    @Column(name = "trainee_result")
    String result;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "trainee_ref", referencedColumnName = "trainee_id")
    TraineeModel trainee;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "exam_ref", referencedColumnName = "exam_id")
    ExamModel exam;

    public int getResultId() {
        return resultId;
    }

    public void setResultId(int resultId) {
        this.resultId = resultId;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public TraineeModel getTrainee() {
        return trainee;
    }

    public void setTrainee(TraineeModel trainee) {
        this.trainee = trainee;
    }

    public ExamModel getExam() {
        return exam;
    }

    public void setExam(ExamModel exam) {
        this.exam = exam;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof TraineeResultModel )) return false;
        return resultId != 0 && resultId == (((TraineeResultModel) o).getResultId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return this.result;
    }
}
