package DAO.interfaces;

import model.CourseModel;

import javax.ejb.Local;

@Local
public interface CourseRepository {
    CourseModel registerCourse (String courseName, String certLevel, String courseDescription);
    CourseModel saveCourse(CourseModel center);
    CourseModel findCourseById(int courseId);
}
