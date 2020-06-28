package model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "course_detail")
public class CourseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "course_id")
    int courseId;

    @Column(name = "course_name")
    String courseName;

    @Column(name = "certification_level")
    String certLevel;

    @Column(name = "course_description")
    String courseDescription;

    @ManyToMany(mappedBy = "courses")
    Set<EnrollTraineeModel> enrollTraineeModelCourse = new HashSet<>();

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCertLevel() {
        return certLevel;
    }

    public void setCertLevel(String certLevel) {
        this.certLevel = certLevel;
    }

    public String getCourseDescription() {
        return courseDescription;
    }

    public void setCourseDescription(String courseDescription) {
        this.courseDescription = courseDescription;
    }

    public Set<EnrollTraineeModel> getEnrollTraineeModelCourse() {
        return enrollTraineeModelCourse;
    }

    public void setEnrollTraineeModelCourse(Set<EnrollTraineeModel> enrollTraineeModelCours) {
        this.enrollTraineeModelCourse = enrollTraineeModelCours;
    }
}
