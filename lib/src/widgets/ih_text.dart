import 'package:flutter/widgets.dart';
import 'package:in_harmony/src/shared/colors.dart';
import 'package:in_harmony/src/shared/styles.dart';

class IHText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const IHText.headingOne(this.text) : style = heading1Style;
  const IHText.headingTwo(this.text) : style = heading2Style;
  const IHText.headingThree(this.text) : style = heading3Style;
  const IHText.headline(this.text) : style = headlineStyle;
  const IHText.subheading(this.text) : style = subheadingStyle;
  const IHText.caption(this.text) : style = captionStyle;

  IHText.body(this.text, {Color color = kcMediumGreyColor})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
