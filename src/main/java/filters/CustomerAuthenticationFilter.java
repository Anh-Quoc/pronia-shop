package filters;

import entities.UserSession;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserSessionService;

import java.io.IOException;

@WebFilter(filterName = "CustomerAuthenticationFilter",
        urlPatterns = {"/cart", "/checkout", "/order", "/order-details", "/my-account",
        "/cart.jsp", "/checkout.jsp", "/my-account.jsp", "/cart.html", "/checkout.html", "/my-account.jsp"},
        dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class CustomerAuthenticationFilter implements Filter {

    private UserSessionService userSessionService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        userSessionService = UserSessionService.getInstance();
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // Check cookie has session ID or not
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("customer_session_id")) {
                    UserSession userSession = userSessionService.getUserSessionIfValid(cookie.getValue());
                    if (userSession != null) {
                        req.setAttribute("userSession", userSession);
                        filterChain.doFilter(servletRequest, servletResponse);
                        return;
                    }
                }
            }
        }
        res.sendRedirect("login");
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
