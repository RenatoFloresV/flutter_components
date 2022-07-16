import 'package:flutter/material.dart';
import '../src/pages/alert_page.dart';
import '../src/pages/animated_container_page.dart';
import '../src/pages/avatar_page.dart';
import '../src/pages/card_page.dart';
import '../src/pages/home_page.dart';
import '../src/pages/input_page.dart';
import '../src/pages/list_view_page.dart';
import '../src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animated_container': (BuildContext context) =>
        const AnimatedContainerPage(),
    'input': (BuildContext context) => const InputPage(),
    'slider': (BuildContext context) => const SliderPage(),
    'list': (BuildContext context) => const ListViewPage(),
  };
}
