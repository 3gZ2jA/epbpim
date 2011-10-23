package com.ryxx.bpim.web.interceptor;

import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.ryxx.bpim.common.Constants;

public class AdminLoginInterceptor implements Interceptor {

	private static final long serialVersionUID = -5212074066634437086L;
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.interceptor.Interceptor#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.interceptor.Interceptor#init()
	 */
	public void init() {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.interceptor.Interceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	public String intercept(ActionInvocation arg0) throws Exception {
		 Map session = arg0.getInvocationContext().getSession();
	        String username = (String)session.get(Constants.ADMIN_LOGIN_USER_NAME);
	        if (!StringUtils.isEmpty(username))
	        {
	            session.put(Constants.ADMIN_LOGIN_USER_NAME, username);
	            return arg0.invoke();
	        }
		return "nosessionadmin";
	}
}
