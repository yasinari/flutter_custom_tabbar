import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWith(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get microValue => dynamicHeight(0.005);
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicWith(0.03);
  double get highValue => dynamicHeight(0.06);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingOnlyTopMicro => EdgeInsets.only(top: microValue);
  EdgeInsets get paddingAllow => EdgeInsets.all(lowValue);
}

extension EmpytWidget on BuildContext {
  Widget get emptyWidget => SizedBox(
        height: lowValue,
      );
}

extension ThemeExtension on BuildContext {
  Brightness get brightness => MediaQuery.of(this).platformBrightness;
}
