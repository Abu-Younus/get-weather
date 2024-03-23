import 'package:flutter/material.dart';
import 'package:weather/constants/app_constants.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

TextEditingController cityTxtController = TextEditingController();

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_new, color: kAccentColor,),
        title: Text(kCityPageTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cityTxtController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                  hintText: kCityTextEditorText,
                  fillColor: kSecondaryColor,
                  filled: true,
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: kMediumSpacer,
            ),
            InkWell(
              onTap: () {
                if (cityTxtController.text == '') {
                  print('Please enter your city');
                } else {
                  Navigator.pop(context, cityTxtController.text);
                }
              },
              child: Container(
                width: 180,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSmallPaMa),
                  color: kPrimaryDarkColor,
                ),
                child: Center(child: Text(kSearchWeatherButton, style: kSmallTextStyle,)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
