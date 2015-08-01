package org.rail.web;

import java.util.List;

import org.rail.model.Train;
import org.rail.model.TrainStations;







public class ListTrains {
	private Train train;
	private List<TrainStations> listTrainStations;
	private int summPrice;

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	public List<TrainStations> getListTrainStations() {
		return listTrainStations;
	}

	public void setListTrainStations(List<TrainStations> listTrainStations) {
		this.listTrainStations = listTrainStations;
	}

	public int getSummPrice() {
		return summPrice;
	}

	public void setSummPrice(int summPrice) {
		this.summPrice = summPrice;
	}
}
