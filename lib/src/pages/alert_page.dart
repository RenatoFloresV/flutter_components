import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(5),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
          onPressed: () => _mostrarAlert(context),
          child: const Text('Show alert'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.keyboard_return),
          onPressed: () => Navigator.of(context).pop()),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: const Text('Title'),
          content: const FlutterLogo(
            size: 150,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
