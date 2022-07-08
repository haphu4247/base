enum AppFonts {
  Rubik,
  Roboto,
}

extension AppFontsExt on AppFonts {
  String get fontName {
    switch (this) {
      case AppFonts.Rubik:
        return 'RubikMoonrocks';
      case AppFonts.Roboto:
        return 'Roboto';
    }
  }
}
