package org.rail.web;

import java.util.List;
import java.util.Locale;

import org.rail.dao.impl.StationDaoImpl;
import org.rail.model.Station;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class StationController {

	private static final Logger logger = LoggerFactory
			.getLogger(StationController.class);

	@RequestMapping(value = "/stations", method = RequestMethod.GET)
	public ModelAndView listStation(Model model) {
		StationDaoImpl stationDao = new StationDaoImpl();
		List<Station> stations = stationDao.findAll();
		model.addAttribute("stList", stations);
		ModelAndView mView = new ModelAndView("stations");
		return mView;

	}

	@RequestMapping(value = "/delStation", method = RequestMethod.GET)
	public ModelAndView delTrain(@RequestParam("id") int id, Locale locale,
			Model model) {
		try {
			StationDaoImpl stationDao = new StationDaoImpl();
			stationDao.deleteById(id);
		} catch (Exception e) {
			logger.error("Violated constraint");
		}

		ModelAndView mView = new ModelAndView("redirect:stations");

		return mView;
	}

	@RequestMapping(value = "/addStation", method = RequestMethod.GET)
	public ModelAndView addStation(
			@RequestParam("namestation") String nameStation) {

		StationDaoImpl stationDao = new StationDaoImpl();
		Station station = new Station();
		station.setNameStation(nameStation);
		stationDao.create(station);
		logger.info("Insert station " + station);
		ModelAndView mView = new ModelAndView("redirect:stations");

		return mView;
	}
}
