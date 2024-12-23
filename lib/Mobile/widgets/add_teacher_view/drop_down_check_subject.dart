import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';

class DropdownCheckSubject extends StatefulWidget {
  const DropdownCheckSubject({
    super.key,
    required this.items,
  });
  final List<String> items;

  @override
  State<DropdownCheckSubject> createState() => _DropdownCheckSubjectState();
}

class _DropdownCheckSubjectState extends State<DropdownCheckSubject> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
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
          borderSide:
              const BorderSide(color: Colors.orange, width: 2.0), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        ),
      ),
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;

        });
      },
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Align(
            alignment: Alignment.centerRight, 
            child: Text(
              item,
              textAlign: TextAlign.right,
              style: const TextStyle(color: kOrangeColor),
            ),
          ),
        );
      }).toList(),
    );
  }
}
