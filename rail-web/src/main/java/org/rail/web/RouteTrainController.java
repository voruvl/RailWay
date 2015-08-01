package org.rail.web;

import java.sql.Time;
import java.util.List;
import java.util.Locale;

import org.rail.dao.impl.StationDaoImpl;
import org.rail.dao.impl.TrainDaoImpl;
import org.rail.dao.impl.TrainStationDaoImpl;
import org.rail.model.Station;
import org.rail.model.Train;
import org.rail.model.TrainStations;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class RouteTrainController {

	private static final Logger logger = LoggerFactory.getLogger(RouteTrainController.class);

	@RequestMapping(value = "/routeTrain", method = RequestMethod.GET)
	public ModelAndView routeTrain(@RequestParam("id") int id, Model model) {
		TrainDaoImpl trainDao = new TrainDaoImpl();
		Train train = trainDao.findOne(id);
		model.addAttribute("train", train);

		TrainStationDaoImpl routeTrain = new TrainStationDaoImpl();
		List<TrainStations> routeStations = routeTrain.getRoute(train);
		model.addAttribute("routeStations", routeStations);

		StationDaoImpl stationDao = new StationDaoImpl();
		List<Station> stations = stationDao.findAll();
		model.addAttribute("stationList", stations);

		ModelAndView mView = new ModelAndView("routes");
		return mView;

	}

	@RequestMapping(value = "/delRoute", method = RequestMethod.GET)
	public ModelAndView delRoute(@RequestParam("id") int id, Locale locale, Model model) {

		TrainStationDaoImpl routeDao = new TrainStationDaoImpl();
		TrainStations route = routeDao.findOne(id);
		Train train = route.getTrain();
		model.addAttribute("id", train.getId());
		routeDao.deleteById(id);

		ModelAndView mView = new ModelAndView("redirect:routeTrain");

		return mView;
	}

	@RequestMapping(value = "/routes", method = RequestMethod.GET)
	public ModelAndView listTrain(Model model) {
		TrainStationDaoImpl routeDao = new TrainStationDaoImpl();
		List<TrainStations> routes = routeDao.findAll();
		model.addAttribute("routeList", routes);

		StationDaoImpl stationDao = new StationDaoImpl();
		List<Station> stations = stationDao.findAll();
		model.addAttribute("stationList", stations);
		ModelAndView mView = new ModelAndView("routes");
		return mView;

	}

	@RequestMapping(value = "/addrouteTrain", method = RequestMethod.GET)
	public ModelAndView routeTrain(@RequestParam("trainId") int trainId, @RequestParam("stationId") int stationId,
			@RequestParam("price") Integer price, @RequestParam("timeArrival") String timeArrival,
			@RequestParam("timeDeparture") String timeDeparture, Locale locale, Model model) {

		if (timeArrival.equals(""))
			timeArrival = "00:00:00";
		if (timeDeparture.equals(""))
			timeDeparture = "00:00:00";
		if (price == null)
			price = 0;
		TrainDaoImpl trainDao = new TrainDaoImpl();
		Train train = trainDao.findOne(trainId);

		StationDaoImpl stationDao = new StationDaoImpl();
		Station station = stationDao.findOne(stationId);

		TrainStationDaoImpl trainRouteDao = new TrainStationDaoImpl();
		TrainStations trainRoute = new TrainStations();

		trainRoute.setTrain(train);

		trainRoute.setPrice(price);
		trainRoute.setStation(station);

		try {
			trainRoute.setTimeArrival(Time.valueOf(timeArrival + ":00"));
			trainRoute.setTimeDeparture(Time.valueOf(timeDeparture + ":00"));
			trainRouteDao.create(trainRoute);
		} catch (Exception e) {
			logger.info(timeArrival);
			logger.info("Not entering date arrival and departure");
		}
		logger.info("Insert route");
		model.addAttribute("id", trainId);
		ModelAndView mView = new ModelAndView("redirect:routeTrain");

		return mView;
	}
}
