import 'package:app_akademie_exercises/5.1.1-1.2/classes/chapter.dart';
import 'package:app_akademie_exercises/5.1.1-1.2/classes/exercise.dart';

final List<Chapter> chapters = [
  Chapter(
    title: 'Kapitel 4 Slides 5.3-6.1',
    exercises: [
      Exercise(name: 'Weather App', route: '/weather_app'),
      Exercise(name: 'Column / Row', route: '/column_row'),
      Exercise(name: 'Sized Box', route: '/sized_box'),
      Exercise(name: 'List View', route: '/list_view'),
      Exercise(name: 'Navigator', route: '/navigator'),
    ],
  ),
  Chapter(
    title: 'Kapitel 5 Slides 1.1-1.2',
    exercises: [
      Exercise(name: 'Column / Row / Switch', route: '/switch_exercise'),
      Exercise(name: 'Profile / Steckbrief / Styles', route: '/animal_profile'),
      Exercise(name: 'Material Button', route: '/material_button'),
      Exercise(name: 'Animation / TextStyle', route: '/animation_exercise'),
      Exercise(name: 'Package / blobs', route: '/blob_package_exercise'),
      Exercise(
          name: 'Package / card_swiper', route: '/cardswipe_package_exercise'),
    ],
  ),
  Chapter(
    title: 'Kapitel 5 Slides 1.3-3.1',
    exercises: [
      Exercise(name: 'Assets / Fonts', route: '/font_exercise'),
      Exercise(
          name: 'Light- / Darkmode / Switch', route: '/light_dark_exercise'),
      Exercise(name: 'Box Decoration / Grid View', route: '/box_decoration'),
      Exercise(
          name: 'Images: Asset / Network / Cache', route: '/image_exercise'),
      Exercise(name: 'Images: Placeholder', route: '/image_exercise2'),
      Exercise(name: 'Images: Thumbnail', route: '/image_exercise3'),
      Exercise(name: 'Camera', route: '/camera_exercise'),
      Exercise(name: 'Multi-Image-Layout', route: '/multi_image_exercise'),
      Exercise(
          name: 'Exception Error / Multi-Image_Layout',
          route: '/exception_error'),
      Exercise(name: 'Error / Exception', route: '/exception_error2'),
      Exercise(name: 'Logging', route: '/logging'),
      Exercise(name: 'Async', route: '/async'),
      Exercise(name: 'Traffic Light', route: '/traffic')
    ],
  )
];
