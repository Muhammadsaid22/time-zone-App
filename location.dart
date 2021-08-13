import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'ita.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'ger.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'aus.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'ch.png'),
    WorldTime(url: 'Asia/Tashkent', location: 'Tashkent', flag: 'uzb.jpg'),
    WorldTime(url: 'Asia/Riyadh', location: 'Riyadh', flag: 'ksa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'can.jpg'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'esp.png'),


  ];
  void updateTime(index) async  {
    WorldTime vaqt = locations[index];
    await vaqt.getTime();
    Navigator.pop(context, {
      'location': vaqt.location,
      'flag': vaqt.flag,
      'time': vaqt.time,
      'isDayTime': vaqt.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Choose the location'),
          centerTitle: true,
          elevation: 0,
        ),
        body:
        ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('flags/${locations[index].flag}'),
                    ),
                  )
              ),
            );
          },
        )
    );
  }
}
