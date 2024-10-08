import 'package:confetti/confetti.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class CongratulationScreen extends StatefulWidget {
  final String carImage;
  const CongratulationScreen({super.key, required this.carImage});

  @override
  _CongratulationScreenState createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();

    // Initialize the ConfettiController
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));

    // Start the confetti animation when the screen is loaded
    _confettiController.play();

    // Auto-close the screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pop(); // Close the screen
    });
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Dispose of the confetti controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Congratulation message and car image
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Congratulation message
                Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Car Image
                Container(
                  height: 150,
                  width: 250,
                  child: Image.asset(
                    widget.carImage, // Display the car image
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Enjoy your Ride",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),

            // Confetti animation
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality:
                  BlastDirectionality.explosive, // Spread in all directions
              shouldLoop: false, // Only play once
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
              ], // Define the confetti colors
              createParticlePath:
                  drawStar, // Optional: create custom shapes like stars
            ),
          ],
        ),
      ),
    );
  }
}

// Optional: Function to create star-shaped particles
Path drawStar(Size size) {
  // Draw a custom star-shaped confetti
  double width = size.width;
  double halfWidth = width / 2;
  double externalRadius = halfWidth;
  double internalRadius = externalRadius / 2.5;
  double degreesPerStep = _degToRad(360 / 5);
  double halfDegreesPerStep = degreesPerStep / 2;
  Path path = Path();
  double startAngle = _degToRad(-90);
  path.moveTo(
    (halfWidth + externalRadius * math.cos(startAngle)),
    (halfWidth + externalRadius * math.sin(startAngle)),
  );
  for (int step = 1; step < 5 * 2; step++) {
    double radius = step.isEven ? externalRadius : internalRadius;
    double x =
        halfWidth + radius * math.cos(startAngle + step * halfDegreesPerStep);
    double y =
        halfWidth + radius * math.sin(startAngle + step * halfDegreesPerStep);
    path.lineTo(x, y);
  }
  path.close();
  return path;
}

double _degToRad(double deg) => deg * (math.pi / 180.0);
