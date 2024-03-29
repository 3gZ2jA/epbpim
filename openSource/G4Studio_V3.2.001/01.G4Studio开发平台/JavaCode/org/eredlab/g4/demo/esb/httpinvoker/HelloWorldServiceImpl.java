package org.eredlab.g4.demo.esb.httpinvoker;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.eredlab.g4.bmf.base.Reader;
import org.eredlab.g4.bmf.util.SpringBeanLoader;
import org.eredlab.g4.ccl.datastructure.Dto;
import org.eredlab.g4.ccl.datastructure.impl.BaseDomain;
import org.eredlab.g4.ccl.datastructure.impl.BaseDto;
import org.eredlab.g4.ccl.util.G4Utils;

import bsh.This;

/**
 * Httpinvoker实现类
 * 
 * @author XiongChun
 * @since 2010-10-13
 * @see BaseDomain
 */
public class HelloWorldServiceImpl implements HelloWorldService {
	
	Log log = LogFactory.getLog(HelloWorldServiceImpl.class);
	
	/**
	 * sayHello
	 */
	public String sayHello(String text) {
		return "Hello," + text;
	}

	/**
	 * 查询一条结算明细测试数据
	 * 
	 * @param jsbh
	 * @return Dto
	 */
	public Dto queryBalanceInfo(String jsbh) {
		Reader reader = (Reader) SpringBeanLoader.getSpringBean("g4Reader");
		Dto inDto = new BaseDto("sxh", jsbh);
		Dto outDto = (BaseDto)reader.queryForObject("Demo.queryBalanceInfo", inDto);
		return outDto;
	}

}
