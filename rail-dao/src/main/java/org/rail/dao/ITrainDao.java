package org.rail.dao;

import java.util.List;

import org.rail.model.Train;


public interface ITrainDao extends IBaseDao<Train> {
	
	public List<Train> getTrain(int start, int stop);
}
