//import 'dart:collection';

class UserData {
  final String uid;
  final String firstName;
  final String lastName;

  // ADDED THE FOLLOWING SO THAT IT COULD BE UPDATED UPON SURVEY COMPLETION
  var familyAnswers;
  var childhoodAnswers;
  var miscAnswers;
  var currentAnswers;

  UserData(
      {this.uid,
      this.firstName,
      this.lastName,
      this.familyAnswers,
      this.childhoodAnswers,
      this.miscAnswers,
      this.currentAnswers});
}
