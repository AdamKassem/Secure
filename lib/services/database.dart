import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure/models/user_data.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference userData =
      Firestore.instance.collection('userData');

  Future updateUserData(String firstName, String lastName, var childhoodAnswers,
      var currentAnswers, var familyAnswers, var miscAnswers) async {
    return await userData.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      // changes below
      'childhood': childhoodAnswers,
      'current': currentAnswers,
      'family': familyAnswers,
      'misc': miscAnswers,
    });
  }
  // ORIGINAL CODE TO UPDATE DATA FOR EACH SET OF QUESTIONS
  // THIS CODE AND 'WORKING CODE' BOTH TRY AND CREATE A NEW USER ID
  // INSTEAD OF UPDATING CURRENT INFO

//  Future updateChildhoodAnswers(var childhoodAnswers) async {
//    return await userData.document(uid).updateData({
//      'childhood': childhoodAnswers,
//    });
//  }

  Future updateChildhoodAnswers(var childhoodAnswers) async {
    // ATTEMPTED TO QUERY DOCUMENT UID
//    Firestore.instance
//        .collection('userData')
//        .where(uid, isEqualTo: User(uid: uid));

//    Firestore.instance
//        .collection('userData')
//        .document(uid)
//        .get()
//        .then((DocumentSnapshot uid) {});
    return userData.document(uid).updateData({
      'childhood': childhoodAnswers,
    });
  }

  Future updateCurrentAnswers(var currentAnswers) async {
    return await userData.document(uid).updateData({
      'current': currentAnswers,
    });
  }

// get string arrays
  Future updateFamilyAnswers(var familyAnswers) async {
    return await userData.document(uid).updateData({
      'family': familyAnswers,
    });
  }

  Future updateMiscAnswers(var miscAnswers) async {
    return await userData.document(uid).updateData({
      'misc': miscAnswers,
    });
  }

  // data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      // maybe change bottom lines
      familyAnswers: snapshot.data['family'],
      childhoodAnswers: snapshot.data['childhood'],
      miscAnswers: snapshot.data['misc'],
      currentAnswers: snapshot.data['current'],
    );
  }

  // Get user doc stream
  Stream<UserData> get data {
    return userData.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
