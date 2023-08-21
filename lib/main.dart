import 'package:app_akademie_exercises/4.5.3-4.6.1/screens/NavigatorExercise/navigator.dart';
import 'package:app_akademie_exercises/4.5.3-4.6.1/screens/NavigatorExercise/navigator_details.dart';
import 'package:app_akademie_exercises/4.5.3-4.6.1/screens/column_row.dart';
import 'package:app_akademie_exercises/4.5.3-4.6.1/screens/listview.dart';
import 'package:app_akademie_exercises/4.5.3-4.6.1/screens/sized_box.dart';
import 'package:app_akademie_exercises/4.5.3-4.6.1/screens/weather_app.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/animation_exercise.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/cardswipe_package_exercise.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/home_page.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/material_button_page.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/blob_package_exercise.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/profile.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/screens/switch_class.dart';
import 'package:app_akademie_exercises/5.1.3-3.1/screens/box_decoration.dart';
import 'package:app_akademie_exercises/5.1.3-3.1/screens/font_exercise.dart';
import 'package:app_akademie_exercises/5.1.3-3.1/screens/image_exercise.dart';
import 'package:app_akademie_exercises/5.1.3-3.1/screens/light_dark_exercise.dart';
import 'package:app_akademie_exercises/styles/text_theme.dart';
import 'package:app_akademie_exercises/styles/theme_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void callBackFunction(bool switchOn) {
    setState(() {
      isDarkMode = switchOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appAkademieColor.primaryColor,
        textTheme: appAkademieTextTheme,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      title: 'Combined Exercises',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/weather_app': (context) =>
            WeatherApp(weatherData: WeatherData('Berlin', 25, 'sunny')),
        '/column_row': (context) => const MyColumnRowPage(),
        '/sized_box': (context) => const MySizedBoxPage(),
        '/list_view': (context) => MyListViewPage(),
        '/navigator': (context) => MyNavigatorPage(),
        '/navigator_details': (context) => const DetailsScreen(),
        '/switch_exercise': (context) => const SwitchExercisePage(),
        '/animal_profile': (context) => const AnimalProfilePage(),
        '/material_button': (context) => const MyCustomButtonPage(),
        '/animation_exercise': (context) => const AnimationPage(),
        '/blob_package_exercise': (context) => const BlobPackageExercise(),
        '/cardswipe_package_exercise': (context) => CardSwipePackage(),
        '/font_exercise': (context) => const FontExercisePage(),
        '/light_dark_exercise': (context) =>
            LightDarkExercise(callBackFunction: callBackFunction),
        '/box_decoration': (context) => const BoxDecoExercise(),
        '/image_exercise': (context) => const ImageExercise(),
      },
    );
  }
}
