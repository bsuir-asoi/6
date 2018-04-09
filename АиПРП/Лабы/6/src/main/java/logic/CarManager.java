package logic;

import model.Car;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CarManager {
    private static List<Car> cars = new LinkedList<Car>();
    private static long id = 1;

    static {
        Car car1 = new Car();
        car1.setId(id++);
        car1.setModel("Mercedes-Benz SL 500");
        car1.setPrice(20000);

        Car car2 = new Car();
        car2.setId(id++);
        car2.setModel("Peugeot 607");
        car2.setPrice(35000);

        Car car3 = new Car();
        car3.setId(id++);
        car3.setModel("KIA Rio");
        car3.setPrice(15000);

        Car car4 = new Car();
        car4.setId(id++);
        car4.setModel("Toyota Camry");
        car4.setPrice(25000);

        cars.add(car1);
        cars.add(car2);
        cars.add(car3);
        cars.add(car4);
    }

    public List<Car> getCarList() {
        return cars;
    }

    public void addCar(Car newCar) {
        newCar.setId(id++);
        cars.add(newCar);
    }

    public List<Car> getCarListByPrice(int maxPrice) {
        List<Car> suitableCars = new ArrayList<Car>();
        for (Car car : cars) {
            if (car.getPrice() <= maxPrice) {
                suitableCars.add(car);
            }
        }
        return suitableCars;
    }

    public Integer getPriceByModel(String model) {
        for (Car car : cars) {
            if (car.getModel().equalsIgnoreCase(model)) {
                return car.getPrice();
            }
        }
        return null;
    }
}
