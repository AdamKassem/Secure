import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure/models/user_data.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // Collection reference
  final CollectionReference userData = Firestore.instance.collection('userData');

  Future updateUserData(String firstName, lastName) async {
    return await userData.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  // data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
    );
  }

  // Get user doc stream
  Stream<UserData> get data {
    return userData.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}