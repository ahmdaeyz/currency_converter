import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';

class Flag extends StatelessWidget {
  const Flag({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  final String? url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ScalableImageWidget.fromSISource(
        si: ScalableImageSource.fromSvgHttpUrl(Uri.parse(url ?? "")),
        fit: BoxFit.fill,
        onLoading: (_) => Icon(
          Icons.flag_circle_outlined,
          size: height,
        ),
        onError: (_) => Icon(
          Icons.flag_circle_outlined,
          size: height,
        ),
      ),
    );
  }
}
