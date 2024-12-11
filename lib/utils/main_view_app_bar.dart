import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/home_view/DropDownSearch/show_custom_drop_down_search.dart';

PreferredSizeWidget mainViewAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(55),
    child: Container(
      decoration: const BoxDecoration(
        color: Color(0xff373737),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Keep buttons on the edges
        crossAxisAlignment: CrossAxisAlignment.end, // Align items to the bottom
        children: [
          IconButton(
            tooltip: 'search',
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showCustomDropDownSearch(context);
            },
          ),
        ],
      ),
    ),
  );
}
