import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
        image: const AssetImage(klogo),
        fit: BoxFit.contain,
        width: MediaQuery.sizeOf(context).width * .7);
  }
}
