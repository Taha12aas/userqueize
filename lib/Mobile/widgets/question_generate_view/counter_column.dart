import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';

class CounterColumn extends StatefulWidget {
  const CounterColumn(
      {super.key,
      required this.title,
      required this.counterValue,
      required this.maxValue,
      });
  final String title;
  final int counterValue;
  final int maxValue;

  @override
  State<CounterColumn> createState() => _CounterColumnState();
}

class _CounterColumnState extends State<CounterColumn> {
  int currentValue = 0;
  
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
                    if (currentValue > 0) {
                      currentValue -= widget.counterValue;
                    }
                  });
                },
              ),
              Text(
                '$currentValue',
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
                    if (currentValue <= widget.maxValue) {
                      currentValue += widget.counterValue;
                      log(currentValue.toString());
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
