import 'package:flutter/material.dart';
import 'package:weather/constants/app_constants.dart';

class ReusableCard extends StatelessWidget {
  final String? name;
  final String? value;
  final Color? color;

  const ReusableCard({
    super.key,
    this.name,
    this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(kMediumPaMa),
      margin: EdgeInsets.symmetric(horizontal: kMediumPaMa, vertical: kSmallPaMa),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kSmallPaMa)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name??'',textAlign: TextAlign.center, style: kMediumTextStyle,),
          Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: kAccentColor,
          ),
          SizedBox(height: kSmallSpacer,),
          Text(value??'', textAlign: TextAlign.center, style: kSmallTextStyle,),
        ],
      ),
    );
  }
}
