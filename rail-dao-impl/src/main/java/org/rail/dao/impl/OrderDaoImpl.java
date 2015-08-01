package org.rail.dao.impl;

import org.rail.model.Order;


public class OrderDaoImpl extends BaseDaoImpl<Order> {
	public OrderDaoImpl() {
		super();
		clazz = Order.class;
	}
}
