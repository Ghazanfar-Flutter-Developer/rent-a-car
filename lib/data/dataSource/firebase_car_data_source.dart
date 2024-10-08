import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_a_car/data/models/car_model.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({
    required this.firestore,
  });

  Future<List<CarModel>> getCar() async {
    var snapshot = await firestore.collection('car').get();
    return snapshot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}
