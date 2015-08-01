package org.rail.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.rail.dao.IBaseDao;

import railWay.util.HibernateUtil;



public class BaseDaoImpl<T> implements IBaseDao<T> {
	protected Connection connect;

	protected Class<T> clazz;

	protected Session session;

	public BaseDaoImpl() {
		session = HibernateUtil.getSessionFactory().openSession();
	}

	public T findOne(int id) {
		return session.load(clazz, id);
	}

	public List<T> findAll() {
		return session.createCriteria(clazz).list();
	}

	public void create(T entity) {
		session.beginTransaction();
		session.save(entity);
		session.getTransaction().commit();

	}

	public T update(T entity) {
		session.beginTransaction();
		session.update(entity);
		session.getTransaction().commit();
		return entity;
	}

	public void delete(T entity) {
		session.beginTransaction();
		session.delete(entity);
		session.getTransaction().commit();

	}

	public void deleteById(int entityId) {
		T find = findOne(entityId);
		delete(find);

	}

}
