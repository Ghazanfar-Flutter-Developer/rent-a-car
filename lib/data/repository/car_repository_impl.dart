import 'package:rent_a_car/data/dataSource/firebase_car_data_source.dart';
import 'package:rent_a_car/data/models/car_model.dart';
import 'package:rent_a_car/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<List<CarModel>> fetchCar() {
    return dataSource.getCar();
  }
}
