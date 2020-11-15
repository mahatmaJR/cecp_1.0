<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%
    String tId = request.getParameter("cecpID");
    String surname = request.getParameter("surname");
    request.setAttribute("traineeId", tId);
    request.setAttribute("surname", surname);
    String URL = "jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_dea154609e26f08";
    String USER = "bf29111e8d842e";
    String PASS = "98fd5583";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(URL, USER, PASS);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Courses</title>
</head>
<body>
<%
    try {


%>
<table border="1" style="border: #5e5e5e">
    <thead>
        <tr>
            <td>Courses ID</td>
            <td>Courses Name</td>
        </tr>
    </thead>
    <tbody>
    <%
        String enrollmentId = request.getParameter("enrollmentId");
        int enrollId = Integer.parseInt(enrollmentId);
        Statement stCourses = con.createStatement();
        ResultSet rsCourses = stCourses.executeQuery("SELECT * FROM enrolled_course WHERE enrollment_id = " + enrollId + "");
        while (rsCourses.next()){
    %>
        <tr>
            <td id="courseId">
                <%=rsCourses.getString("course_id")%>
            </td>

            <%
                    String courseName = rsCourses.getString("course_id");
                    int courseId = Integer.parseInt(courseName);
                    Statement stCourseName = con.createStatement();
                    ResultSet rsCourseName = stCourseName.executeQuery("SELECT course_name FROM course_detail WHERE course_id = " + courseId + "");
                    while (rsCourseName.next()){
                    %>
            <td><%= rsCourseName.getString("course_name") %></td>
            <%
                    }
                    stCourseName.close();
                    rsCourseName.close();
                }
                stCourses.close();
                rsCourses.close();
                %>


        </tr>
    </tbody>
</table>
</body>
<%
    } catch (Exception ignored) {}
        finally {
            try { con.close(); } catch ( SQLException e ) {
                System.out.println(e);
            }
    }
%>
</html>