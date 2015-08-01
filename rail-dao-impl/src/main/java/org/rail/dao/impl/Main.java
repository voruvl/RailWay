package org.rail.dao.impl;

public class Main {

	public static void main(String[] args) {
		TrainDaoImpl td = new TrainDaoImpl();
		td.deleteById(2);
	}

}
