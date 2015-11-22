package org.rail.dao.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.rail.model.Station;

public class StationDaoImpl extends BaseDaoImpl<Station> {
	public StationDaoImpl() {
		super();
		clazz = Station.class;
	}

	public List<Station> findAll() {
		return session.createCriteria(clazz).addOrder(Order.asc("nameStation")).list();
	}
}
