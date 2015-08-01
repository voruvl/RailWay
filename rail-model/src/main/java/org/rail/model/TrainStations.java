package org.rail.model;

import java.io.Serializable;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "trainstations")
public class TrainStations implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	@Column(name = "id")
	private int id;

	@ManyToOne
	@JoinColumn(name = "station_id", referencedColumnName = "id")
	private Station station;

	@Column(name = "price")
	private int price;

	@Column(name = "time_arrival")
	private Time timeArrival;

	@Column(name = "time_departure")
	private Time timeDeparture;

	@ManyToOne
	@JoinColumn(name = "train_id", referencedColumnName = "id")
	private Train train;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public Time getTimeArrival() {
		return timeArrival;
	}

	public void setTimeArrival(Time timeArrival) {
		this.timeArrival = timeArrival;
	}

	public Time getTimeDeparture() {
		return timeDeparture;
	}

	public void setTimeDeparture(Time timeDeparture) {
		this.timeDeparture = timeDeparture;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	@Override
	public String toString() {
		return "TrainStations [id=" + id + ", station=" + station + ", price="
				+ price + ", train=" + train + "]";
	}

}
