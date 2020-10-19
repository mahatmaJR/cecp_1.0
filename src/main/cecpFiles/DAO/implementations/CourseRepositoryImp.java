package DAO.implementations;

import DAO.interfaces.CourseRepository;
import model.CourseModel;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class CourseRepositoryImp implements CourseRepository {

    @PersistenceContext(unitName = "CecpPU")
    EntityManager em;

    @Override
    public CourseModel registerCourse(String courseName, String certLevel, String courseDescription) {

        CourseModel course = new CourseModel();

        course.setCourseName(courseName);
        course.setCertLevel(certLevel);
        course.setCourseDescription(courseDescription);

        em.persist(course);

        return course;
    }

    @Override
    public CourseModel saveCourse(CourseModel center) {
        return em.merge(center);
    }

    @Override
    public CourseModel findCourseById(int courseId) {
        return em.find(CourseModel.class, courseId);
    }

    @Override
    public CourseModel findCourseByName(String courseName) {
        return em.find(CourseModel.class, courseName);
    }
}
