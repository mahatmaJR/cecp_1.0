package service;

import service.resource.*;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/main")
public class WebServiceApplication extends Application {

    public Set<Object> singletons = new HashSet<Object>();
    public Set<Class<?>> empty = new HashSet<Class<?>>();

    public WebServiceApplication() {

        singletons.add(new CenterService());
        singletons.add(new CoachService());
        singletons.add(new CourseService());
        singletons.add(new EnrollmentService());
        singletons.add(new LoginService());
        singletons.add(new LogoutService());
        singletons.add(new PaymentService());
        singletons.add(new SelectCoachService());
        singletons.add(new TraineeService());

    }

    @Override
    public Set<Class<?>> getClasses() {
        return super.getClasses();
    }

    @Override
    public Set<Object> getSingletons() {
        return super.getSingletons();
    }
}
