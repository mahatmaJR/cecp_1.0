package service;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/adminPanel",
        "/centerRegistration",
        "/coachPortal",
        "/coachSignUp",
        "/courseRegistration",
        "/enrollmentForm",
        "/examForm",
        "/payment",
        "/selectCoach",
        "/selectCenter",
        "/traineePortal",
        "/traineeSignUp"
})

public class ApplicationFilter implements Filter {

    private FilterConfig config = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        if (session.getAttribute("id") == null ){
            request.getRequestDispatcher("/login").forward(request, response);
            return;
        }

        filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {

        config = null;

    }
}
