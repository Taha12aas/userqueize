import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/button_class.dart';

class ListViewButtonClass extends StatelessWidget {
  const ListViewButtonClass({
    super.key,
    required this.listClass,
  });
  final List<dynamic> listClass;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        itemCount: listClass.length,
        itemBuilder: (context, index) {
          return ButtonClass(
            text: listClass[index],
            onTap: () {
              
            },
          );
        },
      ),
    );
  }
}
