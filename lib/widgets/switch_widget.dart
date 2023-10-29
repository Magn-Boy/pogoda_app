import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  SwitchWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.value,
      onChanged: (newState) {
        widget.onChanged(newState);
      },
      activeColor: Colors.black,
      activeTrackColor: Colors.grey[400],
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey[400]
    );
  }
}
