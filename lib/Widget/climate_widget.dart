//tempo widget temperatura min max
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../models/Climate.dart';


class ClimateWidget extends StatelessWidget {

  final Climate climate;

  ClimateWidget({required Key key, required this.climate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          'http://openweathermap.org/img/wn/${climate.icon}.png',
          fit: BoxFit.fill,
          width: 80.0,
        ),
        Text(
          '${climate.temperature.toStringAsFixed(0)} ºC',
          style: TextStyle(fontSize: 50.0),
        ),
        Text(
          climate.description,
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Min. do dia: ${climate.temperatureMin.toStringAsFixed(0)}",
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
          "Max. do dia: ${climate.temperatureMax.toStringAsFixed(0)}",
          style: TextStyle(fontSize: 16.0),
          textAlign: TextAlign.center,
        ),
        Text(
            "Umidade do ar: ${climate.humidity.toString()}%"
        )
      ],
    );
  }
}