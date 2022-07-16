import 'package:flutter/material.dart';
import 'package:flutter_components/routes/routes.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/providers/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(ThemeData.dark()),
      child: const MatertialTheme(),
    );
  }
}

class MatertialTheme extends StatelessWidget {
  const MatertialTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'Flutter Components',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      },
    );
  }
}
