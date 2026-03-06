import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.shadStone,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      cardRadius: 20,
      inputDecoratorRadius: 12,
      fabRadius: 16,
      elevatedButtonRadius: 16,
      // Refined sub themes
      appBarBackgroundSchemeColor: SchemeColor.primaryContainer,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );

  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.shadStone,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      cardRadius: 20,
      inputDecoratorRadius: 12,
      fabRadius: 16,
      elevatedButtonRadius: 16,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}
