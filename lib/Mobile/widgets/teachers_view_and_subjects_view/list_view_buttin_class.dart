import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/button_class.dart';

class ListViewButtonClass extends StatelessWidget {
  const ListViewButtonClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        reverse: true,
        padding: const EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return ButtonClass(
            text: 'صف اول',
            onTap: () {
              
            },
          );
        },
      ),
    );
  }
}
