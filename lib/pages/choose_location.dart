import 'package:flutter/material.dart';
import 'package:time_app/services/api_services.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<ApiService> locations = [
    ApiService(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    ApiService(url: 'Europe/Berlin', location: 'Athens', flag: 'germany.png'),
    ApiService(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),

  ];

  void updateTime(index) async {
    ApiService instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0 ),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}