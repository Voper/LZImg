package com.lzimg.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ??????????????
 * @author lv
 *
 */
public class SessionFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hrequest = (HttpServletRequest)request;
		HttpServletResponse hresponse = (HttpServletResponse)response;
		
		String password = (String)hrequest.getSession().getAttribute("password");//??session?????§Ý??????????
		
		if(password==null){//??????????????????¦Ä?????????????????????
			hresponse.sendRedirect(hrequest.getContextPath()+"/1.jsp?flag2=1");
			return;
			
		}else{
			chain.doFilter(request, response);//????????????????????
			return;
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
