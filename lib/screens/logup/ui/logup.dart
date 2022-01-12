import 'package:flutter/material.dart';
import 'package:recyclo/screens/logup/ui/widgets/logup_input.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';

class LogUp extends StatelessWidget {
  const LogUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        children: const [
          verticalSpaceSmall,
          verticalSpaceSmall,
          LogupInput(),
        ],
      ),
    );
  }
}
