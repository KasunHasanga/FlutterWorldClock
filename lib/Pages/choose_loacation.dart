import 'package:flutter/material.dart';
import 'package:worldtime/Services/WorldTime.dart';

class ChoseLoacation extends StatefulWidget {

  @override
  _ChoseLoacationState createState() => _ChoseLoacationState();
}

class _ChoseLoacationState extends State<ChoseLoacation> {

  List<WorldTime> locations=[
    WorldTime(url:'Asia/Jakarta',location:'Jakartha' ,flags: 'indonesia.png'),
    WorldTime(url:'Europe/London',location:'London' ,flags: 'uk.png'),
    WorldTime(url:'Asia/Seoul',location:'South Korea' ,flags: 'south_korea.png'),
    WorldTime(url:'America/New_York',location:'New York' ,flags: 'usa.png'),
    WorldTime(url:'Europe/Athens',location:'Athens' ,flags: 'greece.png'),
    WorldTime(url:'Europe/Berlin',location:'Berlin' ,flags: 'germany.png'),
    WorldTime(url:'Africa/Cairo',location:'Cairo' ,flags: 'egypt.png'),
    WorldTime(url:'Asia/Colombo',location:'Colombo' ,flags: 'lanka.png'),
    WorldTime(url:'America/Chicago',location:'Chicago' ,flags: 'usa.png'),
  ];

  void updateTime(index) async{
    WorldTime instance =locations[index];
    await instance.getTime();
    //Navigate to home Screen
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flags,
      'isDayTime':instance.isDayTime,
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Chose a Location'),
        elevation: 0.0,
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context,index){

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  //print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flags}'),
                ),
              ),
            ),
          );
          }
      ),
      );
  }
}

