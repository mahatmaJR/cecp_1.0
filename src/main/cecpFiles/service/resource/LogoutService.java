package service.resource;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import java.io.IOException;

@Path("/endSession")
public class LogoutService {

    @Path("/logoutUser")
    @GET
    public void logoutUser(@Context HttpServletRequest req, @Context HttpServletResponse resp) throws ServletException, IOException {

        req.getRequestDispatcher("/logout").forward(req, resp);
        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                System.out.println(cookie.getValue());
                cookie.setMaxAge(0);
                resp.addCookie(cookie);
            }
        }

        HttpSession session = req.getSession(false);
        System.out.println("User " + session.getAttribute("id") + " is logging out");
        session.invalidate();

    }
}
