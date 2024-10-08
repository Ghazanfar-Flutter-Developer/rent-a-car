import 'package:flutter/material.dart';
import 'package:rent_a_car/data/models/car_model.dart';
import 'package:rent_a_car/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  final List<CarModel> cars = [
    CarModel(
      model: 'Range Rover',
      image: [
        'assets/images/range_rover.png',
        'assets/images/range_rover_front.png'
      ],
      distance: 350,
      fuelCapacity: 60,
      pricePerHour: 80,
    ),
    CarModel(
      model: 'Land Crusier',
      image: [
        'assets/images/lc.png',
        'assets/images/lc_front.png',
      ],
      distance: 800,
      fuelCapacity: 150,
      pricePerHour: 75,
    ),
    CarModel(
      model: 'Fortuner GR',
      image: [
        'assets/images/car_image.png',
        'assets/images/white_car.png',
      ],
      distance: 320,
      fuelCapacity: 55,
      pricePerHour: 70,
    ),
    CarModel(
      model: 'Revo Rocco',
      image: [
        'assets/images/revo.png',
        'assets/images/revo_front.png',
      ],
      distance: 350,
      fuelCapacity: 80,
      pricePerHour: 65,
    ),
    CarModel(
      model: 'Hyundia Sonata',
      image: [
        'assets/images/sonata_side.png',
        'assets/images/sonata.png',
      ],
      distance: 1120,
      fuelCapacity: 55,
      pricePerHour: 60,
    ),
    CarModel(
      model: 'Honda Civic',
      image: [
        'assets/images/civic.png',
        'assets/images/civic_front.png',
      ],
      distance: 450,
      fuelCapacity: 55,
      pricePerHour: 55,
    ),
    CarModel(
      model: 'Toyota Corolla',
      image: [
        'assets/images/corolla.png',
        'assets/images/corolla_front.png',
      ],
      distance: 750,
      fuelCapacity: 55,
      pricePerHour: 50,
    ),
    CarModel(
      model: 'Suzuki WagonR',
      image: [
        'assets/images/wagonr.png',
        'assets/images/wagonr_front.png',
      ],
      distance: 490,
      fuelCapacity: 40,
      pricePerHour: 45,
    ),
    CarModel(
      model: 'Suzuki Mehran',
      image: [
        'assets/images/mehran.png',
        'assets/images/mehran_front.png',
      ],
      distance: 950,
      fuelCapacity: 35,
      pricePerHour: 35,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Car"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(
            carModel: cars[index],
          );
        },
      ),
    );
  }
}
