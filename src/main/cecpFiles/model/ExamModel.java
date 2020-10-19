package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "exam_detail")
public class ExamModel implements Serializable {

    @Id
    @Column(name = "exam_id")
    int examId;

    @Column(name = "exam_name")
    String examName;

    @Column(name = "duration")
    String duration;

    @Column(name = "exam_date")
    String examDate;

    @Column(name = "time_scheduled")
    String timeScheduled;

    @ManyToOne
    @JoinColumn(name = "course_ref", referencedColumnName = "course_id")
    CourseModel course;

    @OneToMany(mappedBy = "exam", fetch = FetchType.EAGER)
    Set<QuestionModel> examQuestions = new HashSet<>();

    @OneToMany(mappedBy = "exam", fetch = FetchType.EAGER)
    Set<TraineeResultModel> examResult = new HashSet<>();

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getExamDate() {
        return examDate;
    }

    public void setExamDate(String examDate) {
        this.examDate = examDate;
    }

    public String getTimeScheduled() {
        return timeScheduled;
    }

    public void setTimeScheduled(String timeScheduled) {
        this.timeScheduled = timeScheduled;
    }

    public CourseModel getCourse() {
        return course;
    }

    public void setCourse(CourseModel course) {
        this.course = course;
    }

    public Set<QuestionModel> getExamQuestions() {
        return examQuestions;
    }

    public void setExamQuestions(Set<QuestionModel> examQuestions) {
        this.examQuestions = examQuestions;
    }

    public Set<TraineeResultModel> getExamResult() {
        return examResult;
    }

    public void setExamResult(Set<TraineeResultModel> examResult) {
        this.examResult = examResult;
    }

    public void addQuestion(QuestionModel question){
        question.setExam(this);
        examQuestions.add(question);
        this.setExamQuestions(examQuestions);
    }

    public void removeQuestion(QuestionModel question){
        question.setExam(null);
        examQuestions.remove(question);
        this.setExamQuestions(examQuestions);
    }

    public void addExamResult(TraineeResultModel result){
        result.setExam(this);
        examResult.add(result);
        this.setExamResult(examResult);
    }

    public void removeExamResult(TraineeResultModel result){
        result.setExam(null);
        examResult.remove(result);
        this.setExamResult(examResult);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ExamModel )) return false;
        return examId != 0 && examId == (((ExamModel) o).getExamId());
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return this.examName;
    }
}
