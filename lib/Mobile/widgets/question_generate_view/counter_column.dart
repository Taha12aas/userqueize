import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CounterColumn extends StatelessWidget {
  const CounterColumn({
    super.key,
    required this.title,
    required this.counterValue,
    required this.maxValue,
    required this.valueNotifier,
    required this.minValue,
  });
  final String title;
  final int counterValue;
  final int maxValue;
  final int minValue;
  final ValueNotifier<int> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  title,
                  style: FontStyleApp.orangeBold20.copyWith(
                    fontSize: getResponsiveText(context, 18),
                  ),
                ),
              ),
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
                  horizontal: 4,
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
                        if (valueNotifier.value > minValue) {
                          valueNotifier.value -= counterValue;
                        }
                      },
                    ),
                    Text(
                      '${valueNotifier.value}',
                      style: FontStyleApp.orangeBold25.copyWith(
                        fontSize: getResponsiveText(
                          context,
                          25,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_drop_up,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        if (valueNotifier.value <= maxValue) {
                          valueNotifier.value += counterValue;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
