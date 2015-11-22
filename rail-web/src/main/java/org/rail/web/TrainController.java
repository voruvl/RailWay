package org.rail.web;

import java.sql.Time;
import java.util.List;
import java.util.Locale;

import org.rail.dao.impl.StationDaoImpl;
import org.rail.dao.impl.TrainDaoImpl;
import org.rail.model.Station;
import org.rail.model.Train;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TrainController {

	private static final Logger logger = LoggerFactory.getLogger(TrainController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {

		TrainDaoImpl trainDao = new TrainDaoImpl();
		List<Train> trains = trainDao.findAll();
		model.addAttribute("trList", trains);
		ModelAndView mView = new ModelAndView("trains");
		return mView;
	}

	@RequestMapping(value = "/trains", method = RequestMethod.GET)
	public ModelAndView listTrain(Model model) {
		TrainDaoImpl trainDao = new TrainDaoImpl();
		List<Train> trains = trainDao.findAll();
		model.addAttribute("trList", trains);
		
		StationDaoImpl stationDao = new StationDaoImpl();
		List<Station> stations = stationDao.findAll();
		model.addAttribute("stationList", stations);
		
		ModelAndView mView = new ModelAndView("trains");
		return mView;

	}

	@RequestMapping(value = "/delTrain", method = RequestMethod.GET)
	public ModelAndView delTrain(@RequestParam("id") int id, Locale locale, Model model) {
		try {
			TrainDaoImpl trainDao = new TrainDaoImpl();
			trainDao.deleteById(id);
		} catch (Exception e) {
			logger.error("Violated constraint");
		}
		ModelAndView mView = new ModelAndView("redirect:trains");

		return mView;
	}

	@RequestMapping(value = "/addTrain", method = RequestMethod.GET)
	public ModelAndView addTrain(@RequestParam("num") int numer, @RequestParam("fst") String firstStation, @RequestParam("lst") String lastStation,
			@RequestParam("time") String time) {

		TrainDaoImpl trainDao = new TrainDaoImpl();
		Train train = new Train();
		train.setFirstStation(firstStation);
		train.setLastStation(lastStation);
		train.setNumer(numer);
		time = time + ":00";
		train.setTime(Time.valueOf(time));
		try {
			trainDao.create(train);
		} catch (Exception e) {
			logger.info(e.toString());
		}
		
		logger.info("Insert train " + train);
		ModelAndView mView = new ModelAndView("redirect:trains");

		return mView;
	}
}
