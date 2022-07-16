import 'package:flutter/material.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string_util.dart';
import 'package:provider/provider.dart';

import '../providers/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Components'),
        actions: [
          IconButton(
            icon: theme.getTheme() == ThemeData.dark()
                ? const Icon(Icons.wb_sunny)
                : const Icon(Icons.brightness_3),
            onPressed: () {
              theme.setTheme(theme.getTheme() == ThemeData.dark()
                  ? ThemeData.light()
                  : ThemeData.dark());
            },
          )
        ],
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
        future: menuProvider.loadData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: _createListItems(snapshot.data!, context),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  List<Widget> _createListItems(List<dynamic> data, BuildContext context) {
    return data.map((item) {
      return ListTile(
          title: Text(item['texto']),
          leading: getIcon(item['icon']),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () => Navigator.pushNamed(context, item['ruta']));
    }).toList();
  }
}
