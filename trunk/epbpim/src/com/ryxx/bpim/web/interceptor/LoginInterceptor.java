package com.ryxx.bpim.web.interceptor;

import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.ryxx.bpim.common.Constants;

public class LoginInterceptor implements Interceptor {

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
		String username = (String) session.get(Constants.LOGIN_USER_NAME);
		Long userId = (Long) session.get(Constants.LOGIN_USER_ID);
		if(StringUtils.isNotEmpty(username) && userId != null && userId>0) {
			session.put(Constants.LOGIN_USER_NAME, username);
			return arg0.invoke();
		}
		return "nosession";
	}
}
