import 'package:flutter/material.dart';

class IconWeather extends StatelessWidget {
  final String desc;

  IconWeather(this.desc);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Container(
      child: Column(
    children: [
      if(now.hour > 6 && now.hour < 21 && desc == 'clear sky')
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            child: Icon(Icons.sunny, color: Colors.amberAccent, size: 140,),
          ),
        ),
      if(now.hour < 6 && now.hour > 21 && desc == 'clear sky')
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            child: Icon(Icons.nightlight_round, color: Colors.amberAccent, size: 140,),
          ),
        ),
      if(now.hour > 6 && now.hour < 21 && desc.contains('clouds'))
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            width: 140,
            height: 140,
            child: Image.network('https://cdn-icons-png.flaticon.com/512/2698/2698213.png'),
          ),
        ),
      if(now.hour < 6 && now.hour > 21 && desc.contains('clouds'))
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            child: Image.network('https://cdn-icons.flaticon.com/png/512/5061/premium/5061105.png?token=exp=1660552493~hmac=baa3c55ccc022114fd2f97d2cb34f60e'),
          ),
        ),
      if(desc.contains('rain'))
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SizedBox(
            width: 140,
            height: 140,
            child: Image.network('https://www.shareicon.net/data/2015/08/18/86966_cloud_512x512.png'),
          ),
        ),
    ],
    ));
  }
}
