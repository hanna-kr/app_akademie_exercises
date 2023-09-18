import 'package:app_akademie_exercises/src/presentation/4.5.3-4.6.1/screens/NavigatorExercise/navigator.dart';
import 'package:app_akademie_exercises/src/presentation/4.5.3-4.6.1/screens/NavigatorExercise/navigator_details.dart';
import 'package:app_akademie_exercises/src/presentation/4.5.3-4.6.1/screens/column_row.dart';
import 'package:app_akademie_exercises/src/presentation/4.5.3-4.6.1/screens/listview.dart';
import 'package:app_akademie_exercises/src/presentation/4.5.3-4.6.1/screens/sized_box.dart';
import 'package:app_akademie_exercises/src/presentation/4.5.3-4.6.1/screens/weather_app.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.1-1.2/screens/animation_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.1-1.2/screens/cardswipe_package_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/async_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/error_exception_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/futures.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/futures_two.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/traffic.dart';
import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/screens/database.dart';
import 'package:app_akademie_exercises/src/presentation/5.6%20-%20/screens/database2.dart';
import 'package:app_akademie_exercises/src/presentation/home_page.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.1-1.2/screens/material_button_page.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.1-1.2/screens/blob_package_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.1-1.2/screens/profile.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.1-1.2/screens/switch_class.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/box_decoration.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/camera_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/exception_error.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/font_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/image_details.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/image_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/image_exercise2.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/image_exercise3.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/light_dark_exercise.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/logging.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/multi_image.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/settings.dart';
import 'package:app_akademie_exercises/src/presentation/5.1.3-5.5/screens/settings_languages.dart';
import 'package:app_akademie_exercises/styles/text_theme.dart';
import 'package:app_akademie_exercises/styles/theme_color.dart';

import 'package:flutter/material.dart';

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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
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
        '/image_exercise2': (context) => ImageExercise2(),
        '/image_exercise3': (context) => ImageExercise3(),
        '/camera_exercise': (context) => const CameraExercise(),
        '/multi_image_exercise': (context) => const MultiImageExercise(),
        '/settings': (context) => const SettingsPage(),
        '/languages': (context) => const LanguagePage(),
        '/image_details': (context) => const ImageDetails(),
        '/exception_error': (context) => const ExceptionErrorExercise(),
        '/logging': (context) => const LoggingExercise(),
        '/async': (context) => const AsyncExercise(),
        '/traffic': (context) => const TrafficLight(),
        '/exception_error2': (context) => const ExceptionErrorExercise2(),
        '/futures': (context) => const FutureExercise(),
        '/futures2': (context) => const FutureExercise2(),
        '/database': (context) => const DataBaseExercise(),
        '/database2': (context) => const SaveImageLocallyPage()
      },
    );
  }
}
