
import 'package:flutter/material.dart';
import 'package:weather/constants/app_constants.dart';

class TemperatureCard extends StatelessWidget {
  final String? temperature;
  final IconData? icon;
  final String? city;
  final Color? color;

  const TemperatureCard({
    super.key,
    @required this.icon,
    @required this.temperature,
    @required this.city,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(kLargePaMa),
      margin: EdgeInsets.all(kMediumPaMa),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPaMa)
      ),
      child: Column(
        children: [
          Text(temperature??'', style: kLargeTextStyle,),
          SizedBox(height: kLargeSpacer,),
          Icon(icon),
          SizedBox(height: kMediumSpacer,),
          Text(city??'', style: kMediumTextStyle,),
        ],
      ),
    );
  }
}