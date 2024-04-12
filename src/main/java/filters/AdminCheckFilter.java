package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminCheckFilter
 */
@WebFilter( {"/admin/*"})
public class AdminCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminCheckFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);
		
		// 세션이 없는 경우 - 로그인이 되어있지 않은 비정상 접근 
		if(session == null || session.getAttribute("id") == null) {
			request.setAttribute("message", "세션이 만료되었습니다. 다시 로그인해주세요.");
			request.getRequestDispatcher("/members/MainForm.jsp").forward(request, response);
			return;
		}
		
		// 세션은 있으나 비정상적으로 로그인 처리가 안된 경우 - idType 값이 없거나 정상적이지 않을 경우
		String idType = (String) session.getAttribute("idType");
		if(idType == null || (!idType.equals("admin")) && (!idType.equals("member"))) {
			request.setAttribute("message", "비정삭적인 접근입니다. 다시 로그인 해주세요.");
			session.invalidate();
			request.getRequestDispatcher("/common/Login.jsp").forward(request, response);
			return;
		}
		
		// pass the request along the filter chain
		chain.doFilter(req, res);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("admin 전용 페이지 접속.... admin 로그인 여부 체크");
	}

}
