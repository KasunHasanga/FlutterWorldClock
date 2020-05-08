import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    //set Background
    String bgImage=data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor =data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(

              children: <Widget>[
                FlatButton.icon(

                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.grey[200],
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[200],
                      ),
                    )),

                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['Location'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

