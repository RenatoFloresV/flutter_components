import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 150;
  bool _blockedCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Page'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(children: [
          _createSlider(),
          _createCheckBox(),
          _createSwitch(),
          Expanded(
            child: _createImage(),
          )
        ]),
      ),
    );
  }

  _createSlider() {
    return Slider(
      activeColor: const Color.fromARGB(255, 163, 43, 34),
      label: 'Image Size',
      value: _valueSlider,
      min: 150,
      max: 300,
      onChanged: (_blockedCheck)
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  _createImage() {
    return Image(
      image: const NetworkImage(
        'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
      ),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  _createCheckBox() {
    String statusCheck = _blockedCheck ? 'Block' : 'Unblock';
    return CheckboxListTile(
        activeColor: const Color.fromARGB(255, 163, 43, 34),
        title: Text(statusCheck),
        value: _blockedCheck,
        onChanged: (value) {
          setState(() {
            _blockedCheck = value!;
          });
        });
  }

  _createSwitch() {
    String statusCheck = _blockedCheck ? 'Block' : 'Unblock';

    return SwitchListTile(
      // selectedTileColor: Colors.green,
      activeColor: const Color.fromARGB(255, 163, 43, 34),
      title: Text(statusCheck),
      value: _blockedCheck,
      onChanged: (value) {
        setState(() {
          _blockedCheck = value;
        });
      },
    );
  }
}
