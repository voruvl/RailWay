package org.rail.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Expression;
import org.rail.dao.ITrainStation;
import org.rail.model.Train;
import org.rail.model.TrainStations;



public class TrainStationDaoImpl extends BaseDaoImpl<TrainStations> implements
		ITrainStation {
	public TrainStationDaoImpl() {
		super();
		clazz = TrainStations.class;
	}

	public List<TrainStations> getRoute(Train train) {
		Criteria criteria = session.createCriteria(clazz);
		criteria.add(Expression.eq("train", train));
		List<TrainStations> route = criteria.list();
		return route;
	}

	public List<TrainStations> getDataRoute(int trainId, int startStation,
			int stopStation) {
		Query query = session
				.createSQLQuery(
						"select * from trainstations where train_id=:id and station_id >=:startstation and station_id<=:stopstation")
				.addEntity(clazz).setParameter("id", trainId)
				.setParameter("startstation", startStation)
				.setParameter("stopstation", stopStation);
		List<TrainStations> result = query.list();
		return result;
	}

	public Integer getStationRoute(int trainId, int stationId) {
		Query query = session
				.createSQLQuery(
						"select id from trainstations"
								+ "  where train_id=:trainid and "
								+ "station_id=:stationid")
				.setParameter("trainid", trainId).setParameter("stationid", stationId);
		Integer result = (Integer) query.list().get(0);

		return result;
	}
}
