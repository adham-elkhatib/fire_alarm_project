import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff270082),
      surfaceTint: Color(0xff5f41d8),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4823c2),
      onPrimaryContainer: Color(0xffe6deff),
      secondary: Color(0xff4b446b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff706891),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff22164d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff433870),
      onTertiaryContainer: Color(0xffdacfff),
      error: Color(0xff97000c),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcd2f2b),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8ff),
      onSurface: Color(0xff1c1a23),
      onSurfaceVariant: Color(0xff484554),
      outline: Color(0xff797586),
      outlineVariant: Color(0xffc9c4d7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff312f39),
      inversePrimary: Color(0xffc9beff),
      primaryFixed: Color(0xffe6deff),
      onPrimaryFixed: Color(0xff1b0062),
      primaryFixedDim: Color(0xffc9beff),
      onPrimaryFixedVariant: Color(0xff4721c0),
      secondaryFixed: Color(0xffe6deff),
      onSecondaryFixed: Color(0xff1c163a),
      secondaryFixedDim: Color(0xffcac1ef),
      onSecondaryFixedVariant: Color(0xff484268),
      tertiaryFixed: Color(0xffe7deff),
      onTertiaryFixed: Color(0xff1d1148),
      tertiaryFixedDim: Color(0xffcbbeff),
      onTertiaryFixedVariant: Color(0xff493e77),
      surfaceDim: Color(0xffddd8e5),
      surfaceBright: Color(0xfffdf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fe),
      surfaceContainer: Color(0xfff1ecf9),
      surfaceContainerHigh: Color(0xffebe6f3),
      surfaceContainerHighest: Color(0xffe6e0ed),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff270082),
      surfaceTint: Color(0xff5f41d8),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4823c2),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff443e64),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff706891),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff22164d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff433870),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c000a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcd2f2b),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8ff),
      onSurface: Color(0xff1c1a23),
      onSurfaceVariant: Color(0xff444150),
      outline: Color(0xff605d6d),
      outlineVariant: Color(0xff7c788a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff312f39),
      inversePrimary: Color(0xffc9beff),
      primaryFixed: Color(0xff765bf0),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5d3fd6),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff776f99),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5e577f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff786ca8),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5f548d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd8e5),
      surfaceBright: Color(0xfffdf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fe),
      surfaceContainer: Color(0xfff1ecf9),
      surfaceContainerHigh: Color(0xffebe6f3),
      surfaceContainerHighest: Color(0xffe6e0ed),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff220074),
      surfaceTint: Color(0xff5f41d8),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff431abc),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff231d41),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff443e64),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff22164d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff433870),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0003),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff252230),
      outline: Color(0xff444150),
      outlineVariant: Color(0xff444150),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff312f39),
      inversePrimary: Color(0xffefe9ff),
      primaryFixed: Color(0xff431abc),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2c0091),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff443e64),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2e274c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff453a72),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2f245a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd8e5),
      surfaceBright: Color(0xfffdf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f1fe),
      surfaceContainer: Color(0xfff1ecf9),
      surfaceContainerHigh: Color(0xffebe6f3),
      surfaceContainerHighest: Color(0xffe6e0ed),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9beff),
      surfaceTint: Color(0xffc9beff),
      onPrimary: Color(0xff30009b),
      primaryContainer: Color(0xff31009d),
      onPrimaryContainer: Color(0xffc2b6ff),
      secondary: Color(0xffcac1ef),
      onSecondary: Color(0xff322b50),
      secondaryContainer: Color(0xff564f77),
      onSecondaryContainer: Color(0xfffbf6ff),
      tertiary: Color(0xffcbbeff),
      onTertiary: Color(0xff33275e),
      tertiaryContainer: Color(0xff2c2057),
      onTertiaryContainer: Color(0xffbaadee),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xffab1316),
      onErrorContainer: Color(0xfffff8f7),
      surface: Color(0xff14121b),
      onSurface: Color(0xffe6e0ed),
      onSurfaceVariant: Color(0xffc9c4d7),
      outline: Color(0xff938ea0),
      outlineVariant: Color(0xff484554),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0ed),
      inversePrimary: Color(0xff5f41d8),
      primaryFixed: Color(0xffe6deff),
      onPrimaryFixed: Color(0xff1b0062),
      primaryFixedDim: Color(0xffc9beff),
      onPrimaryFixedVariant: Color(0xff4721c0),
      secondaryFixed: Color(0xffe6deff),
      onSecondaryFixed: Color(0xff1c163a),
      secondaryFixedDim: Color(0xffcac1ef),
      onSecondaryFixedVariant: Color(0xff484268),
      tertiaryFixed: Color(0xffe7deff),
      onTertiaryFixed: Color(0xff1d1148),
      tertiaryFixedDim: Color(0xffcbbeff),
      onTertiaryFixedVariant: Color(0xff493e77),
      surfaceDim: Color(0xff14121b),
      surfaceBright: Color(0xff3a3842),
      surfaceContainerLowest: Color(0xff0f0d16),
      surfaceContainerLow: Color(0xff1c1a23),
      surfaceContainer: Color(0xff201e27),
      surfaceContainerHigh: Color(0xff2b2932),
      surfaceContainerHighest: Color(0xff36333d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcec3ff),
      surfaceTint: Color(0xffc9beff),
      onPrimary: Color(0xff160054),
      primaryContainer: Color(0xff937dff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcec5f3),
      onSecondary: Color(0xff171034),
      secondaryContainer: Color(0xff938bb6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcfc3ff),
      onTertiary: Color(0xff180a43),
      tertiaryContainer: Color(0xff9488c6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab2),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff544a),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14121b),
      onSurface: Color(0xfffef9ff),
      onSurfaceVariant: Color(0xffcdc8db),
      outline: Color(0xffa5a0b3),
      outlineVariant: Color(0xff858192),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0ed),
      inversePrimary: Color(0xff4823c1),
      primaryFixed: Color(0xffe6deff),
      onPrimaryFixed: Color(0xff110046),
      primaryFixedDim: Color(0xffc9beff),
      onPrimaryFixedVariant: Color(0xff3600ab),
      secondaryFixed: Color(0xffe6deff),
      onSecondaryFixed: Color(0xff120b2f),
      secondaryFixedDim: Color(0xffcac1ef),
      onSecondaryFixedVariant: Color(0xff373156),
      tertiaryFixed: Color(0xffe7deff),
      onTertiaryFixed: Color(0xff13043e),
      tertiaryFixedDim: Color(0xffcbbeff),
      onTertiaryFixedVariant: Color(0xff382d65),
      surfaceDim: Color(0xff14121b),
      surfaceBright: Color(0xff3a3842),
      surfaceContainerLowest: Color(0xff0f0d16),
      surfaceContainerLow: Color(0xff1c1a23),
      surfaceContainer: Color(0xff201e27),
      surfaceContainerHigh: Color(0xff2b2932),
      surfaceContainerHighest: Color(0xff36333d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffef9ff),
      surfaceTint: Color(0xffc9beff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffcec3ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffef9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcec5f3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffef9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcfc3ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab2),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14121b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffef9ff),
      outline: Color(0xffcdc8db),
      outlineVariant: Color(0xffcdc8db),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e0ed),
      inversePrimary: Color(0xff2a008a),
      primaryFixed: Color(0xffeae3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffcec3ff),
      onPrimaryFixedVariant: Color(0xff160054),
      secondaryFixed: Color(0xffeae3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcec5f3),
      onSecondaryFixedVariant: Color(0xff171034),
      tertiaryFixed: Color(0xffebe3ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcfc3ff),
      onTertiaryFixedVariant: Color(0xff180a43),
      surfaceDim: Color(0xff14121b),
      surfaceBright: Color(0xff3a3842),
      surfaceContainerLowest: Color(0xff0f0d16),
      surfaceContainerLow: Color(0xff1c1a23),
      surfaceContainer: Color(0xff201e27),
      surfaceContainerHigh: Color(0xff2b2932),
      surfaceContainerHighest: Color(0xff36333d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
