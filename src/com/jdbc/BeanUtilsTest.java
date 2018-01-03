package com.jdbc;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.junit.Test;

import com.yxd.obj.Uusers;

public class BeanUtilsTest {

	@Test
	public void testGetProperty() throws IllegalAccessException, InvocationTargetException, NoSuchMethodException{
		Object object = new Uusers();
		System.out.println(object); 
		BeanUtils.setProperty(object, "u_uid", "3000");
		BeanUtils.setProperty(object, "uname", "xxx");
		System.out.println(object); 
		
		Object val = BeanUtils.getProperty(object, "uname");
		System.out.println(val);
	}
	
	@Test
	public void testSetProperty() throws IllegalAccessException, InvocationTargetException {
		
		Object object = new Uusers();
		System.out.println(object); 
		
		BeanUtils.setProperty(object, "uname", "xxx");
		System.out.println(object); 
		
	}

}
