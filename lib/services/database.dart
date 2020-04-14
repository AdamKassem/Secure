import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:secure/models/user_data.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // Collection reference
  final CollectionReference userData = Firestore.instance.collection('userData');

  Future updateUserData(String firstName, lastName, email) async {
    List responses = new List();
    List passwords = new List();
    return await userData.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'email' : email,
      'responses': responses,
      'passwords': passwords
    });
  }

  // data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      email: snapshot.data['email'],
      passwords: snapshot.data['passwords'],
      responses: snapshot.data['responses']
    );
  }

  // Get user doc stream
  Stream<UserData> get userInfo {
    return userData.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}