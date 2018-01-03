package com.filter;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.yxd.obj.OnlineCounter;

public class OnlineCounterListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		OnlineCounter.raise();
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		OnlineCounter.reduce();
		
	}
	

}
