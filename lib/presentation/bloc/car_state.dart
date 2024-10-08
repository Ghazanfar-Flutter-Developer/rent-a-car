import 'package:rent_a_car/data/models/car_model.dart';

abstract class CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<CarModel> carmodel;
  CarLoaded(this.carmodel);
}

class CarLoadFailure extends CarState {
  final String message;
  CarLoadFailure(this.message);
}
