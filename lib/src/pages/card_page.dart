import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Page'),
        ),
        body: ListView(children: <Widget>[
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context),
          const SizedBox(height: 30),
          _cardTipo1(),
          const SizedBox(height: 30),
          _cardTipo2(context)
        ]));
  }

  Widget _cardTipo1() {
    const title = 'What is Lorem Ipsum?';
    const subTitlee =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.photo_album),
              title: Text(title),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(subTitlee),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2(context) {
    final theme = Provider.of<ThemeProvider>(context);
    const imageExample =
        'https://mir-s3-cdn-cf.behance.net/project_modules/1400/d95a4985136901.5d7275cfd0791.png';
    var card = Column(
      children: <Widget>[
        const FadeInImage(
            // width: double.infinity,
            height: 350,
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(imageExample),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover),
        Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Image from internet')),
      ],
    );
    return Container(
        decoration: BoxDecoration(
          color: theme.getTheme() == ThemeData.dark()
              ? Colors.transparent
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(2, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: card,
        ));
  }
}
