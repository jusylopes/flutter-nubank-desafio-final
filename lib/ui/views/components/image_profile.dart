import 'package:flutter/widgets.dart';
import 'package:widget_mask/widget_mask.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WidgetMask(
        blendMode: BlendMode.dstIn,
        childSaveLayer: true,
        mask: Image.asset(
          'assets/images/profileMask.png',
        ),
        child: Image.asset(
          'assets/images/imageProfile.jpg',
        ),
      ),
    );
  }
}