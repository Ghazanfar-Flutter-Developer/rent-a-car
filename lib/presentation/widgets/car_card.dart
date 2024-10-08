import 'package:flutter/material.dart';
import 'package:rent_a_car/common/colors/app_colors.dart';
import 'package:rent_a_car/data/models/car_model.dart';
import 'package:rent_a_car/presentation/pages/car_detail_screen.dart';

class CarCard extends StatelessWidget {
  final CarModel carModel;
  const CarCard({
    super.key,
    required this.carModel,
  });

  @override
  Widget build(BuildContext context) {
    final firstImage = carModel.image[0];
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CarDetailScreen(
                carModel: carModel,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 5,
              )
            ]),
        child: Column(
          children: [
            Image.asset(
              firstImage,
              height: 120,
            ),
            Text(
              carModel.model,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/gps.png',
                    ),
                    Text(
                      '${carModel.distance.toStringAsFixed(0)}KM',
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/pump.png',
                    ),
                    Text(
                      '${carModel.fuelCapacity.toStringAsFixed(0)}L',
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '\$${carModel.pricePerHour.toStringAsFixed(2)}/h',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
