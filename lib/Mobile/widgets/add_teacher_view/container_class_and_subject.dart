import 'package:flutter/material.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ContainerClassAndSubject extends StatelessWidget {
  const ContainerClassAndSubject({
    super.key,
    required this.classs,
    required this.subject,
    this.color,
  });
  final String classs;
  final String subject;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(
            flex: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              subject,
              style: TextStyle(
                  fontSize: getResponsiveText(context, 15), color: Colors.black),
            ),
          ),
          const Spacer(),
          Text(
            classs,
            style: TextStyle(
                fontSize: getResponsiveText(context, 15), color: Colors.black),
          ),
          const Spacer(),

        ],
      ),
    );
  }
}
