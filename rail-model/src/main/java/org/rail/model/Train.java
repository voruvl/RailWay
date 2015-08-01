package org.rail.model;

import java.io.Serializable;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "trains")
public class Train implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(generator = "increment")
	@GenericGenerator(name = "increment", strategy = "increment")
	@Column(name = "id")
	private int id;
	@Column(name = "numer")
	private Integer numer;
	@Column(name = "first_station")
	private String firstStation;
	@Column(name = "last_station")
	private String lastStation;
	@Column(name = "time_depart")
	private Time time;

	public Integer getNumer() {
		return numer;
	}

	public void setNumer(Integer numer) {
		this.numer = numer;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = Time.valueOf(time.toLocalTime());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstStation() {
		return firstStation;
	}

	public void setFirstStation(String firstStation) {
		this.firstStation = firstStation;
	}

	public String getLastStation() {
		return lastStation;
	}

	public void setLastStation(String lastStation) {
		this.lastStation = lastStation;
	}

	@Override
	public String toString() {
		return "Train [id=" + id + ", firstStation=" + firstStation + ", lastStation=" + lastStation + ", time=" + time + "]";
	}

}
