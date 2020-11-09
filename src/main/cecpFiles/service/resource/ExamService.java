package service.resource;

import DAO.interfaces.ExamRepository;
import DAO.interfaces.QuestionRepository;
import model.QuestionModel;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/exam")
public class ExamService {

    @EJB
    ExamRepository examRepo;

    @EJB
    QuestionRepository questionRepo;

    @Path("/addExam")
    @POST
    public void addExamRecord(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {

            int courseId = Integer.parseInt(req.getParameter("courseId"));
            String examName = req.getParameter("examName");
            String dateScheduled = req.getParameter("dateScheduled");
            String timeScheduled = req.getParameter("timeScheduled");
            String duration = req.getParameter("duration");

            examRepo.addNewExamRecord(examName, duration, dateScheduled, timeScheduled, courseId);

            resp.sendRedirect("/cecp/coachPortal");

        }catch (Exception e){

            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            e.printStackTrace();
        }
    }

    @Path("/setQuestion")
    @POST
    public void addExamQuestion(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        try {
            String questionNumber = req.getParameter("questionNumber");
            String actualQuestion = req.getParameter("actualQuestion");
            String optionA = req.getParameter("optionA");
            String optionB = req.getParameter("optionB");
            String optionC = req.getParameter("optionC");
            String optionD = req.getParameter("optionD");
            String correctAnswer = req.getParameter("correctAnswer");

            QuestionModel question = questionRepo.addNewMultipleQuestion(questionNumber, actualQuestion, optionA, optionB, optionC, optionD, correctAnswer);
            System.out.println(question.getQuestionId());
            String examIdentity = req.getParameter("examid");

            int examId = Integer.parseInt(examIdentity);
            System.out.println(examId);

            examRepo.addQuestionToExam(examId, question);

            req.setAttribute("success", "Question Added Successfully");

        } catch (Exception e) {
            String msg = "An error occurred while processing your request, No need to worry, Our System Admin has been notified";
            req.setAttribute("msg", msg);
            req.getRequestDispatcher("/msgDisplay").forward(req, resp);
            e.printStackTrace();
        }
    }

}
