import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFF0D47A1);
  static const Color ACCENT_COLOR = Color(0xFF1565C0);
  static const Color ICON_PRIMARY_COLOR = Color(0xFF0D47A1);
  static const Color ICON_ACCENT_COLOR = Color(0xFF1565C0);
  static const Color ORANGE_COLOR = Color(0xFFFF812C);
  static const Color GRAY_COLOR = Color(0xFF666666);
  static const Color CHELSEA_GEM_COLOR = Color(0xFFA56600);
  static const Color BG_COLOR = Color(0xFFF4F6F8);
  static const Color BG_WHITE_COLOR = Color(0xFFFFFFFF);
  static const Color BG_LOAD_COLOR = Color(0xFFe1e5e7);

  static final Random _random = Random();

  static Color next() {
    return Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}
