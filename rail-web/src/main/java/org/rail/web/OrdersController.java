package org.rail.web;

import java.util.ArrayList;
import java.util.List;

import org.rail.dao.impl.OrderDaoImpl;
import org.rail.dao.impl.StationDaoImpl;
import org.rail.dao.impl.TrainDaoImpl;
import org.rail.dao.impl.TrainStationDaoImpl;
import org.rail.model.Order;
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
public class OrdersController {

	private static final Logger logger = LoggerFactory
			.getLogger(OrdersController.class);

	@RequestMapping(value = "order", method = RequestMethod.GET)
	public ModelAndView createOrder(Model model) {

		StationDaoImpl stationDao = new StationDaoImpl();
		List<Station> stations = stationDao.findAll();
		model.addAttribute("stationArrivalList", stations);
		model.addAttribute("stationDepartureList", stations);

		ModelAndView mView = new ModelAndView("order");
		return mView;

	}

	@RequestMapping(value = "openorder", method = RequestMethod.GET)
	public ModelAndView createOrderList(Model model,
			@RequestParam("arrivalId") int arrivalId,
			@RequestParam("departId") int departId) {

		model.addAttribute("arrivalId", arrivalId);
		model.addAttribute("departId", departId);
		StationDaoImpl stationDao = new StationDaoImpl();
		Station startStation = stationDao.findOne(arrivalId);
		Station stopStation = stationDao.findOne(departId);

		TrainDaoImpl trainDao = new TrainDaoImpl();
		TrainStationDaoImpl trainRouteDao = new TrainStationDaoImpl();

		List<Train> trains = trainDao.getTrain(arrivalId, departId);
		List<ListTrains> allListTrain = new ArrayList<ListTrains>();

		for (Train train : trains) {
			ListTrains listTrain = new ListTrains();
			int price = 0;
			listTrain.setTrain(train);
			logger.info(train.toString());
			List<TrainStations> routeTrain = trainRouteDao.getDataRoute(
					train.getId(), arrivalId, departId);
			listTrain.setListTrainStations(routeTrain);
			for (int index = 0; index < routeTrain.size(); index++) {
				if (index > 0)
					price += routeTrain.get(index).getPrice();
				logger.info(routeTrain.get(index).getStation().getNameStation());
			}
			allListTrain.add(listTrain);
			listTrain.setSummPrice(price);
		}
		logger.info("" + arrivalId);
		logger.info("" + departId);

		model.addAttribute("startstation", startStation);
		model.addAttribute("stopstation", stopStation);
		model.addAttribute("allListTrain", allListTrain);
		ModelAndView mView = new ModelAndView("openorder");
		return mView;

	}

	@RequestMapping(value = "orderlist", method = RequestMethod.GET)
	public ModelAndView OrderList(Model model) {

		OrderDaoImpl orderDao = new OrderDaoImpl();
		List<Order> orders = orderDao.findAll();
		model.addAttribute("orders", orders);

		ModelAndView mView = new ModelAndView("orderlist");
		return mView;

	}

	@RequestMapping(value = "createorders", method = RequestMethod.GET)
	public ModelAndView createOrders(Model model,
			@RequestParam("trainId") int trainId,
			@RequestParam("firstStation") int firstStationId,
			@RequestParam("lastStation") int lastStationId,
			@RequestParam("price") int price) {
		OrderDaoImpl orderDao = new OrderDaoImpl();
		Order order = new Order();
		TrainDaoImpl trainDao = new TrainDaoImpl();
		TrainStationDaoImpl tsdi = new TrainStationDaoImpl();
		TrainStations startTrainStation = tsdi.findOne(tsdi.getStationRoute(
				trainId, firstStationId));
		TrainStations stopTrainStation = tsdi.findOne(tsdi.getStationRoute(
				trainId, lastStationId));
		Train train = trainDao.findOne(trainId);
		order.setTrain(train);
		order.setStartStation(startTrainStation);
		order.setStopStation(stopTrainStation);
		order.setPrice(price);
		orderDao.create(order);
		ModelAndView mView = new ModelAndView("redirect:orderlist");
		return mView;

	}
}
