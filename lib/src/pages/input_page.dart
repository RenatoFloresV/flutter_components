import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '',
      _email = '',
      _password = '',
      _date = '',
      _selectGender = 'Apache Helicopter';
  final List _gender = ['Male', 'Female', 'Apache Helicopter'];

  final TextEditingController _inputFieldDateController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _createInput(),
          const Divider(),
          _createEmail(),
          const Divider(),
          _createPassword(),
          const Divider(),
          _createDate(),
          const Divider(),
          _createDropdown(),
          _createUser(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Hint Text',
        labelText: 'Label Text',
        helperText: 'Helper Text',
        counter: Text('Count ${_name.length}'),
        suffixIcon: const Icon(Icons.accessibility),
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Hint Text',
          labelText: 'Label Text',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email),
        ),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _createPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Hint Text',
          labelText: 'Label Text',
          suffixIcon: const Icon(Icons.password),
          icon: _password.isEmpty
              ? const Icon(Icons.lock_open)
              : const Icon(Icons.lock),
        ),
        onChanged: (value) => setState(() {
              _password = value;
            }));
  }

  _createDate() {
    return TextField(
        controller: _inputFieldDateController,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Hint Text',
          labelText: 'Label Text',
          suffixIcon: const Icon(Icons.calendar_today),
          icon: const Icon(Icons.calendar_today),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        });
  }

  void _selectDate(BuildContext context) async {
    DateTime? picket = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );
    if (picket != null) {
      setState(() {
        _date = DateFormat.yMMMEd().format(picket);
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> _getOptionsDropDown() {
    List<DropdownMenuItem<String>> items = [];

    for (var element in _gender) {
      items.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    }
    return items;
  }

  Widget _createDropdown() {
    return Row(
      children: [
        const Icon(Icons.g_mobiledata_outlined),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField(
            isExpanded: true,
            focusColor: Colors.white,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            borderRadius: BorderRadius.circular(20),
            value: _selectGender,
            items: _getOptionsDropDown(),
            onChanged: (String? value) {
              setState(() {
                _selectGender = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  _createUser() {
    String securityLevel = '';
    if (_password.length >= 8) {
      securityLevel = 'Secure';
    } else if (_password.length < 8 && _password.isNotEmpty) {
      securityLevel = 'Insecure';
    } else {
      securityLevel = 'Empty';
    }
    return Column(children: [
      ListTile(
          title: Text('Name: $_name'),
          subtitle: Text('Email: $_email'),
          trailing: Text(_selectGender)),
      ListTile(
          title: Row(
        children: [
          const Text('Security Level: '),
          Text(securityLevel,
              style: TextStyle(
                color: securityLevel == 'Secure' ? Colors.green : Colors.red,
                fontWeight: FontWeight.w900,
              )),
        ],
      )),
    ]);
  }
}
