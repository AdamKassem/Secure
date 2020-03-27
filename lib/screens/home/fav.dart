import 'package:flutter/material.dart';
import 'package:secure/screens/home/home.dart';
//import 'package:secure/screens/home/settings.dart';

class Fav extends StatefulWidget {
  final Function toggleView;
  Fav({this.toggleView});

  @override
  _FavState createState() => new _FavState();
// _MyHomePageState createState() => new _MyHomePageState();

}
class _FavState extends State<Fav> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage('images/Background.jpg'),
                    fit: BoxFit.cover
                )
            ),
            constraints: BoxConstraints.expand(),

            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
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
                  onDismissed: (direction) {
                    setState(() {
                      items.removeAt(index);
                    });
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
                            width: 70.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  //image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
                                  image: AssetImage('images/secure4.1.jpg'),
                                )
                            ),
                          ),
                          Container(
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index],
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
                                      child: Text("Display Password",style: TextStyle(
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
            )
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