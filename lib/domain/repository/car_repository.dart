import 'package:rent_a_car/data/models/car_model.dart';

abstract class CarRepository {
  Future<List<CarModel>> fetchCar();
}
