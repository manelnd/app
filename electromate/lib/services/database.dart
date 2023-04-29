import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference databaseRef = FirebaseDatabase.instance.reference();

  Future<void> writeData(String userId, String key, dynamic value) async {
    await databaseRef.child('users').child(userId).child(key).set(value);
  }

  /*Future<Map<dynamic, dynamic>> readData(String userId) async {
    DataSnapshot snapshot =
        await databaseRef.child('users').child(userId).once();
    Map<dynamic, dynamic>? map = snapshot.value != null
        ? Map<dynamic, dynamic>.from(snapshot.value)
        : null;

    if (map == null) {
      throw Exception('No data found for user with ID $userId');
    }

    return map;
  }*/
}
