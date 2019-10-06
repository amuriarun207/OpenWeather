import 'package:flutter/material.dart';
import 'package:open_weather/Model/weather.dart';
import 'package:open_weather/widgets/header_widget.dart';
import 'package:open_weather/widgets/description_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BodyLayout extends StatefulWidget {
 final OpenWeather weatherDetails;
  BodyLayout({Key key, @required this.weatherDetails}) :super(key: key);
  @override
  _BodyLayoutState createState() => _BodyLayoutState();
  }

class _BodyLayoutState extends State<BodyLayout> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _counterFromPrefes();
  }

  Future<int> _counterFromPrefes() async {
    final prefs = await SharedPreferences.getInstance();
    final counterInitalValue = prefs.getInt('weatherAppCounter');
    if (counterInitalValue == null) {
      return 0;
    }
    setState(() => _counter = counterInitalValue);
    return counterInitalValue;
  }

  Future<void> _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();

    int lastStartupNumber = await _counterFromPrefes();
    int currentStartupNumber = ++lastStartupNumber;

    await prefs.setInt('weatherAppCounter', currentStartupNumber);

    setState(() => _counter = currentStartupNumber);
  }

  @override
  Widget build(BuildContext context) {
  
  final temperature = widget.weatherDetails.main.temp ?? 0;
  final hummidity = widget.weatherDetails.main.humidity ?? 0;

  var addCounterButton = ButtonTheme(
                                minWidth: MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                child: MaterialButton(
                                                    onPressed: () {
                                                                _incrementCounter();
                                                                  },
                                                      color: Colors.blue[300],
                                                      textColor: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                                  borderRadius: new BorderRadius.circular(30.0),
                                                              ),
                                                      child: const Text('Add counter', style: TextStyle(fontSize: 20)),
                                                    ),
                                        );



      var list = <Widget>[
          Container(child:HeaderWidget(title: "Counter"), height: 30,),
          DescriptionWidget(title: "You have hit the button", description: "$_counter times"),
          Container(child:HeaderWidget(title: "Weather"), height: 30,),
          DescriptionWidget(title: "it is currently", description: "$temperature degrees"),
          DescriptionWidget(title: "with a hummidity of ", description: "$hummidity %"),
          addCounterButton,
     ];

      return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
     children: list,
);
  }
}



