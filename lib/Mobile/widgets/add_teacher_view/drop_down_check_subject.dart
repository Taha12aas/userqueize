import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';

class DropdownCheckSubject extends StatefulWidget {
  const DropdownCheckSubject({
    super.key,
    required this.items,
    required this.onChanged,
    required this.valueNotifier,
  });
  final List items;
  final Function(String?)? onChanged;
  final ValueNotifier<bool> valueNotifier;
  @override
  State<DropdownCheckSubject> createState() => _DropdownCheckSubjectState();
}

class _DropdownCheckSubjectState extends State<DropdownCheckSubject> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.valueNotifier,
      builder: (context, value, child) {
        return DropdownButtonFormField<String>(
          dropdownColor: Colors.black,
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.orange, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.orange, width: 2.0),
            ),
          ),
          value: selectedValue,
          onChanged: widget.onChanged,
          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  item,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: kOrange, fontSize: 16),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
