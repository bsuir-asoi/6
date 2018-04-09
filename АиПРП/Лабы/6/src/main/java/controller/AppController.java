package controller;

import logic.CarManager;
import model.Car;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AppController {

    private final static String VIEW_NAME = "main";
    private final CarManager carManager = new CarManager();

    @RequestMapping("/main")
    public ModelAndView getCarList() {
        return getModelAndView();
    }

    @RequestMapping("/showPrice")
    public ModelAndView getPriceByModel(HttpServletRequest request) {
        String carModel = request.getParameter("model");
        ModelAndView modelAndView = getModelAndView();
        modelAndView.addObject("carModel", carModel);
        modelAndView.addObject("carPrice", carManager.getPriceByModel(carModel));
        return modelAndView;
    }

    @RequestMapping("/addCar")
    public ModelAndView addCar(HttpServletRequest request) {
        String carModel = request.getParameter("model");
        int carPrice = Integer.valueOf(request.getParameter("price"));
        Car car = new Car();
        car.setModel(carModel);
        car.setPrice(carPrice);
        carManager.addCar(car);
        return getModelAndView();
    }

    @RequestMapping("/carSearch")
    public ModelAndView getCarListByPrice(HttpServletRequest request) {
        int maxPrice = Integer.valueOf(request.getParameter("max-price"));
        List<Car> carListByPrice = carManager.getCarListByPrice(maxPrice);
        ModelAndView modelAndView = getModelAndView();
        modelAndView.addObject("carListByPrice", carListByPrice);
        return modelAndView;
    }

    private ModelAndView getModelAndView() {
        ModelAndView modelAndView = new ModelAndView(VIEW_NAME);
        modelAndView.addObject("carList", carManager.getCarList());
        return modelAndView;
    }
}