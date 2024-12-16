
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/button_class.dart';

class CustomButtonClass extends StatelessWidget {
  const CustomButtonClass({
    super.key, required this.title,
  });
 final String title;
  @override
  Widget build(BuildContext context,) {
   
    return Flexible(
      child: SizedBox(
        height: 60,
        child: ButtonClass(
          text: title,
          onTap: () {},
        ),
      ),
    );
  }
}
