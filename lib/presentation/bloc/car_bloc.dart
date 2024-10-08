import 'package:bloc/bloc.dart';
import 'package:rent_a_car/domain/usecases/get_car.dart';
import 'package:rent_a_car/presentation/bloc/car_event.dart';
import 'package:rent_a_car/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCar getCar;
  CarBloc({required this.getCar}) : super(CarLoading()) {
    on<LoadCar>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await getCar.call();
        emit(CarLoaded(cars));
      } catch (e) {
        emit(CarLoadFailure(e.toString()));
      }
    });
  }
}
