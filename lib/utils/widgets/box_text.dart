import 'package:flutter/material.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/styles.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign alignment;

  const BoxText.headingOne(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading1Style,
        alignment = align,
        super(key: key);
  const BoxText.headingOneWhite(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading1Stylewhite,
        alignment = align,
        super(key: key);
  const BoxText.headingTwo(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading2Style,
        alignment = align,
        super(key: key);
  const BoxText.headingThree(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = heading3Style,
        alignment = align,
        super(key: key);
  const BoxText.headline(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = headlineStyle,
        alignment = align,
        super(key: key);
  const BoxText.subheading(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = subheadingStyle,
        alignment = align,
        super(key: key);
  const BoxText.caption(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = captionStyle,
        alignment = align,
        super(key: key);
  const BoxText.inkedText(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = inkedTextStyle,
        alignment = align,
        super(key: key);
  const BoxText.blackText(this.text,
      {Key? key, TextAlign align = TextAlign.start})
      : style = blackTextStytle,
        alignment = align,
        super(key: key);

  BoxText.body(this.text,
      {Key? key,
      Color color = kcMediumGreyColor,
      TextAlign align = TextAlign.start})
      : style = bodyStyle.copyWith(color: color),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}
