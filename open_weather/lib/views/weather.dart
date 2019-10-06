
import 'dart:async';
import 'package:open_weather/Model/weather.dart';
import 'layout.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  final Future<OpenWeather> post;
  WeatherApp({Key key, this.post}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'interview app',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Interview app'),
          ),
          body: Center(
            child: FutureBuilder<OpenWeather>(
              future: post,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                   return BodyLayout(weatherDetails: snapshot.data);
                } else if (snapshot.hasError) {
                    return CircularProgressIndicator();
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      );
    }
  }
