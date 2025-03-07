import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth.dart';

class ColudStore {
  final db = FirebaseFirestore.instance;

  addScannedCardID(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    final userInfoCard = await ColudStore().readCard(user?.uid);

    var updatedIds = userInfoCard["cardsAdded"];

    print(userInfoCard);

    updatedIds.add(id);

    updatedIds = updatedIds.toSet().toList();

    await db
        .collection("Cards")
        .doc(user?.uid)
        .update({"cardsAdded": updatedIds})
        .then((value) => null)
        .catchError((error) => print("Failed to update user: $error"));
    print("updated");
  }

  addCard(String fullName, String jobTitle, String email, String web,
      String phone, String mobile) {
    final user = FirebaseAuth.instance.currentUser;

    final cardInfo = <String, dynamic>{
      "cardType": "1",
      "fullName": fullName,
      "jobTitle": jobTitle,
      "email": email,
      "web": web,
      "phone": phone,
      "mobile": mobile,
      "cardsAdded": []
    };
    db
        .collection("Cards")
        .doc(user?.uid)
        .set(cardInfo)
        .onError((e, _) => print("Error writing document: $e"));
  }

  readCard(id) async {
    final docRef = await db.collection("Cards").doc(id);
    if (docRef == null) {
      return;
    }
    return await docRef.get().then(
      (DocumentSnapshot doc) {
        if (doc.data() == null) {
          return {};
        }
        final data = doc.data() as Map<String, dynamic>;

        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
