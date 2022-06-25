enum AppFonts { regular, medium, bold, thin }

extension AppFontsExt on AppFonts {
  String get fontName {
    switch (this) {
      case AppFonts.medium:
        return 'RubikMoonrocks';
      case AppFonts.bold:
        return 'RubikMoonrocks';
      case AppFonts.thin:
        return 'RubikMoonrocks';
      case AppFonts.regular:
        return 'RubikMoonrocks';
    }
  }
}
