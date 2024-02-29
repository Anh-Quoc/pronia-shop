package filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.UserSessionService;

import java.io.IOException;

@WebFilter(filterName = "AuthenticationFilter",
        urlPatterns = {"/admin-categories", "/admin-orders", "/admin-order-details", "/admin-plants", "/admin-tags", "/admin-users", "/admin-dashboard",
        "/admin-index.jsp", "/Category.jsp", "/Order.jsp", "/OrderDetail.jsp", "/Plant.jsp", "/Tag.jsp", "/User.jsp"},
        dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD})
public class AdminAuthenticationFilter implements Filter {

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
                if (cookie.getName().equals("session_id")) {
                    if (userSessionService.isValidAdminSessionId(cookie.getValue())) {
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
