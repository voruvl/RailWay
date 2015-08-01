package org.rail.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "orders")
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	@Column(name = "id")
	private int id;
	@Column(name = "price")
	private Integer price;
	@ManyToOne
	@JoinColumn(name = "train_id", referencedColumnName = "id")
	private Train train;
	@ManyToOne
	@JoinColumn(name = "start_station", referencedColumnName = "id")
	private TrainStations startStation;
	@ManyToOne
	@JoinColumn(name = "stop_station", referencedColumnName = "id")
	private TrainStations stopStation;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	public TrainStations getStartStation() {
		return startStation;
	}

	public void setStartStation(TrainStations startStation) {
		this.startStation = startStation;
	}

	public TrainStations getStopStation() {
		return stopStation;
	}

	public void setStopStation(TrainStations stopStation) {
		this.stopStation = stopStation;
	}
	
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}


	@Override
	public String toString() {
		return "Order [id=" + id + ", train=" + train + ", startStation="
				+ startStation + ", stopStation=" + stopStation + "]";
	}

}
