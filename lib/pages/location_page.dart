import 'package:flutter/material.dart';
import 'package:weather/constants/app_constants.dart';
import 'package:weather/pages/city_page.dart';
import 'package:weather/widgets/location_button_card.dart';
import 'package:weather/widgets/reusable_card.dart';
import 'package:weather/widgets/temperature_card.dart';

import '../models/weather.dart';
import '../viewmodels/weather_viewmodel.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool isLoading = false;
  WeatherModel? model;
  final weatherViewModel = WeatherViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0,
        title: Text(kLocationPageTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LocationButtonCard(
                              onpressed: () async {
                                isLoading = true;
                                setState(() {});
                                bool isPermitted = await weatherViewModel
                                    .getRequestPermission();
                                if (isPermitted == true) {
                                  model = await weatherViewModel
                                      .getMyLocationFormDevice();
                                }
                                isLoading = false;
                                setState(() {});
                              },
                              icon: Icons.near_me),
                          LocationButtonCard(
                              onpressed: () async {
                                String? cityName = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CityPage();
                                    },
                                  ),
                                );

                                if (cityName != null) {
                                  isLoading = true;
                                  setState(() {});
                                  model = await weatherViewModel
                                      .currentWeatherByCityName(cityName);
                                }
                                isLoading = false;
                                setState(() {});
                              },
                              icon: Icons.location_city),
                        ],
                      ),
                      TemperatureCard(
                        icon: Icons.location_on,
                        temperature:
                            '${model?.main?.temp!.toStringAsFixed(2) ?? '0'} C',
                        city: '${model?.name ?? kLocation}',
                        color: kSecondaryColor,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ReusableCard(
                            name: kLatitude,
                            value: '${model?.coord?.lat ?? ''}',
                            color: kSecondaryColor,
                          )),
                          Expanded(
                              child: ReusableCard(
                            name: kLongtitude,
                            value: '${model?.coord?.lon ?? ''}',
                            color: kSecondaryColor,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ReusableCard(
                            name: kMain,
                            value: '${model?.weather![0].main ?? ''}',
                            color: kSecondaryColor,
                          )),
                          Expanded(
                              child: ReusableCard(
                            name: kDescription,
                            value: '${model?.weather![0].description ?? ''}',
                            color: kSecondaryColor,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ReusableCard(
                            name: kCountry,
                            value: '${model?.sys?.country ?? ''}',
                            color: kSecondaryColor,
                          )),
                          Expanded(
                              child: ReusableCard(
                            name: kSunset,
                            value: '${model?.sys?.sunset ?? ''}',
                            color: kSecondaryColor,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ReusableCard(
                            name: kSunrise,
                            value: '${model?.sys?.sunrise ?? ''}',
                            color: kSecondaryColor,
                          )),
                          Expanded(
                              child: ReusableCard(
                            name: kTimeZone,
                            value: '${model?.timezone ?? ''}',
                            color: kSecondaryColor,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ReusableCard(
                            name: kBase,
                            value: '${model?.base ?? ''}',
                            color: kSecondaryColor,
                          )),
                          Expanded(
                              child: ReusableCard(
                            name: kVisibility,
                            value: '${model?.visibility ?? ''}',
                            color: kSecondaryColor,
                          )),
                        ],
                      ),
                    ]),
        ),
      ),
    );
  }
}
