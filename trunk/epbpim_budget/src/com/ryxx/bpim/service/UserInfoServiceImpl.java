package com.ryxx.bpim.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.mail.EmailException;

import com.ryxx.bpim.common.Constants;
import com.ryxx.bpim.dao.UserInfoDAO;
import com.ryxx.bpim.entity.AdminMenu;
import com.ryxx.bpim.entity.EnterpriseInfo;
import com.ryxx.bpim.entity.ProvinceCity;
import com.ryxx.bpim.entity.UserInfo;
import com.ryxx.bpim.enums.RoleEnum;
import com.ryxx.util.email.EmailTools;
import com.ryxx.util.page.PageTools;
import com.ryxx.util.string.StringTools;

public class UserInfoServiceImpl extends
		AbstractService<UserInfo, UserInfoDAO, Long> implements UserInfoService {
	public List<UserInfo> listPage(UserInfo userInfo, PageTools page) {
		// if (page != null) {
		// if (page.getRecordCount() == 0) {
		// int count = getDao().getRowCount(userInfo);
		// page.setRecordCount(count);
		// }
		// userInfo.setStartRow(page.getPageStartRow());
		// userInfo.setPageSize(page.getPageSize());
		// }
		// return getDao().findByCount(userInfo);
		return null;
	}

	public List<UserInfo> list(Long enterpriseId) {
		return getDao().list(enterpriseId);
	}

	public String getMaxIdentify() {
		return getDao().getMaxIdentify();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.ryxx.bpim.service.UserInfoService#getByLogin(com.ryxx.bpim.entity
	 * .UserInfo)
	 */
	@Override
	public UserInfo getByLogin(UserInfo userInfo) {
		return getDao().getByLogin(userInfo);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.ryxx.bpim.service.UserInfoService#batchAddUsers(java.lang.Integer,
	 * com.ryxx.bpim.entity.EnterpriseInfo, java.util.List)
	 */
	@Override

	public void batchAddUsers(Integer userCount, EnterpriseInfo enterpriseInfo,
			List<AdminMenu> menus, List regionCheck) throws EmailException {
		if(userCount != null && userCount > 0) {
			List<UserInfo> users = new ArrayList<UserInfo>();
			for (int i = 0; i < userCount; i++) {
				UserInfo userInfo = new UserInfo();
				userInfo.setRoleType(RoleEnum.NORMAL_USER);
				userInfo.setEnterpriseInfo(enterpriseInfo);
				userInfo.setRegisterDate(new Timestamp(System
						.currentTimeMillis()));
				userInfo.setPassword(StringTools.md5(Constants.DEFAULT_PASSWORD));
				userInfo.setEnable(new Integer(1));
				if(regionCheck != null && regionCheck.size() > 0) {
					List<ProvinceCity> provinces = new ArrayList<ProvinceCity>();
					for(int k=0;k<regionCheck.size();k++) {
						ProvinceCity province = new ProvinceCity();
						province.setId(Long.valueOf(regionCheck.get(k).toString()));
						provinces.add(province);
					}
					userInfo.setProvinceCities(provinces);
				}
				String maxIdentify = getDao().getMaxIdentify();
				if (maxIdentify == null || maxIdentify.length() == 0) {
					userInfo.setIdentifier("ry10000001");
				} else {
					userInfo.setIdentifier("ry"
							+ (Long.parseLong(maxIdentify.substring(2)) + 1));
				}
				try {
					userInfo.setMenus(menus);
					UserInfo user = getDao().save(userInfo);
					users.add(userInfo);
				} catch (Exception e) {
					System.out.println(e);
				}
			}
			String content = EmailTools.generateBatchUserContent(users);
			List<String> addresses = new ArrayList<String>();
			addresses.add(enterpriseInfo.getEmail());
			addresses.add(Constants.MAIL_USER_NAME);
			EmailTools.send(addresses, Constants.EMAIL_SUBJECT, content);
		}
	}

	/* (non-Javadoc)
	 * @see com.ryxx.bpim.service.UserInfoService#getUserByIdentifier(java.lang.String)
	 */
	@Override
	public UserInfo getUserByIdentifier(String identifier) {
		return getDao().findeByIdentifier(identifier);
	}
}
