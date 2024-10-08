import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rent_a_car/data/dataSource/firebase_car_data_source.dart';
import 'package:rent_a_car/data/repository/car_repository_impl.dart';
import 'package:rent_a_car/domain/repository/car_repository.dart';
import 'package:rent_a_car/domain/usecases/get_car.dart';
import 'package:rent_a_car/presentation/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    // Register FirebaseFirestore
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    // Register FirebaseCarDataSource
    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));

    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    getIt.registerLazySingleton<GetCar>(() => GetCar(getIt<CarRepository>()));
    getIt.registerFactory(() => CarBloc(getCar: getIt<GetCar>()));
  } catch (e) {
    throw Exception(e);
  }
}
