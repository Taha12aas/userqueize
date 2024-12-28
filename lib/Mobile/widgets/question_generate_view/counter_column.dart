import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';

class CounterColumn extends StatefulWidget {
  const CounterColumn(
      {super.key, required this.title, required this.counterValue});
  final String title;
  final int counterValue;
  @override
  State<CounterColumn> createState() => _CounterColumnState();
}

class _CounterColumnState extends State<CounterColumn> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title, style: FontStyleApp.orangeBold20),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orange,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    if (_currentValue > 1) _currentValue -= widget.counterValue;
                  });
                },
              ),
              Text(
                '$_currentValue',
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 32,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    if (_currentValue < 50) {
                      _currentValue += widget.counterValue;
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
