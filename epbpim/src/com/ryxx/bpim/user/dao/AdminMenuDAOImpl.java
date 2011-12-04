package com.ryxx.bpim.user.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.ryxx.bpim.dao.AbstractBaseDAO;
import com.ryxx.bpim.user.entity.AdminMenu;

public class AdminMenuDAOImpl extends AbstractBaseDAO<AdminMenu, Long> implements AdminMenuDAO{
	
	@Override
	public List<AdminMenu> findAllParentNode() {
		Criterion[] crits = {Restrictions.eq("enable", 1), Restrictions.eq("parentId", 0)};
		return findByCriteria(crits);
	}
	
	@Override
	public List<AdminMenu> findAllSubNode (Integer parentId) {
		Criterion[] crits = {Restrictions.eq("enable", 1), Restrictions.eq("parentId", parentId)};
		return findByCriteria(crits);
	}
	
	@Override
	public List<AdminMenu> findAllEnableNode() {
		Criterion[] crits = {Restrictions.eq("enable", 1)};
		return findByCriteria(crits);
	}
}
