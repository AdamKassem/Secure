import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/models/user_data.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/services/database.dart';
import 'package:secure/shared/loading.dart';
//import 'package:secure/screens/home/settings.dart';

class Fav extends StatefulWidget {
  final Function toggleView;
  Fav({this.toggleView});
  List items;

  @override
  _FavState createState() => new _FavState();
// _MyHomePageState createState() => new _MyHomePageState();

}
class _FavState extends State<Fav> {

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    List items = new List();

    return Scaffold(
        appBar: AppBar(
          title: Text('Favorite Passwords'),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
        ),
        //backgroundColor: Colors.teal[100],
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    fit: BoxFit.cover
                )
            ),
            constraints: BoxConstraints.expand(),

            child: StreamBuilder<UserData>(
              stream: DatabaseService(uid: user.uid).userInfo,
              builder: (context, snapshot){
                if (snapshot.hasData){
                  UserData userData = snapshot.data;
                  List items = userData.passwords;
                  if(items==null){items = new List();}
                  List temp1 = new List();
                  List temp2 = new List();
                  List temp3 = new List();
                  List temp4 = new List();
                  List temp5 = new List();
                  for(String s in items){
                    String c = s[0].toString();
                    if(c=='1'){
                      temp1.add(s);
                    }else if(c=='2'){
                      temp2.add(s);
                    }else if(c=='3'){
                      temp3.add(s);
                    }else if(c=='4'){
                      temp4.add(s);
                    }else if(c=='5'){
                      temp5.add(s);
                    }
                  }
                  temp1.sort();temp2.sort();temp3.sort();temp4.sort();temp5.sort();
                  items = new List();
                  for(String s in temp5){items.add(s);}
                  for(String s in temp4){items.add(s);}
                  for(String s in temp3){items.add(s);}
                  for(String s in temp2){items.add(s);}
                  for(String s in temp1){items.add(s);}
                  if(items.isEmpty){items.add(' There are no passwords. Favorite some passwords on the home page!');}
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      String PassNum = 'Password '+(index+1).toString();
                      return Dismissible(
                        key: Key(items[index]),
                        background: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) async {
                          DocumentReference docRef = Firestore.instance.collection('userData').document(user.uid);
                          String s = items[index] ;
                          docRef.updateData({'passwords':FieldValue.arrayRemove([s])});
                        },
                        direction: DismissDirection.endToStart,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 100.0,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 100.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5)
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage('images/secure3.png'),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          PassNum,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                          child: Container(
                                            width: 30,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.teal),
                                                borderRadius: BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Text("🔒",textAlign: TextAlign.center,),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                          child: Container(
                                            width: 260,
                                            child: Text(items[index].toString().substring(1),style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(255, 48, 48, 54)
                                            ),),


                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
    }else{
                  return Loading();
                }
  })
        )
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Password ${i + 1}";
    });
    return list;
  }

}