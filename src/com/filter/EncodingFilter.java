package com.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter extends HttpFilter {
	private String encoding;

	@Override
	protected void init() {
		//encoding = "utf-8";
		encoding=getFilterConfig().getServletContext().getInitParameter("encoding");
	}

	@Override
	public void doFilter(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterchain)
			throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		response.setContentType(encoding);
		filterchain.doFilter(request, response);
	}

}
