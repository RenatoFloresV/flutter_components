import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page '),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL--27dGNYvfui73LzVnVdQKt1mGGxCNv98A&usqp=CAU'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('SL'),
            ),
          ),
        ],
      ),
      body: const Center(
          child: FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage(
            'https://depor.com/resizer/2oXSaQ6bNEzeTXbH_HZOugLPEJA=/580x330/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/KWZE2BTO3NCSTJVEIY7CE4KNKM.jpg'),
        fadeInDuration: Duration(milliseconds: 200),
      )),
    );
  }
}
