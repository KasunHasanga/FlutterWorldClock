import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
String location; //Location Name of the UI
String time; //The time is in thar URL
String flags; //url to an asset flag icon
String url; //Location url to the end point url
bool isDayTime=true; //True or false if dayTime Or not

WorldTime({this.url,this.flags,this.location,this.isDayTime});


Future<void> getTime() async{

try{
  //    make the Request Europe/London
  Response response= await get('http://worldtimeapi.org/api/timezone/$url');
  Map data =jsonDecode(response.body);
  //print(data);
  //Get Properties From Data
  String dateTime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
//  print(dateTime);
//  print(offset);

  //Create dateTime Object
  DateTime now =DateTime.parse(dateTime);
  //print(now);
  now = now.add(Duration(hours: int.parse(offset)));
  // print(now);

  //set Time Property
  isDayTime =now.hour>6 && now.hour<23 ? true :false;
  time=DateFormat.jm().format(now);
}
catch(e){
  print('Error:$e');
  time="Try Later";
}

}




}