import 'package:rent_a_car/data/models/car_model.dart';
import 'package:rent_a_car/domain/repository/car_repository.dart';

class GetCar {
  final CarRepository repository;

  GetCar(this.repository);

  Future<List<CarModel>> call() async {
    return await repository.fetchCar();
  }
}
