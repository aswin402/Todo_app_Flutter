# 🎨 Theming with FlexColorScheme

Our application leverages [FlexColorScheme](https://pub.dev/packages/flex_color_scheme) to provide a polished, consistent, and highly customizable theme system.

## ✨ Key Features

- **Scheme Variety**: Uses predefined professional color schemes (currently `FlexScheme.shadStone`).
- **Material 3 Ready**: Fully compatible with the latest Material Design standards.
- **Dark Mode**: High-quality dark themes with optimized contrast and reduced eye strain.
- **Consistent Styling**: Global configuration for component borders, radii, and spacing.

## 🛠️ Setup in Project

### AppTheme Class
Located in `lib/themes/app_theme.dart`, this class defines both light and dark themes:
```dart
static ThemeData light = FlexThemeData.light(
  scheme: FlexScheme.shadStone,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  // ... refined sub-themes
);
```

### ThemeController
A lightweight `ThemeController` using `ValueNotifier` allows for global theme switching:
```dart
static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.system);

static void toggleTheme() {
  themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
}
```

## 🌗 Switching Themes
The `AppNavbar` contains a toggle button that interacts with the `ThemeController` to instantly flip the entire application's theme.
