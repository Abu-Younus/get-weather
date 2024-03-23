import 'package:flutter/material.dart';

class LocationButtonCard extends StatelessWidget {
  final Function()? onpressed;
  final IconData? icon;

  const LocationButtonCard({
    super.key,
    this.onpressed,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onpressed, icon: Icon(icon));
  }
}