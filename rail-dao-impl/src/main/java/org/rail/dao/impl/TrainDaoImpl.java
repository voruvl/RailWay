package org.rail.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.rail.dao.ITrainDao;
import org.rail.model.Train;



public class TrainDaoImpl extends BaseDaoImpl<Train> implements ITrainDao {

	public TrainDaoImpl() {
		super();
		clazz = Train.class;
	}

	public List<Train> getTrain(int start, int stop) {
		Query query = session
				.createSQLQuery(
						"select * from trains where id in " + "(select train_id from trainstations where station_id in "
								+ "(select id from stations where id in(:start,:stop)) group by train_id having count (train_id)>1)")
				.addEntity(clazz).setParameter("start", start).setParameter("stop", stop);
		List<Train> result = query.list();
		return result;
	}
}
