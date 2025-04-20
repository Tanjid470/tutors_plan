import 'package:flutter/material.dart';

import 'color_utils.dart';

class InputBorderStyle {
  static InputBorder errorBorder(double? radius) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 60),
    gapPadding: 1,
    borderSide: BorderSide(width: 1, color: ColorUtils.errorBorderColor),
  );

  static InputBorder focusedBorder(double? radius) => OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(radius ?? 60),
    borderSide: BorderSide(width: 2, color: ColorUtils.competeBorderColor),
  );

  static InputBorder focusedErrorBorder(double? radius) => OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(radius ?? 60),
    borderSide: BorderSide(width: 1, color: ColorUtils.errorBorderColor),
  );

  static InputBorder disabledBorder(double? radius) => OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(radius ?? 60),
    borderSide: const BorderSide(width: 1, color: Colors.black12),
  );

  static InputBorder enabledBorder(double? radius) => OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(radius ?? 60),
    borderSide: BorderSide(width: 2, color: ColorUtils.inputBorderColor),
  );

  static InputBorder border(double? radius, {Color? borderColor}) => OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.all(Radius.circular(radius ?? 60)),
    borderSide: BorderSide(color: borderColor ?? ColorUtils.inputBorderColor, width: 2),
  );

  static InputBorder validBorder(double? radius, {Color? borderColor}) => OutlineInputBorder(
    gapPadding: 1,
    borderRadius: BorderRadius.circular(radius ?? 60),
    borderSide: BorderSide(width: 2, color: borderColor ?? ColorUtils.competeBorderColor),
  );
}
