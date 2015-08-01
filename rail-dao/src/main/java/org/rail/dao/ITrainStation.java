package org.rail.dao;

import java.util.List;

import org.rail.model.Train;
import org.rail.model.TrainStations;


public interface ITrainStation extends IBaseDao<TrainStations> {

	public List<TrainStations> getRoute(Train train);

	public List<TrainStations> getDataRoute(int trainId, int startStation,
			int stopStation);

	public Integer getStationRoute(int trainId, int stationId);
}
