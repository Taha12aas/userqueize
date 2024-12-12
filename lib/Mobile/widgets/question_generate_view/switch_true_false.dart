import 'package:flutter/material.dart';

class SwitchTrueFalse extends StatefulWidget {
  const SwitchTrueFalse({super.key});

  @override
  State<SwitchTrueFalse> createState() => _SwitchTrueFalseState();
}

class _SwitchTrueFalseState extends State<SwitchTrueFalse> {
   bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      activeColor: Colors.orange, 
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.black26,
    );
  }
}