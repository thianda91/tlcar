package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class HttpFilter implements Filter {

	private FilterConfig filterconfig;

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		doFilter(request, response, chain);

	}

	public abstract void doFilter(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterchain)
			throws IOException, ServletException;

	@Override
	public void init(FilterConfig filterconfig) throws ServletException {
		this.filterconfig = filterconfig;
		init();
		
		
	}

	protected void init() {
	}

	public FilterConfig getFilterConfig() {
		return filterconfig;
	}
}
