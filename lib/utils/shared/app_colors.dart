import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF2CCC34);
const Color kcPrimaryColor1 = Color(0xFFB7FFBB);
const Color kcMediumGreyColor = Color(0xff868686);
const Color kcLightGreyColor = Color(0xffe5e5e5);
const Color kcVeryLightGreyColor = Color(0xFFFFFFFF);
const Color kcBlackBackgroundColor = Color(0xFFFFFFFF);
const Color kcLightBackgroundColor = Color(0xFF111111);
var grad2 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.tealAccent.shade200, Colors.tealAccent.shade700]);

var grad1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.tealAccent.shade400, Colors.greenAccent.shade400]);

var grad3 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black.withOpacity(0.08), Colors.black.withOpacity(0.08)]);
