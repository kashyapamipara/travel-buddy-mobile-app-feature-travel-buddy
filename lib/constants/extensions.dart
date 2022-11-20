import 'package:flutter/material.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
}
